package assignment2;

import javafx.animation.*;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.collections.ObservableList;
import javafx.concurrent.Worker.State;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.scene.web.WebView;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebHistory;
import javafx.util.Duration;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import java.util.Optional;

/**
 * Class MyGUI
 * Creates a web browser with home button, menu bar, browser bar
 *  and basic functionality of bookmarking and going back and forth
 *  between the pages
 *
 *  @version 1.5
 *  @author Amirhossein Ardalan
 */
public class MyGUI extends Application {

	protected WebEngine engine;
	BorderPane root;

	WebView browserView;

	Button back;
	Button forward;
	Button bookmarkBtn;
	Button home;

	Menu file;
	Menu help;
	Menu bookmarkMenu;

	//menuBar holds the menus of File, Bookmark, and Help
	MenuBar menuBar;

	//MenuItems quit and newWindow go to file menu
	MenuItem quit;

	//About, history, and getHelp go to Help menu
	MenuItem about;
	MenuItem getHelp;
	CheckMenuItem history;

	//This box will hold back and FWD buttons + urlField
	HBox broweserBox;

	TextField urlField;

	//@TODO: NOT USED - next version
	//private String userURL;

	//Declaring some static variables
	static String INIT_HOME = "http://www.google.com";
	final static double DEFAULT_MENU_ITEM_SIZE = 30;
	final static double BROWSER_VERSION = 1.0;
	static final String BROWSER_RELEASE_DATE = "2016/03/27";


	//Entry point of the program
	public static void main(String[] args) {
		launch(args);
	}

	/**
	 * The starting point of the browser application
	 * The start method created the browserView and instantiates all the control elements
	 * @param primaryStage the primary stage to be passed to start method
	 * @throws Exception Fro exception handling
     */
	@Override
	public void start(Stage primaryStage) throws Exception {

		//The root pane
		root = new BorderPane();
		Scene scene = new Scene(root, 800, 600);

		//getting simple css style elements
		scene.getStylesheets().add(getClass().getResource("Simple.css").toExternalForm());
		primaryStage.setScene(scene);
		primaryStage.show();
		System.out.println(BROWSER_RELEASE_DATE);

		//Instantiating  buttons and loading the images onto them
		back = new Button();
		Image backImage = new Image(getClass().getResourceAsStream("Back.png"));
		back.setGraphic(new ImageView(backImage));
		back.setOnAction(e->goBack());


		forward = new Button();
		Image forwardImage = new Image(getClass().getResourceAsStream("Forward.png"));
		forward.setGraphic(new ImageView(forwardImage));
		forward.setOnAction(e->goForward());

		home = new Button("Home");
		home.setId("HOME");
		Image homeImage = new Image(getClass().getResourceAsStream("home.png"));
		home.setGraphic(new ImageView(homeImage));
		home.setOnAction(e-> engine.load(INIT_HOME));

		menuBar = new MenuBar();

		//setting up menus
		file = new Menu("File");
		help = new Menu("Help");
		bookmarkMenu = new Menu("Bookmarks");

		//setting up MenuItems
		quit = new MenuItem("Quit");
		quit.setOnAction(e -> quitProgram() );
		MenuItem getClassInHelp = new MenuItem("Get help for Java Class");
		history = new CheckMenuItem("Show History");
		history.setOnAction(e-> historyView());

		//The about MenuItem
		about = new MenuItem("About");
		about.setOnAction(e-> {
			/**
			 * This will pop up an information box
			 */
			Alert infoPOP = new Alert(AlertType.INFORMATION);
			infoPOP.setTitle("Information Dialog");
			infoPOP.setHeaderText("About");
			infoPOP.setContentText("Amir's Browser, V" +
					BROWSER_VERSION + ", " + BROWSER_RELEASE_DATE );
			infoPOP.showAndWait();
		});


		getHelp = new MenuItem("Get help for Java class");
		getHelp.setOnAction(e -> {
			/**
			 * This allows the user to enter a specified
			 * class to be looked up within the browser and in
			 * the Oracle API
			 */
			TextInputDialog getHelpPOP = new TextInputDialog("Type here");
			getHelpPOP.setTitle("Find help for Java class");
			getHelpPOP.setHeaderText("Search for Java Class Documentation");
			getHelpPOP.setContentText("Which Java class do you want to research?");
			Optional<String> input = getHelpPOP.showAndWait();
			input.ifPresent(event -> {
				engine.load("http://www.google.ca/search?num=20&q=java+class+" + input);
			});
		});

		/**
		 * Adding the items to the help menu
		 */

		help.getItems().add(getHelp);

		/**
		 * Adding an extra feature to open a new session of the browser.
		 * Each session has its own history, controls, event handlers
		 */

		MenuItem newSession = new MenuItem("New Window");
		newSession.setOnAction(e->{
			try {
				MyGUI newWindow = new MyGUI();
				Stage newStage = new Stage();
				newWindow.start(newStage);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		});

		/**
		 * Adding items to the file menu
		 */
		file.getItems().addAll(quit, newSession);
		help.getItems().addAll(history, about);
		menuBar.getMenus().addAll(file, bookmarkMenu, help);

		//url bar
		urlField = new TextField();

		//@TODO: maybe figure out a way to add progression in the URL bar
		urlField.setText(INIT_HOME);

		HBox.setHgrow(urlField, Priority.ALWAYS);
		urlField.setOnMousePressed(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event)
			{
				if (event.getClickCount() == 2) {
					urlField.clear();
				}
				else if (event.getClickCount() == 1){
					urlField.selectAll();
				}
			}
		});

