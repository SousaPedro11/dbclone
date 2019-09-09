package br.gov.pa.ufpa.velocity;

import java.sql.Connection;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import org.hibernate.Session;
import org.hibernate.internal.SessionImpl;

public final class SingletonConexao {

    private static EntityManager em = null;

    private static Connection conexao = null;

    private SingletonConexao() {

    }

    public static Connection getConexao() {

        if (SingletonConexao.em == null) {

            final String persistenceUnitName = SingletonProperties.getInstancia("configuracao.properties").getPropriedade("persistenceUnitName");
            SingletonConexao.em = Persistence.createEntityManagerFactory(persistenceUnitName).createEntityManager();

            final Session hibernateSession = SingletonConexao.em.unwrap(Session.class);
            SingletonConexao.conexao = ((SessionImpl) hibernateSession).connection();
        }

        return SingletonConexao.conexao;
    }
}