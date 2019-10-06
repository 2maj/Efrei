/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IHM;

import javax.swing.JFrame;
import javax.swing.JPanel;

/**
 *
 * @author moussa
 */
public class Window{
    JFrame window ;
    public Window(){
        window = new JFrame();
        window.setVisible(true);
    }
    public Window(String title){
        window = new JFrame();
        window.setTitle(title);
        window.setLocationRelativeTo(null);
        window.setResizable(true);
        window.setVisible(true);
        
    }
    public JFrame getWindow(){
        return window;
    }
}
