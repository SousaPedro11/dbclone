package br.gov.pa.ufpa.velocity;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
            Banco.addContext(context);
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

    private static void addContext(final VelocityContext context) {

        context.put("mapaFKs", Utilitario.obterFKs());
        context.put("catalog", Utilitario.catalogo);
        context.put("mapaInsert", Utilitario.obterDados());

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

            // System.out.println(schemas);
            context.put("schemas", schemas);

        } else {

            context.put("schemas", Utilitario.catalogo.getSchemas());
        }
    }
}
