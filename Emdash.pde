class Emdash {
	int incrementer;
	boolean showCutScenes;
	String nextScene;
	color color1 = color(255, 109, 198);
	color color2 = color(198, 255, 109);
	color color3 = color(109, 198, 255);
	color color4 = color(109, 255, 198);
	Emdash() {
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
				text("On the way to the bar you run into Emdash, your best friend!", 0, 0, width, height);
				instructionText();
				break;
			case 1:
				background(color2);
				text("Emdash screen 2", 0, 0, width, height);
				instructionText();
				break;
			case 2:
				background(color3);
				text("Emdash screen 3", 0, 0, width, height);
				instructionText();
				break;
			case 3:
				background(color1);
				text("Emdash screen 4", 0, 0, width, height);
				instructionText();
				break;
			case 4:
				background(color4);
				text("Emdash screen 5", 0, 0, width, height);
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
			textSize(20);
			textAlign(CENTER, BOTTOM);
			fill(0);
			text("(press space to continue)", 0, 0, width, height);
		}
	}
}
