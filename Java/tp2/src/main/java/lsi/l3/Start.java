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
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Start
{
    public static void main(String[] args){
        String url="jdbc:derby://localhost:1527/tp";
        StartDB db = new StartDB(url, "tp", "admin");
        db.connect();
        db.getResponse("select * from PROGRAMMEUR");
        db.parseData();
        db.display();
        System.out.println("End");
    }
  public static void mainOld(String[] args)
  {
    /*
    Personne p1 = new Personne("Turing", "Alan", 1912);
    //Personne p2 = new Personne("Ov", "Taki", 1990);
 
    p1.afficher();
    System.out.println("Nb : "+Personne.nb);
    Personne p3 = new Personne();
    //p1.afficherNb();
    Personne.afficherNb();
    Programmeur p = new Programmeur(p1.nom, p1.prenom, p1.anNaissance, 120, 7500, "Enigma");
    p.afficher();
    System.out.println(p);// toString is calling
    p.actualiserPrime(1000);
    System.out.println(p);
    Personne.afficherNb();
    */
    
    System.out.println("Renseignez le pseudo :");
    String pseudo = Start.scanString();

    // le pseudo saisi est-il égal à "lsidev" ?
    while (!pseudo.equals("lsidev")) {
        System.out.println("Renseignez le pseudo :");
        pseudo = Start.scanString();
    }

    System.out.println("Entrez le nom :");
    String nom = Start.scanString();

    System.out.println("Entrez le prénom :");
    String prenom = Start.scanString();

    System.out.println("Entrez l'année de naissance :");
    int anNaissance = Start.scanInt();

    System.out.println("Entrez le salaire :");
    float salaire = Start.scanFloat();

    System.out.println("Entrez la prime :");
    float prime = Start.scanFloat();

    // création et initialisation d'une instance de Programmeur 
    Programmeur prog = new Programmeur(nom, prenom, anNaissance, salaire, prime, pseudo);
    System.out.println(prog); // appel à la méthode toString() de prog
    
  }

  
  public static boolean isEqual(String str1, String str2){
  	return str1==str2;
  }
  public static String scanString(){
    Scanner input = new Scanner(System.in);
    System.out.println("Enter String:");
    String str = input.nextLine();
    return str;
  }
  
  public static int scanInt(){
    Scanner input = new Scanner(System.in);
    System.out.print("Enter int:");
    int str;
    while(!input.hasNextInt()){
        System.out.print("Enter int:");
        input.next();
    }
    str = new Integer(input.nextInt());
    return str;
  }
  
  public static float scanFloat(){
    Scanner input = new Scanner(System.in);
    System.out.print("Enter float:");
    float str;
    while(!input.hasNextFloat()){
        System.out.print("Enter float:");
        input.next();
    }
    str = new Float(input.nextFloat());
    return str;
  }
  
  public static double scanDouble(){
    Scanner input = new Scanner(System.in);
    System.out.print("Enter Int:");
    double str;
    while(!input.hasNextDouble()){
        System.out.print("Enter int:");
        input.next();
    }
    str = new Double(input.nextDouble());
    return str;
  }
}






