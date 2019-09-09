package br.gov.pa.ufpa.velocity;

import java.sql.Connection;

import org.apache.commons.text.WordUtils;

import schemacrawler.schema.Catalog;
import schemacrawler.schema.Column;
import schemacrawler.schema.ForeignKey;
import schemacrawler.schema.ForeignKeyColumnReference;
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

    public static Catalog obterCatalogo(final Connection conexao) throws SchemaCrawlerException {

        // seta options
        final SchemaCrawlerOptions options = new SchemaCrawlerOptions();
        options.setSchemaInfoLevel(SchemaInfoLevelBuilder.standard());

        // Conecta
        final Catalog catalog = SchemaCrawlerUtility.getCatalog(conexao, options);
        return catalog;
    }
}