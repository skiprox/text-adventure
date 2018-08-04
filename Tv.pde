class Tv {
	int incrementer;
	boolean showCutScenes;
	String nextScene;
	color color1 = color(255, 109, 198);
	color color2 = color(198, 255, 109);
	color color3 = color(109, 198, 255);
	color color4 = color(109, 255, 198);
	Tv() {
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
				text("TV screen 1", 0, 0, width, height);
				instructionText();
				break;
			case 1:
				background(color2);
				text("TV screen 2", 0, 0, width, height);
				instructionText();
				break;
			case 2:
				background(color3);
				text("TV screen 3", 0, 0, width, height);
				instructionText();
				break;
			case 3:
				showCutScenes = false;
				background(color1);
				text("Do you want to change the channel?", 0, 0, width, height);
				instructionText();
				break;
			case 4:
				showCutScenes = true;
				background(color2);
				text("TV channel 1", 0, 0, width, height);
				instructionText();
				break;
			case 5:
				showCutScenes = false;
				background(color3);
				text("Do you want to change the channel?", 0, 0, width, height);
				instructionText();
				break;
			case 6:
				showCutScenes = true;
				background(color1);
				text("TV Channel 2", 0, 0, width, height);
				instructionText();
				break;
			case 7:
				showCutScenes = false;
				background(color2);
				text("Do you want to change the channel?", 0, 0, width, height);
				instructionText();
				break;
			case 8:
				showCutScenes = true;
				background(color3);
				text("TV Channel 3", 0, 0, width, height);
				instructionText();
				break;
			case 9:
				showCutScenes = true;
				background(color4);
				text("You pass out.", 0, 0, width, height);
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
		} else if (!showCutScenes && codedKey == 89) { // Change the channel
			incrementer++;
		} else if (!showCutScenes && codedKey == 78) { // pass out
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
			text("(press 'Y' to change the channel, or 'N' to pass out)", 0, 0, width, height);
		}
	}
}
