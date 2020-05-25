package org.mht.junitTest;


import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class MultiplierTest {

    @Test
    public void process_correctTest(){
        int a = 2, b=3;
        Multiplier multiplier = new Multiplier();
        int result = multiplier.calcul(a,b);
        assertEquals(6, result);
    }
}
