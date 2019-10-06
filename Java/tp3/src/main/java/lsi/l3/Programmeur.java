/*
 * EFREI Student
 * Author: Moussa ADJI
 * Git: https://github.com/2maj/
 * Mail: adjimahamat@gmail.com
 */
package lsi.l3;

public class Programmeur extends Personne implements ProgrInterface{
	public static final String OCCUPATION= "Programmeur";
	float prime;
  	float salaire;
  	String pseudo;
  	
  public Programmeur(){
  	super();
  };
  public Programmeur(float prime, float salaire){
    this();
    this.prime = prime;
    this.salaire = salaire;
  }
  public Programmeur(float prime, float salaire, String pseudo){
    super();
    this.prime = prime;
    this.salaire = salaire;
    this.pseudo = pseudo;
  }
  
  public Programmeur(String nom, String prenom, int annee, float prime, float salaire, String pseudo){
  	super(nom, prenom, annee);
    this.prime = prime;
    this.salaire = salaire;
    this.pseudo = pseudo;
  }
  public void afficher(){
    System.out.println("Salaire : "+ getSalaire());
  }
  
  public String toString(){
	return "Pseudo: "+ this.pseudo+"\n"+super.toString()+"\nSalaire: "+this.getSalaire();
  }
  
  public float getSalaire(){
    return this.salaire + this.prime;
  }
  
  public void actualiserPrime(float prime){
    this.prime = prime;
  }
}
