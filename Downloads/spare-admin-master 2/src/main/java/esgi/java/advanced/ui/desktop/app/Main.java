package esgi.java.advanced.ui.desktop.app;

import esgi.java.advanced.ui.desktop.app.controller.Home;
import javafx.application.Application;

import javafx.scene.Scene;
import javafx.scene.image.Image;

import javafx.stage.Stage;


public class Main extends Application {



    public static Stage window;

    public static void main(String... args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        Scene scene = Home.scene();
        primaryStage.setTitle("Spare Service Administartion");
        primaryStage.getIcons().add(new Image(getClass().getResource("spare.png").toExternalForm()));
        primaryStage.setScene(scene);
        primaryStage.show();
        window = primaryStage;
    }


}
