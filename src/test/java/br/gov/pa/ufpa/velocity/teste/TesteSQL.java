package br.gov.pa.ufpa.velocity.teste;

import java.io.IOException;

import org.testng.annotations.Test;

import br.gov.pa.ufpa.velocity.Banco;

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
}
