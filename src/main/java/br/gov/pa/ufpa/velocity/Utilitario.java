package br.gov.pa.ufpa.velocity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.apache.commons.text.WordUtils;

import schemacrawler.schema.Catalog;
import schemacrawler.schema.Column;
import schemacrawler.schema.ForeignKey;
import schemacrawler.schema.ForeignKeyColumnReference;
import schemacrawler.schema.ResultsColumn;
import schemacrawler.schema.ResultsColumns;
import schemacrawler.schema.Schema;
import schemacrawler.schema.Table;
import schemacrawler.schemacrawler.SchemaCrawlerException;
import schemacrawler.schemacrawler.SchemaCrawlerOptions;
import schemacrawler.schemacrawler.SchemaInfoLevelBuilder;
import schemacrawler.utility.SchemaCrawlerUtility;

public final class Utilitario {

    public static Catalog catalogo = Utilitario.obterCatalogo();

    private static Collection<Table> tables = Utilitario.filtroBanco();

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

    public static SchemaCrawlerOptions obterOptions() {

        final SchemaCrawlerOptions options = new SchemaCrawlerOptions();
        options.setSchemaInfoLevel(SchemaInfoLevelBuilder.detailed());

        return options;
    }

    public static Catalog obterCatalogo() {

        Catalog catalog = null;
        final Connection conexao = SingletonConexao.getConexao();
        try {
            catalog = SchemaCrawlerUtility.getCatalog(conexao, Utilitario.obterOptions());
        } catch (final SchemaCrawlerException e) {
            e.printStackTrace();
        }
        return catalog;
    }

    public static Map<ForeignKey, ForeignKeyColumnReference> obterFKs() {

        final Map<ForeignKey, ForeignKeyColumnReference> mapaFK = new LinkedHashMap<>();

        final Collection<Table> tables = Utilitario.tables.stream()
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

        return mapaFK;
    }

    public static Map<String, String> obterDados() {

        Map<String, String> mapa = null;
        try {

            mapa = new LinkedHashMap<>();

            final Collection<Table> tables = Utilitario.tables.stream()
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

    private static Collection<Table> filtroBanco() {

        Collection<Table> resultado = null;

        final String tipoBanco = Banco.obterTipoBanco();
        if (tipoBanco.matches("[mysqlMYSQL]+")) {

            List<Schema> schemas = new ArrayList<>();

            final String schema = Utilitario.catalogo.getJdbcDriverInfo().getConnectionUrl();

            final String regex = "\\d\\/+\\w+";

            final Matcher matcher = Pattern.compile(regex).matcher(schema);

            while (matcher.find()) {
                final String nomeSchema = matcher.group().replaceAll("[\\d\\/]", "");

                schemas = Utilitario.catalogo.getSchemas().stream().filter(s -> s.getFullName().equalsIgnoreCase(nomeSchema))
                                .collect(Collectors.toList());
            }

            resultado = Utilitario.catalogo.getTables(schemas.get(0));

        } else {

            resultado = Utilitario.catalogo.getTables();
        }

        return resultado;
    }
}