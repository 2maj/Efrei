/*
 * EFREI Student
 * Author: Moussa ADJI
 * Git: https://github.com/2maj/
 * Mail: adjimahamat@gmail.com
 */
package lsi.l3;

import IHM.Window;
import java.awt.EventQueue;
import java.awt.GridLayout;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JTextArea;

public class Start
{
    
    private static void display() {
        JFrame f = new JFrame("Test");
        ArrayList<String> data = new ArrayList();
        data.add("Item 1");
        data.add("Item 2");
        data.add("Item 3");
        data.add("Item 4");
        data.add("Item 5");
        JTextArea textArea = new JTextArea(); //Espace d'affichage test
        for(String str : data){
            textArea.append(str);
        }
        
        f.add(textArea);
        f.pack();
        f.setLocationRelativeTo(null);
        f.setVisible(true);
    }

    public static void mainb(String[] args) {
       Start.display();
    }
    public static void main(String[] args){
        Window w = new Window("App swing IHM");
        
        w.getWindow().setSize(600, 400);
        ArrayList<String> data = new ArrayList();
        data.add("Item 1");
        data.add("Item 2");
        data.add("Item 3");
        data.add("Item 4");
        data.add("Item 5");
        int length = data.size();
        JPanel p = new JPanel();
        GridLayout grid = new GridLayout(length, 6);
        for(String str : data){
            JLabel textArea = new JLabel(); //Espace d'affichage test
            textArea.setText(str+"\n");
             grid.addLayoutComponent(str, p);
        }
        p.setLayout(grid);
        w.getWindow().add(p);
        
    }
}






