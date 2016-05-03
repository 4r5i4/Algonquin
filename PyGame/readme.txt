################################################
################################################
#############            By: Amirhossein Ardalan
#############             Student No.: 100721433
#############                   Date: 10/11/2014
#############           	File: _game.py
#############			 Assignment No.8



Game Description:

+This game is based on speed.

	There are two monsters and one of them has food 
	poisoning, hence the green color. The mobile Monster
	is trying to reach his friend in order to help, but
	there are obstacles in the way shooting left and right
	from random starting point. The point of the game is to 
	reach our sick monster without getting hit by the enemy.
	The position of the sick monster changes randomly, and 
	every time we reach him, the score increases by 1.
	As the player levels up, the number of enemies and 
	the speed of the mobile Monster increase. 

+Game controls:
	You need to press one of the four keys to blit the screen and 
	start the game:

	W = move up
	S = move down
	A = move left
	D = move right


+Difficulty is based on two parameters:
	*Number of enemies
	*Speed of the mobile Monster

+Files included:
	gameicon.png
	Purple_Monster.png
	Green_Monster.png
	readme.txt
	journey.mp3
	snap.wav
	Ubuntu-M.ttf
	game.py

+Features:
	Game window has an icon (gameicon.png)
	Game window has a title ('*** Monster Game ***')
	Game has a soundtrack that repeats
	Game has a sound effect (snap.wav) when two monsters meet
	Game displays score
	Game handles input and quits when KEY_ESCAPE is pressed

-UNRESOLVED ISSUES WITH THE GAME:
	*I was unable to figure out a way to 
	create enemies

	*Even if there were enemeies, I do not know 
	how to handle the enemies that have left 
	the screen (i.e. they must be still in the memory!)

	*I do not know how to reset the game after 
	a level is complete

-INCOMPLETE PARTS OF THE GAME:
	*No max life
	*No end of life (since I couldn't produce enemies)
	
