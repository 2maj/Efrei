package org.mht.junitTest;

public class Multiplier {
    Addition addition = new Addition();
    public int calcul(int a, int b){
        return addition.process_multi(a,b);
    }
}
