Galaga App
An app written in MATLAB that utilizes an accelerometer connected through an arduino uno microprocessor.
Written by Jason Gallagher
	   Allan Michel
	   Laura Worley
Galaga 

The galaga app is a user friendly gaming app. The object of the game is to shoot the incoming ships while dodging their 
the oncoming bullets. The players ship can be navigated by tilting the accelerometer left and right about the y axis. 
The player can shoot at the oncoming ships by tilting the accelerometer forward in the z direction. Score will be kept
and if the player is shot by the oncoming ships the game will end. 



Core Functionality 
-ability to set up the serial port when opened
-calibrate the accelerometer with the click of a button
-takes in the sensor values given by the accelerometer and filters out the noise 
-Utilizes incoming threshold crossing values to navigate the ship left and right
-ability to start and stop reading incoming sensor values
-button that allows user to close the serial port


Advanced Functionality
-shooting occurs when the user tilts the accelerometer forward past a certain thresh hold in the z direction
-incoming ships disappear off of the screen when hit with a bullet that released from the user's ship
-the incoming ships form a matrix and move in a pattern when entering the screen
-The background was an advanced user interface that was used to enhance the layout of the app and make it more user
 friendly
-3-D Matrices for the ship display coordinates
-hit detection 
-bullet animation
-ship movement 
-alpha filtering

