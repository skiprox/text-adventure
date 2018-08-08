class Tv extends SceneHelper {
	Tv() {
		incrementer = 0;
		showCutScenes = true;
	}
	// Basically the draw function
	void update() {
		switch (incrementer) {
			case 0:
				background(color1);
				writeCenterText("TV screen 1", 40);
				instructionText();
				break;
			case 1:
				background(color2);
				writeCenterText("TV screen 2", 40);
				instructionText();
				break;
			case 2:
				background(color3);
				writeCenterText("TV screen 3", 40);
				instructionText();
				break;
			case 3:
				showCutScenes = false;
				background(random(100, 255), random(100, 255), random(100, 255), 100);
				writeCenterText("WAR", 120);
				instructionText();
				break;
			case 4:
				showCutScenes = false;
				background(color1);
				writeCenterText("TV Channel 2", 120);
				instructionText();
				break;
			case 5:
				showCutScenes = false;
				background(color3);
				writeCenterText("TV Channel 3", 120);
				instructionText();
				break;
			case 6:
				showCutScenes = true;
				background(color4);
				writeCenterText("You pass out", 40);
				instructionText();
				break;
		}
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 7;
	}
	// Return the story line we should continue on next
	String getNextStoryLine() {
		return "end";
	}
	// The key released listener
	void keyReleased(int codedKey) {
		if (showCutScenes && codedKey == 32) {
			incrementer++;
		} else if (!showCutScenes && codedKey == 89) { // Change the channel
			incrementer++;
		} else if (!showCutScenes && codedKey == 78) { // pass out
			incrementer = 9;
		}
	}
	// Show the correct instruction text at the bottom of the screen
	void instructionText() {
		if (showCutScenes) {
			writeBottomText("(press space to continue)", 20);
		} else {
			writeBottomText("(press 'Y' to change the channel, or 'N' to pass out)", 20);
		}
	}
}
