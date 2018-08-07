class Emdash extends SceneHelper {
	PImage pigeon;
	Emdash() {
		pigeon = loadImage("pigeon.png");
		incrementer = 0;
		showCutScenes = true;
	}
	// Basically the draw function
	void update() {
		textSize(40);
		textAlign(CENTER, CENTER);
		fill(0);
		switch (incrementer) {
			case 0:
				background(color1);
				image(pigeon, 0, 0);
				writeCenterText("On the way to the bar you run into Emdash, your best friend!", 40);
				instructionText();
				break;
			case 1:
				background(color2);
				image(pigeon, 0, 0);
				writeCenterText("EMDASH: *cooo* *cooooooooooooo* *cooo*", 40);
				instructionText();
				break;
			case 2:
				background(color3);
				image(pigeon, 0, 0);
				writeCenterText("EMDASH: *coooooooooooooooo*", 40);
				instructionText();
				break;
			case 3:
				background(color1);
				image(pigeon, 0, 0);
				writeCenterText("EMDASH: *coo*", 40);
				instructionText();
				break;
			case 4:
				background(color4);
				image(pigeon, 0, 0);
				writeCenterText("EMDASH: *cooooo* *cooo* *cooooo* *coooo* *cooooooooo* *coooo* *coo* *cooooo*, *cooo* *coo* *coooooo*", 40);
				instructionText();
				break;
		}
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 5;
	}
	// Return the story line we should continue on next
	String getNextStoryLine() {
		return "bar";
	}
	void keyReleased(int codedKey) {
		incrementer++;
	}
	// Show the correct instruction text at the bottom of the screen
	void instructionText() {
		if (showCutScenes) {
			writeBottomText("(press space to continue)", 20);
		}
	}
}
