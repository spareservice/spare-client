package esgi.java.advanced.ui.desktop.app.controller;

import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.FlowPane;

public class Wellcome {
    public static final int WIDTH = 1000;
    public static final int HEIGHT = 600;


    public static Scene sceneWelcome() throws java.io.IOException{
        FlowPane pane = FXMLLoader.load(Home.class.getResource("wellcome.fxml"));
        return new Scene(pane);

    }

}
