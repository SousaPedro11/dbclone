package br.gov.pa.ufpa.velocity;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.Connection;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

import schemacrawler.schema.Catalog;
import schemacrawler.schemacrawler.SchemaCrawlerOptions;
import schemacrawler.schemacrawler.SchemaInfoLevelBuilder;
import schemacrawler.utility.SchemaCrawlerUtility;

public class Banco {

    private static Connection conexao = SingletonConexao.getConexao();

    public static void velocityGerador() throws IOException {

        // Seta options
        final SchemaCrawlerOptions options = new SchemaCrawlerOptions();
        options.setSchemaInfoLevel(SchemaInfoLevelBuilder.standard());
        // Inicia a engine
        final VelocityEngine ve = new VelocityEngine();
        ve.init();
        // Define template
        final Template t = ve.getTemplate("/src/test/resources/layouts/gerador.vm");
        // Cria contexto
        final VelocityContext context = new VelocityContext();
        final StringWriter writer = new StringWriter();
        try {
            // Conecta
            final Catalog catalog = SchemaCrawlerUtility.getCatalog(Banco.conexao, options);
            // Adiciona ao contexto do template
            context.put("catalog", catalog);
            // adiciona o template ao Writer
            t.merge(context, writer);
            final BufferedWriter sqlfile = new BufferedWriter(new FileWriter("banco.sql", false));
            System.out.println(writer.toString());
            sqlfile.write(writer.toString());
            sqlfile.close();
        } catch (final Exception e) {
            e.printStackTrace();
        }
    }

}
