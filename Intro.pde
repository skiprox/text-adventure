class Intro extends SceneHelper {
	Intro() {
		incrementer = 0;
		showCutScenes = true;
	}
	// Basically the draw function
	void update() {
		switch (incrementer) {
			case 0:
				background(color1);
				writeCenterText("2048", 80);
				instructionText();
				break;
			case 1:
				background(color2);
				writeCenterText("August 18", 80);
				instructionText();
				break;
			case 2:
				background(color3);
				writeCenterText("9:00 am", 80);
				instructionText();
				break;
			case 3:
				background(color1);
				writeCenterText("You wake up", 80);
				instructionText();
				break;
			case 4:
				background(color2);
				writeCenterText("You're hungover", 80);
				instructionText();
				break;
			case 5:
				background(color3);
				writeCenterText("Your sex robot has left you", 80);
				instructionText();
				break;
			case 6:
				background(color1);
				writeCenterText("Again.", 80);
				instructionText();
				break;
			case 7:
				background(color2);
				writeCenterText("You're late for work", 80);
				instructionText();
				break;
			case 8:
				background(color3);
				writeCenterText("Again.", 80);
				instructionText();
				break;
			case 9:
				showCutScenes = false;
				background(color4);
				writeCenterText("Do you go to work, or call out sick?", 80);
				instructionText();
				break;
		}
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 10;
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
			textSize(20);
			textAlign(CENTER, BOTTOM);
			fill(0);
			writeBottomText("(press 'W' to go to work, or 'S' to call out sick)", 20);
		}
	}
}
