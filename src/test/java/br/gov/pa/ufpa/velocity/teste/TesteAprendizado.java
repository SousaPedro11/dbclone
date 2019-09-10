package br.gov.pa.ufpa.velocity.teste;

import java.sql.Connection;
import java.util.Collection;

import org.testng.annotations.Test;

import br.gov.pa.ufpa.velocity.SingletonConexao;
import br.gov.pa.ufpa.velocity.Utilitario;
import schemacrawler.schema.Catalog;
import schemacrawler.schema.Column;
import schemacrawler.schema.ForeignKey;
import schemacrawler.schema.ForeignKeyColumnReference;
import schemacrawler.schema.Schema;
import schemacrawler.schema.Table;
import schemacrawler.schemacrawler.SchemaCrawlerException;
import schemacrawler.schemacrawler.SchemaCrawlerOptions;
import schemacrawler.schemacrawler.SchemaInfoLevelBuilder;
import schemacrawler.utility.SchemaCrawlerUtility;

public class TesteAprendizado {

    private static final boolean Habilitado = true;

    private final Connection conexao = SingletonConexao.getConexao();

    private SchemaCrawlerOptions obterOptions() {

        final SchemaCrawlerOptions options = new SchemaCrawlerOptions();
        options.setSchemaInfoLevel(SchemaInfoLevelBuilder.detailed());

        return options;
    }

    private Catalog obterCatalogo() throws SchemaCrawlerException {

        return SchemaCrawlerUtility.getCatalog(this.conexao, this.obterOptions());
    }

    @Test(enabled = !TesteAprendizado.Habilitado)
    private void imprimirSchemas() {

        try {
            for (final Schema schema : this.obterCatalogo().getSchemas()) {
                System.out.println("nome: " + schema.getName());
            }
        } catch (final SchemaCrawlerException e) {
            e.printStackTrace();
        }
    }

    @Test(enabled = !TesteAprendizado.Habilitado)
    private void imprimirTabelaPorSchema() {

        final String nome = "agendamento";

        try {
            for (final Schema element : this.obterCatalogo().getSchemas()) {

                if (element.getName().equalsIgnoreCase(nome)) {

                    final Collection<Table> tables = this.obterCatalogo().getTables(element);

                    if (!tables.isEmpty()) {

                        System.out.println("SCHEMA:\t".concat(element.getName()));
                        for (final Table tabela : tables) {
                            System.out.println("TABELA:\t".concat(tabela.getName()));
                            for (final Column coluna : tabela.getColumns()) {
                                System.out.println(coluna.getName() + " " + coluna.getType() + "(" + coluna.getSize() + ")");
                            }
                            for (final ForeignKey fk : tabela.getForeignKeys()) {
                                for (final ForeignKeyColumnReference fkCol : fk.getColumnReferences()) {
                                    System.out.println(fkCol.getPrimaryKeyColumn().getParent() + " : " +
                                                    fkCol.getForeignKeyColumn().getParent());
                                    System.out.println(fkCol.getPrimaryKeyColumn().getFullName() + " : " +
                                                    fkCol.getForeignKeyColumn().getFullName());
                                }
                            }
                            System.out.println();
                        }
                        break;
                    }
                }
            }
        } catch (final SchemaCrawlerException e) {
            e.printStackTrace();
        }
    }

    @Test(enabled = TesteAprendizado.Habilitado)
    private void obterFKs() {

        Utilitario.obterFKs();
    }
}
