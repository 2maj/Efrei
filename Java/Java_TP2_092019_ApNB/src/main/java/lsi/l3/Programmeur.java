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
public class Programmeur extends Personne implements ProgrInterface {

    public static final String OCCUPATION = "Programmeur";
    float prime;
    float salaire;
    String pseudo;

    /**
     *
     * @return salaire
     */
    public float getSalaire() {

        return this.salaire;
    }

    /**
     * @param prime
     */
    @Override
    public void actualiserPrime(float prime) {

        this.prime = prime;
    }

    /**
     * @param prime
     * @param salaire
     * @param pseudo
     * @param nom
     * @param prenom
     * @param anNaissance
     */
    public Programmeur(float prime, float salaire, String pseudo, String nom, String prenom, int anNaissance) {
        super(nom, prenom, anNaissance);
        this.prime = prime;
        this.salaire = salaire;
        this.pseudo = pseudo;
    }

    /**
     * @param prime
     * @param salaire
     * @param pseudo
     */
    public Programmeur(float prime, float salaire, String pseudo) {
        this.prime = prime;
        this.salaire = salaire;
        this.pseudo = pseudo;
    }

    /**
     * @param prime
     * @param salaire
     */
    public Programmeur(float prime, float salaire) {
        this.prime = prime;
        this.salaire = salaire;
    }

    public Programmeur() {

    }

    // Notez bien l'utilisation alternée de "this" et de "super" !
    @Override
    public String toString() {
        
        String affichage = "Pseudo : " + this.pseudo + "\n"
                        + "Nom : " + super.nom + "\n"
                        + "Prénom : " + super.prenom + "\n"
                        + "Salaire : " + this.salaire + "\n"
                        + "Prime : " + this.prime + "\n";

        return affichage;
    }

}
