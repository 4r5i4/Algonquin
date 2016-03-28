package ass2;
import javafx.animation.*;
import javafx.application.Application;
import javafx.stage.Stage;
import javafx.util.Duration;
import javafx.application.Platform;
import javafx.collections.ObservableList;
import javafx.concurrent.Worker.State;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.*;


public class Browser extends Application {

    BorderPane pane;
    protected WebEngine engine;
    WebView browserView;
    Button back;
    Button forward;
    Button book;
    Button home;
    Menu file;
    Menu help;
    Menu bookMark;
    MenuBar menuBar;
    MenuItem quit;
    CheckMenuItem history;
    HBox broweserBox;
    TextField urlField;
    private String userURL;


    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) throws Exception {

        pane = new BorderPane();
        Scene scene = new Scene(pane, 800, 600);
        primaryStage.setScene(scene);
        primaryStage.show();



        back = new Button("backward");
        back.setOnAction(e->goBack());

        forward = new Button("forward");
        forward.setOnAction(e->goForward());

        book = new Button("Bookmark");
        home = new Button("Home");
        home.setOnAction(e-> engine.load(INIT_HOME));

        menuBar = new MenuBar();

    
        file = new Menu("File");
        help = new Menu("Help");
        bookMark = new Menu("Bookmarks");

        quit = new MenuItem("Quit");
        quit.setOnAction(e -> quitProgram() );
        MenuItem getClassInHelp = new MenuItem("Get help for Java Class");
        history = new CheckMenuItem("Show History");
        history.setOnAction(e-> historyView());



        file.getItems().addAll(quit);
        help.getItems().addAll(history);
        menuBar.getMenus().addAll(file, bookMark, help);

        urlField = new TextField();

        urlField.setPromptText(" Type URL here: www.example.com");
        HBox.setHgrow(urlField, Priority.ALWAYS);
        urlField.setOnMousePressed(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                urlField.clear();
            }
        });

        urlField.setOnAction(e->
        {
            userURL = urlField.getText();
            engine.load("http://" + userURL);

        });


        browserView = new WebView();
        engine = browserView.getEngine();
        browserView.setPrefSize(800, 600);

        engine.load("http://www.google.com");


        VBox mainBox = new VBox();
        broweserBox = new HBox();




        broweserBox.getChildren().addAll(home, back, forward, urlField, book);
        mainBox.getChildren().addAll(menuBar, broweserBox);

        


        pane.setTop(mainBox);
        pane.setCenter(browserView);

        
            //This is a 3-parameter Lambda function for listening for changes
            // of state for the web page loader.             VVV   VVV         VVV
        engine.getLoadWorker().stateProperty().addListener(( ov, oldState,  newState)->
        {
            // This if statement gets run if the new page load succeeded.
            if (newState == State.SUCCEEDED) {
                    
            }
        });

        primaryStage.setScene(scene);
        primaryStage.setTitle("AmsenBrowser");
        primaryStage.show();


        
    }

    private void historyView()
    {
        WebHistory webHistory = engine.getHistory();
        ObservableList<WebHistory.Entry> histEntryList = webHistory.getEntries();
        ListView historyListView = new ListView(histEntryList);
        historyListView.setPrefSize(250, browserView.getHeight());
        if(history.isSelected())
        {
            TranslateTransition translate = new TranslateTransition(Duration.millis(500), historyListView);
            translate.setToX(150);
            translate.setToY(200);
            translate.autoReverseProperty();
            translate.setAutoReverse(true);
            translate.setCycleCount(2);

            FadeTransition Fade = new FadeTransition(Duration.millis(700), historyListView);
            Fade.setFromValue(1.0);
            Fade.setToValue(0.0);
            Fade.setAutoReverse(true);
            Fade.setCycleCount(2);

            SequentialTransition checked = new SequentialTransition(translate, Fade);
            checked.play();

        }
        else
        {
            ScaleTransition scaler = new ScaleTransition(Duration.millis(1000), historyListView);
            scaler.setToX(0);
            scaler.setToY(0);


            RotateTransition rotate = new RotateTransition(Duration.millis(700), historyListView);
            rotate.setFromAngle(0);
            rotate.setToAngle(360);
  

            ParallelTransition unchecked = new ParallelTransition(rotate, scaler);

            unchecked.play();
            unchecked.setOnFinished(e -> {
                historyListView.setMaxSize(0, 0);
            });
        }

        VBox historyBox = new VBox();
        historyBox.getChildren().addAll(historyListView);
        pane.setRight(historyBox);


    }

    private void quitProgram()
    {
        System.out.println("Quitting...");
        Platform.exit();
        System.out.println("Application Closed");
    }

    //Tell the engine to go back 1 page in the history
    public void goBack()
    {    
        final WebHistory history=engine.getHistory();
        ObservableList<WebHistory.Entry> entryList=history.getEntries();
        int currentIndex = history.getCurrentIndex();

        if(currentIndex > 0)
        {           //        VVV  This is a no-parameter Lambda function run();
            Platform.runLater( () -> { 
                    history.go(-1); 
                    final String nextAddress = history.getEntries().get(currentIndex - 1).getUrl();
            } );
        }
      }
    
    //Tell the engine to go forward 1 page in the history
    public void goForward()
    {    
        final WebHistory history=engine.getHistory();
        ObservableList<WebHistory.Entry> entryList=history.getEntries();
        int currentIndex = history.getCurrentIndex();
        
        if(currentIndex + 1 < entryList.size())
        {                           //This is a no-parameter Lambda function run();
                Platform.runLater( () -> { 
                    history.go(1); 
                    final String nextAddress = history.getEntries().get(currentIndex + 1).getUrl();
                });
        }    
    }
}
