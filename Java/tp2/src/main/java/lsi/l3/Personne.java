/*
 * EFREI Student
 * Author: Moussa ADJI
 * Git: https://github.com/2maj/
 * Mail: adjimahamat@gmail.com
 */
package lsi.l3;

public class Personne
{
  String nom;
  String prenom; 
  int anNaissance;
  public static int nb=0;
  
  public Personne(){
  	nb++;
  }
  
  public Personne(String nom, String prenom, int annee){
  	this.nom = nom;
    this.prenom = prenom;
    this.anNaissance = annee;
    nb++;
  }
  
  public int calculAge(){
    int annee = 2019;
    annee = annee - this.anNaissance;
    
    return annee;
  }
  
  public static void afficherNb(){
  	System.out.println("Nombre : "+nb);
  }
  
  public void afficher(){
  	System.out.println("Nom : "+ this.nom+"\nPrenom: "+ this.prenom+"\nAnnée : "+calculAge());
  }
  
  public String toString(){
  	return "Nom : "+ this.nom+"\nPrenom: "+ this.prenom+"\nAnnée : "+calculAge();
  }
  
}