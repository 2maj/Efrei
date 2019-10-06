/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lsi.l3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author JAA
 */
public class Start {

    // POint d'entrée de notre application
    public static void main(String[] args) {

        try {
            String url = "jdbc:derby://localhost:1527/BDTPJAVA";
            String user = "adm";
            String mdp = "adm";
            String req = "SELECT * from PROGRAMMEUR";
            ArrayList<ProgrammeurBean> listeProg = new ArrayList<>();

            Connection conn = DriverManager.getConnection(url, user, mdp);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(req);

            while (rs.next()) {
                ProgrammeurBean progBean = new ProgrammeurBean();
                progBean.setNom(rs.getString("NOM"));
                progBean.setPrenom(rs.getString("PRENOM"));
                progBean.setAnNaissance(rs.getString("ANNAISSANCE"));

                listeProg.add(progBean);

            }
            
            
            for (ProgrammeurBean programmeurBean : listeProg) {
                System.out.println("NOM  : "+programmeurBean.getNom());
                System.out.println("PRENOM  : "+programmeurBean.getPrenom());
                System.out.println("ANNEE DE NAISSANCE  : "+programmeurBean.getAnNaissance());
                
            }

        } catch (SQLException sqle) {
            System.out.println(sqle.getMessage());
        }

    }

}
