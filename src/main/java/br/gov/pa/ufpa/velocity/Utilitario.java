package br.gov.pa.ufpa.velocity;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.text.WordUtils;

import schemacrawler.schema.Catalog;
import schemacrawler.schema.Column;
import schemacrawler.schema.ForeignKey;
import schemacrawler.schema.ForeignKeyColumnReference;
import schemacrawler.schema.ResultsColumn;
import schemacrawler.schema.ResultsColumns;
import schemacrawler.schema.Table;
import schemacrawler.schemacrawler.SchemaCrawlerException;
import schemacrawler.schemacrawler.SchemaCrawlerOptions;
import schemacrawler.schemacrawler.SchemaInfoLevelBuilder;
import schemacrawler.utility.SchemaCrawlerUtility;

public final class Utilitario {

    private Utilitario() {

    }

    public static void obterExport(final Table tabela) {

        if (!tabela.getExportedForeignKeys().isEmpty()) {

            System.out.println(tabela.getName().toUpperCase() + " EXPORTA:");
            for (final ForeignKey element : tabela.getExportedForeignKeys()) {
                System.out.println("reference: " + element.getColumnReferences());
                System.out.println("tipo: " + element.getConstraintType());
                System.out.println("name: " + element.getName());
            }
        }
    }

    public static void obterImport(final Table tabela) {

        if (!tabela.getImportedForeignKeys().isEmpty()) {

            System.out.println(tabela.getName().toUpperCase() + " IMPORTA");
            for (final ForeignKey element : tabela.getImportedForeignKeys()) {
                System.out.println("reference: " + element.getColumnReferences());
                System.out.println("tipo: " + element.getConstraintType());
                System.out.println("name: " + element.getName());
            }
        }
    }

    public static boolean obterAssociacao(final Column coluna) {

        boolean manytoone = false;
        if (!coluna.getParent().getForeignKeys().isEmpty()) {
            for (final ForeignKey fk : coluna.getParent().getImportedForeignKeys()) {
                for (final ForeignKeyColumnReference fkref : fk.getColumnReferences()) {
                    if (fkref.getForeignKeyColumn().getName().equalsIgnoreCase(coluna.getName())) {
                        manytoone = true;
                    }
                }
            }
        }
        return manytoone;

    }

    public static String removeUnderline(String nomeColuna) {

        if (nomeColuna.contains("_")) {

            final String[] nomes = nomeColuna.split("_");

            for (int i = 0; i < nomes.length; i++) {

                if (i == 0) {
                    nomeColuna = nomes[i].toLowerCase();
                } else {
                    nomeColuna += WordUtils.capitalize(nomes[i]);
                }
            }
        }
        return nomeColuna;
    }

    public static boolean precisaClasseId(final Table tabela) {

        return tabela.hasPrimaryKey()
                        && (tabela.getPrimaryKey().getColumns().size() > 1);
    }

    private static SchemaCrawlerOptions obterOptions() {

        final SchemaCrawlerOptions options = new SchemaCrawlerOptions();
        options.setSchemaInfoLevel(SchemaInfoLevelBuilder.detailed());

        return options;
    }

    public static Catalog obterCatalogo() throws SchemaCrawlerException {

        return SchemaCrawlerUtility.getCatalog(SingletonConexao.getConexao(), Utilitario.obterOptions());
    }

    public static Map<ForeignKey, ForeignKeyColumnReference> obterFKs() {

        final Map<ForeignKey, ForeignKeyColumnReference> mapaFK = new LinkedHashMap<>();

        try {

            final Catalog catalogo = Utilitario.obterCatalogo();

            final Collection<Table> tables = catalogo.getTables().stream()
                            .sorted(Comparator.comparing(Table::getSchema)
                                            .thenComparing(Table::getName))
                            .collect(Collectors.toList());

            for (final Table tabela : tables) {
                // System.out.println(tabela.getName());
                final Collection<ForeignKey> importedForeignKeys = tabela.getImportedForeignKeys();
                for (final ForeignKey importedFK : importedForeignKeys) {
                    final List<ForeignKeyColumnReference> columnReferences = importedFK.getColumnReferences();
                    for (final ForeignKeyColumnReference FKCR : columnReferences) {
                        mapaFK.put(importedFK, FKCR);
                        // System.out.println(importedFK + "\t" + FKCR);
                    }
                }
                // System.out.println();
            }

        } catch (final SchemaCrawlerException e) {
            e.printStackTrace();
        }

        return mapaFK;
    }

    public static Map<String, String> obterDados() {

        Catalog catalogo;
        Map<String, String> mapa = null;
        try {

            mapa = new LinkedHashMap<>();

            catalogo = Utilitario.obterCatalogo();

            final Collection<Table> tables = catalogo.getTables().stream()
                            .sorted(Comparator.comparing(Table::getSchema))
                            .collect(Collectors.toList());

            List<Object> dados = null;
            List<Object> registro = null;

            StringBuilder sbTable = null;
            StringBuilder sbDado = null;

            for (final Table table : tables) {

                final String schema = table.getSchema().getFullName();
                if (!schema.equalsIgnoreCase("phpmyadmin") &&
                                !schema.equalsIgnoreCase("sys") &&
                                !schema.equalsIgnoreCase("information_schema")) {

                    registro = new ArrayList<>();
                    final String sql = "select * from " + table.getFullName() + ";";

                    final PreparedStatement statement = SingletonConexao.getConexao().prepareStatement(sql);

                    final ResultSet resultSet = statement.executeQuery();

                    final ResultsColumns resultsColumns = SchemaCrawlerUtility.getResultsColumns(resultSet);
                    final List<ResultsColumn> columns = resultsColumns.getColumns();

                    while (resultSet.next()) {

                        dados = new ArrayList<>();

                        for (final ResultsColumn coluna : columns) {
                            final String name = coluna.getName();
                            final Object dado = resultSet.getObject(name);
                            dados.add(dado);
                        }

                        sbDado = new StringBuilder();

                        sbDado
                                        .append("(")
                                        .append(dados
                                                        .stream()
                                                        .map(f -> {
                                                            final StringBuilder sb = new StringBuilder();
                                                            if (Number.class.isAssignableFrom(f.getClass()) || (f == null)) {
                                                                sb.append(f);
                                                            } else {
                                                                sb.append("'")
                                                                                .append(f)
                                                                                .append("'");
                                                            }
                                                            return sb.toString();
                                                        }).collect(Collectors.joining(", ")))
                                        .append(")");

                        registro.add(sbDado.toString());
                    }

                    if (!registro.isEmpty()) {
                        sbTable = new StringBuilder();

                        final String collectTabela = columns.stream()
                                        .map(f -> f.getName())
                                        .collect(Collectors.joining(", "));

                        sbTable.append(table.getFullName())
                                        .append(" (")
                                        .append(collectTabela)
                                        .append(")");
                        // System.out.println(sbTable.toString());

                        final String collectRegistro = registro
                                        .stream()
                                        .map(f -> f.toString())
                                        .collect(Collectors.joining(",\n"));
                        // System.out.println(collectRegistro);

                        mapa.put(sbTable.toString(), collectRegistro);
                    }
                }

            }
        } catch (final SchemaCrawlerException | SQLException e) {

            e.printStackTrace();

        }
        return mapa;

    }
}