class Home {
	int incrementer;
	boolean showCutScenes;
	String nextScene;
	color color1 = color(255, 109, 198);
	color color2 = color(198, 255, 109);
	color color3 = color(109, 198, 255);
	color color4 = color(109, 255, 198);
	Home() {
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
				text("At home screen 1", 0, 0, width, height);
				instructionText();
				break;
			case 1:
				background(color2);
				text("At home screen 2", 0, 0, width, height);
				instructionText();
				break;
			case 2:
				background(color3);
				text("At home screen 3", 0, 0, width, height);
				instructionText();
				break;
			case 3:
				showCutScenes = false;
				background(color1);
				text("Do you want to watch some TV, or go to a bar?", 0, 0, width, height);
				instructionText();
				break;
		}
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 4;
	}
	// Return the story line we should continue on next
	String getNextStoryLine() {
		return nextScene;
	}
	// The key released listener
	void keyReleased(int codedKey) {
		println(codedKey);
		if (showCutScenes && codedKey == 32) {
			incrementer++;
		} else if (!showCutScenes && codedKey == 84) { // watch TV
			nextScene = "tv";
			incrementer++;
		} else if (!showCutScenes && codedKey == 66) { // go to bar
			nextScene = "bar";
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
			text("(press 'T' to watch TV, or 'B' to go to a bar)", 0, 0, width, height);
		}
	}
}
