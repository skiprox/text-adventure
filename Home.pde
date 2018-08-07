class Home extends SceneHelper {
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
				writeCenterText("At home screen 1", 40);
				instructionText();
				break;
			case 1:
				background(color2);
				writeCenterText("At home screen 2", 40);
				instructionText();
				break;
			case 2:
				background(color3);
				writeCenterText("At home screen 3", 40);
				instructionText();
				break;
			case 3:
				showCutScenes = false;
				background(color1);
				writeCenterText("Do you want to watch some TV, or go to a bar?", 40);
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
			nextScene = "emdash";
			incrementer++;
		}
	}
	// Show the correct instruction text at the bottom of the screen
	void instructionText() {
		if (showCutScenes) {
			writeBottomText("(press space to continue)", 20);
		} else {
			writeBottomText("(press 'T' to watch TV, or 'B' to go to a bar)", 20);
		}
	}
}
