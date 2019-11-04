package br.gov.pa.ufpa.velocity;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.Connection;
import java.util.LinkedHashSet;
import java.util.stream.Collectors;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

import schemacrawler.schema.Catalog;
import schemacrawler.schema.Schema;
import schemacrawler.schemacrawler.SchemaCrawlerException;
import schemacrawler.utility.SchemaCrawlerUtility;

public class Banco {

    private static Connection conexao = SingletonConexao.getConexao();

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
            context.put("catalog", Utilitario.obterCatalogo());
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

    public static String obterTipoBanco() throws SchemaCrawlerException {

        Catalog catalog = SchemaCrawlerUtility.getCatalog(SingletonConexao.getConexao(), Utilitario.obterOptions());
        return catalog
                        .getDatabaseInfo()
                        .getProductName();
    }

    public static String obterBase() throws SchemaCrawlerException {

        final String[] nomeBase = SchemaCrawlerUtility.getCatalog(SingletonConexao.getConexao(), Utilitario.obterOptions())
                        .getJdbcDriverInfo()
                        .getConnectionUrl()
                        .split("/");

        return nomeBase[nomeBase.length - 1];
    }

    public static LinkedHashSet<Schema> obterSchemas() throws SchemaCrawlerException {

        return SchemaCrawlerUtility.getCatalog(SingletonConexao.getConexao(), Utilitario.obterOptions())
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
