class Intro extends SceneHelper {
	PImage title;
	Intro() {
		incrementer = 0;
		showCutScenes = true;
		title = loadImage("title.png");
	}
	// Basically the draw function
	void update() {
		switch (incrementer) {
			case 0:
				background(colorArray[incrementer%3]);
				image(title, 0, 0);
				instructionText();
				break;
			case 1:
				background(colorArray[incrementer%3]);
				writeCenterText("2048", 80);
				instructionText();
				break;
			case 2:
				background(colorArray[incrementer%3]);
				writeCenterText("August 18", 80);
				instructionText();
				break;
			case 3:
				background(colorArray[incrementer%3]);
				writeCenterText("9:00 am", 80);
				instructionText();
				break;
			case 4:
				background(colorArray[incrementer%3]);
				writeCenterText("You wake up", 80);
				instructionText();
				break;
			case 5:
				background(colorArray[incrementer%3]);
				writeCenterText("You're hungover", 80);
				instructionText();
				break;
			case 6:
				background(colorArray[incrementer%3]);
				writeCenterText("Your sex robot has left you", 80);
				instructionText();
				break;
			case 7:
				background(colorArray[incrementer%3]);
				writeCenterText("Again.", 80);
				instructionText();
				break;
			case 8:
				background(colorArray[incrementer%3]);
				writeCenterText("You're late for work", 80);
				instructionText();
				break;
			case 9:
				background(colorArray[incrementer%3]);
				writeCenterText("Again.", 80);
				instructionText();
				break;
			case 10:
				showCutScenes = false;
				background(colorArray[3]);
				writeCenterText("Do you go to work, or call out sick?", 80);
				instructionText();
				break;
		}
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 11;
	}
	// Return the story line we should continue on next
	String getNextStoryLine() {
		return nextScene;
	}
	// The key released listener
	void keyReleased(int codedKey) {
		if (showCutScenes && codedKey == 32) {
			incrementer++;
		} else if (!showCutScenes && codedKey == 87) { // go to work
			nextScene = "work";
			incrementer++;
		} else if (!showCutScenes && codedKey == 83) { // call out sick
			nextScene = "home";
			incrementer++;
		}
	}
	// Show the correct instruction text at the bottom of the screen
	void instructionText() {
		if (showCutScenes) {
			writeBottomText("(press space to continue)", 20);
		} else {
			writeBottomText("(press 'W' to go to work, or 'S' to call out sick)", 20);
		}
	}
}
