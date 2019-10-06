/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lsi.l3;

import java.util.Scanner;

/**
 *
 * @author moussa
 */
public class Saisir {
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
