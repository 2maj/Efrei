package org.mht.junitTest;

public class Addition {
    public int process_multi(int a, int b){
        int tmp = 0;
        while(b > 0){
            tmp = tmp+a;
            b--;
        }
        return tmp;
    }

    public int process_add(int a, int b){
        return a+b;
    }
}
