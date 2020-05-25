package org.mht.junitTest;

import org.junit.jupiter.api.Test;

public class AdditionTest {
    @Test
    public void processTest(){
        int a=2, b=3;
        Addition addition = new Addition();
        int result = addition.process_add(a,b);
    }
}
