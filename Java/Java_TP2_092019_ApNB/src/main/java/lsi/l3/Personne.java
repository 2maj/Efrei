/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lsi.l3;

/**
 *
 * @author JAA
 */
// Ceci est un Java bean
public class Personne {

    String nom;
    String prenom;
    int anNaissance;
    static int compteur;

    public Personne(String nom, String prenom, int anNaissance) {
        this.nom = nom;
        this.prenom = prenom;
        this.anNaissance = anNaissance;
        compteur++;
    }

    public Personne() {
        compteur++;
    }

    public int calculerAge() {
        return (2019 - this.anNaissance);
    }

//    public void afficher(){
//        System.out.println("Nom : "+ nom + " Prénom : " + prenom + "Age : " + this.calculerAge());
//        
//    }
    
    public static void afficherNbObj() {
        System.out.println("Nb d'objets créés :" + compteur);
    }

    /*
    // Nous pouvons désactiver la méthode toString de la classe mère
    // Seule celle de la classe fille nous sera utile
    public String toString() {
        return "Personne{" + "nom=" + nom + ", prenom=" + prenom + "Age : " + this.calculerAge()+ '}';
    }
     */
}