		urlField.setOnAction(e-> {
			String userURL = urlField.getText();
			engine.load("http://" + userURL);

		});

		bookmarkBtn = new Button("Bookmark");
		bookmarkBtn.setOnAction(e->{
			MenuItem bookedURL = new MenuItem(urlField.getText());
/*
			if (equals(bookedURL.getText()))
			{
				bookmarkBtn.setDisable(true);
				bookmarkMenu.getItems().add(bookedURL);

			}
			else
			{*/
				bookmarkBtn.setDisable(false);
				bookmarkMenu.getItems().add(bookedURL);
/*			}*/

			bookedURL.setOnAction(event -> {
				MenuItem selectedURL = (MenuItem) e.getSource();
				urlField.setText(selectedURL.getText());
				engine.load(urlField.getText());
			});
		});




		browserView = new WebView();
		engine = browserView.getEngine();
		browserView.setPrefSize(1400, 1400);

		VBox mainBox = new VBox();
		broweserBox = new HBox();

		broweserBox.getChildren().addAll(home, back, forward, urlField, bookmarkBtn);
		mainBox.getChildren().addAll(menuBar, broweserBox);

		root.setTop(mainBox);
		root.setCenter(browserView);
		engine.load(INIT_HOME);
		
			//This is a 3-parameter Lambda function for listening for changes
			// of state for the web page loader.			 VVV   VVV         VVV
		engine.getLoadWorker().stateProperty().addListener(( ov, oldState,  newState)->
		{
			// This if statement gets run if the new page load succeeded.
			if (newState == State.SUCCEEDED) {
				//why is this empty -- why should it be?

			}
		});

		primaryStage.setScene(scene);
		primaryStage.setTitle("SantaFe V" + BROWSER_VERSION);
		primaryStage.show();


		
	}

	/**
	 * historyView is responsible for creating a history list
	 * was isolated to clean the code.
	 */
	private void historyView()
	{
		WebHistory webHistory = engine.getHistory();
		ObservableList<WebHistory.Entry> histEntryList = webHistory.getEntries();
		ListView historyList = new ListView(histEntryList);
		historyList.setPrefSize(250, browserView.getHeight());
		historyList.setOnMouseClicked(e -> {
			engine.load((String) historyList.getSelectionModel().getSelectedItem());
		});
		if(history.isSelected())
		{
			TranslateTransition translateAnime = new TranslateTransition(Duration.millis(500), historyList);
			translateAnime.setToX(-50);
			translateAnime.setToY(0);
			translateAnime.autoReverseProperty();
			translateAnime.setAutoReverse(true);
			translateAnime.setCycleCount(2);

			FadeTransition fadeAnime = new FadeTransition(Duration.millis(700), historyList);
			fadeAnime.setFromValue(1.0);
			fadeAnime.setToValue(0.0);
			fadeAnime.setAutoReverse(true);
			fadeAnime.setCycleCount(2);

			SequentialTransition historyItemSelected = new SequentialTransition(translateAnime, fadeAnime);
			historyItemSelected.play();

		}
		else
		{
			ScaleTransition scalarAnime = new ScaleTransition(Duration.millis(1000), historyList);
			scalarAnime.setToX(0);
			scalarAnime.setToY(0);

			RotateTransition rotateAnime = new RotateTransition(Duration.millis(700), historyList);
			rotateAnime.setFromAngle(0);
			rotateAnime.setToAngle(360);


			ParallelTransition historyItemUnselected = new ParallelTransition(rotateAnime, scalarAnime);

			historyItemUnselected.play();
			historyItemUnselected.setOnFinished(e -> {
				historyList.setMaxSize(0, 0);
			});
		}

		VBox historyBox = new VBox();
		historyBox.getChildren().addAll(historyList);
		root.setRight(historyBox);


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
		{			// 		  VVV  This is a no-parameter Lambda function run();
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
	    {	    					//This is a no-parameter Lambda function run();
	    		Platform.runLater( () -> { 
	    			history.go(1); 
	    			final String nextAddress = history.getEntries().get(currentIndex + 1).getUrl();
	    		});
	    }    
	}
}
