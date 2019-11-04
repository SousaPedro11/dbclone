package br.gov.pa.ufpa.velocity.teste;

import java.io.IOException;

import org.testng.annotations.Test;

import br.gov.pa.ufpa.velocity.Banco;
import br.gov.pa.ufpa.velocity.Utilitario;
import schemacrawler.schema.Catalog;
import schemacrawler.schema.Schema;
import schemacrawler.schemacrawler.SchemaCrawlerException;

public class TesteSQL {

    private static final boolean DESABILITADO = false;

    @Test(enabled = !TesteSQL.DESABILITADO)
    private void TesteGerarSQL() {

        try {
            Banco.velocityGerador();
        } catch (final IOException e) {
            e.printStackTrace();
        }
    }

    @Test(enabled = TesteSQL.DESABILITADO)
    private void obterDados() {

        Utilitario.obterDados();
    }

    @Test(enabled = TesteSQL.DESABILITADO)
    private void obterBanco() {

        System.out.println(Banco.obterTipoBanco());

        System.out.println(Utilitario.filtroBanco());
    }

    @Test(enabled = TesteSQL.DESABILITADO)
    private void obterBase() {

        System.out.println(Banco.obterBase());
    }

    @Test(enabled = TesteSQL.DESABILITADO)
    private void obterSchemas() {

        final Catalog obterCatalogo = Utilitario.obterCatalogo();
        System.out.println(obterCatalogo);

        for (final Schema schema : Banco.obterSchemas()) {
            System.out.println(schema.getFullName());
        }
    }

    @Test(enabled = TesteSQL.DESABILITADO)
    private void obterTabelas() throws SchemaCrawlerException {

        Banco.obterTabelas(null);
    }
}
