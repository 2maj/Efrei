/*
 * EFREI Student
 * Author: Moussa ADJI
 * Git: https://github.com/2maj/
 * Mail: adjimahamat@gmail.com
 */
package lsi.l3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StartDB {
    private String url;
    private String user;
    private String pwd;
    private Connection connection;
    private Statement stmt;
    private ResultSet rs;
    private ArrayList<ArrayList<String>> listDev;
    
    public StartDB(String url, String user, String pwd){
        this.url= url;
        this.user=user;
        this.pwd=pwd;
        this.listDev = new ArrayList();
    }
    
    public StartDB(){}
    
    public void connect(){
        try {
            this.connection = DriverManager.getConnection(this.url, this.user, this.pwd);
            System.out.println("Connected !");
        } catch (SQLException ex) {
            Logger.getLogger(StartDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
 
    public void getResponse(String req){
       
        try {
            this.stmt = this.connection.createStatement();
            this.rs = this.stmt.executeQuery(req);
        } catch (SQLException ex) {
            Logger.getLogger(StartDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void parseData(){
        
        try {
            while(this.rs.next()){
                 ArrayList<String> p = new ArrayList<String>();
                 p.add(rs.getString(1));
                 p.add(rs.getString(2));
                 p.add(rs.getString(3));
                this.listDev.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StartDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void display(){
        ArrayList<String> p;
        for(int i = 0; i < this.listDev.size(); i++){
            p = this.listDev.get(i);
            for( int j = 0; j < p.size(); j++){
                System.out.print(p.get(j)+"  ");
            }
            System.out.println();
        }
    }
    
}
