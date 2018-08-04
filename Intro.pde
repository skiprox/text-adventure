class Intro {
	int incrementer;
	boolean showCutScenes;
	color color1 = color(255, 109, 198);
	color color2 = color(198, 255, 109);
	color color3 = color(109, 198, 255);
	color color4 = color(109, 255, 198);
	Intro() {
		incrementer = 0;
		showCutScenes = true;
	}
	// Basically the draw function
	void update() {
		textSize(80);
		textAlign(CENTER, CENTER);
		fill(0);
		switch (incrementer) {
			case 0:
				background(color1);
				text("2048", 0, 0, width, height);
				instructionText();
				break;
			case 1:
				background(color2);
				text("August 18", 0, 0, width, height);
				instructionText();
				break;
			case 2:
				background(color3);
				text("9:00 am", 0, 0, width, height);
				instructionText();
				break;
			case 3:
				background(color1);
				text("You wake up", 0, 0, width, height);
				instructionText();
				break;
			case 4:
				background(color2);
				text("You're hungover", 0, 0, width, height);
				instructionText();
				break;
			case 5:
				background(color3);
				text("Your sex robot has left you", 0, 0, width, height);
				instructionText();
				break;
			case 6:
				background(color1);
				text("Again.", 0, 0, width, height);
				instructionText();
				break;
			case 7:
				background(color2);
				text("You're late for work", 0, 0, width, height);
				instructionText();
				break;
			case 8:
				background(color3);
				text("Again.", 0, 0, width, height);
				instructionText();
				break;
			case 9:
				showCutScenes = false;
				background(color4);
				text("Do you go to work, or call out sick?", 0, 0, width, height);
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
		return "emdash";
	}
	// The key released listener
	void keyReleased(int codedKey) {
		if (showCutScenes && codedKey == 32) {
			incrementer++;
		} else if (!showCutScenes && codedKey == 87) { // go to work
			incrementer++;
		} else if (!showCutScenes && codedKey == 83) { // call out sick
			incrementer++;
		}
	}
	// Show the correct instruction text at the bottom of the screen
	void instructionText() {
		if (showCutScenes) {
			textSize(20);
			textAlign(CENTER, BOTTOM);
			fill(0);
			text("(press space to continue)", 0, 0, width, height);
		} else {
			textSize(20);
			textAlign(CENTER, BOTTOM);
			fill(0);
			text("(press 'W' to go to work, or 'S' to call out sick)", 0, 0, width, height);
		}
	}
}
