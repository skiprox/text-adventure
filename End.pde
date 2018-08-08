class End extends SceneHelper {
	End() {
		incrementer = 0;
		showCutScenes = true;
	}
	// Basically the draw function
	void update() {
		switch (incrementer) {
			case 0:
				background(color1);
				writeCenterText("the end", 120);
				instructionText();
				break;
			case 1:
				showCutScenes = false;
				background(color2);
				writeCenterText("Made by Sean Scanlan\nat Parsons MFADT\nMusic by Jahzzar from the Free Music Archive", 60);
				instructionText();
				break;
		}
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 2;
	}
	// Return the story line we should continue on next
	String getNextStoryLine() {
		return nextScene;
	}
	// The key released listener
	void keyReleased(int codedKey) {
		if (showCutScenes && codedKey == 32) {
			incrementer++;
		} else if (!showCutScenes && codedKey == 82) { // restart
			nextScene = "intro";
			incrementer++;
		}
	}
	// Show the correct instruction text at the bottom of the screen
	void instructionText() {
		if (showCutScenes) {
			writeBottomText("(press space to continue)", 20);
		} else {
			writeBottomText("(press 'R' to restart)", 20);
		}
	}
}
