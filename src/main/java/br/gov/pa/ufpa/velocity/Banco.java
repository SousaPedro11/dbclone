package br.gov.pa.ufpa.velocity;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.util.LinkedHashSet;
import java.util.stream.Collectors;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

import schemacrawler.schema.Schema;

public class Banco {

    public static void velocityGerador() throws IOException {

        // Inicia a engine
        final VelocityEngine ve = new VelocityEngine();
        ve.init();
        // Define template
        final Template t = ve.getTemplate("/src/test/resources/layouts/gerador.vm");
        // Cria contexto
        final VelocityContext context = new VelocityContext();
        final StringWriter writer = new StringWriter();
        try {
            // Adiciona ao contexto do template
            context.put("mapaFKs", Utilitario.obterFKs());
            context.put("catalog", Utilitario.catalogo);
            context.put("mapaInsert", Utilitario.obterDados());
            // adiciona o template ao Writer
            t.merge(context, writer);
            final BufferedWriter sqlfile = new BufferedWriter(new FileWriter("banco.sql", false));
            // System.out.println(writer.toString());
            sqlfile.write(writer.toString());
            sqlfile.close();
        } catch (final Exception e) {
            e.printStackTrace();
        }
    }

    public static String obterTipoBanco() {

        return Utilitario.catalogo
                        .getDatabaseInfo()
                        .getProductName();
    }

    public static String obterBase() {

        final String[] nomeBase = Utilitario.catalogo
                        .getJdbcDriverInfo()
                        .getConnectionUrl()
                        .split("/");

        return nomeBase[nomeBase.length - 1];
    }

    public static LinkedHashSet<Schema> obterSchemas() {

        return Utilitario.catalogo
                        .getSchemas()
                        .stream()
                        .filter(f -> !f.getFullName().matches("(sys)||(information_schema)||(phpmyadmin)||(performance_schema)||(mysql)"))
                        .collect(Collectors.toCollection(LinkedHashSet::new));

    }

    public static void obterTabelas(final Schema schema) {
        // TODO Auto-generated method stub

    }

    private void obterColuna() {
        // TODO Auto-generated method stub

    }

    private void obterRegistro() {
        // TODO Auto-generated method stub

    }
}
