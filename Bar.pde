class Bar {
	int incrementer;
	boolean showCutScenes;
	String nextScene;
	color color1 = color(255, 109, 198);
	color color2 = color(198, 255, 109);
	color color3 = color(109, 198, 255);
	color color4 = color(109, 255, 198);
	Bar() {
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
				text("Bar screen 1", 0, 0, width, height);
				instructionText();
				break;
			case 1:
				background(color2);
				text("Bar screen 2", 0, 0, width, height);
				instructionText();
				break;
			case 2:
				background(color3);
				text("Bar screen 3", 0, 0, width, height);
				instructionText();
				break;
			case 3:
				showCutScenes = false;
				background(color1);
				text("Do you want to talk to a stranger?", 0, 0, width, height);
				instructionText();
				break;
			case 4:
				showCutScenes = true;
				background(color2);
				text("Stranger 1 screen", 0, 0, width, height);
				instructionText();
				break;
			case 5:
				showCutScenes = false;
				background(color3);
				text("Do you want to talk to a stranger?", 0, 0, width, height);
				instructionText();
				break;
			case 6:
				showCutScenes = true;
				background(color1);
				text("Stranger 2 screen", 0, 0, width, height);
				instructionText();
				break;
			case 7:
				showCutScenes = false;
				background(color2);
				text("Do you want to talk to a stranger?", 0, 0, width, height);
				instructionText();
				break;
			case 8:
				showCutScenes = true;
				background(color3);
				text("Stranger 3 screen", 0, 0, width, height);
				instructionText();
				break;
			case 9:
				showCutScenes = true;
				background(color4);
				text("You are drunk. You pass out.", 0, 0, width, height);
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
		return "end";
	}
	// The key released listener
	void keyReleased(int codedKey) {
		println(codedKey);
		if (showCutScenes && codedKey == 32) {
			incrementer++;
		} else if (!showCutScenes && codedKey == 89) { // talk to stranger
			incrementer++;
		} else if (!showCutScenes && codedKey == 78) { // continue drinking
			incrementer = 9;
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
			text("(press 'Y' to talk to stranger, or 'N' to continue drinking)", 0, 0, width, height);
		}
	}
}
