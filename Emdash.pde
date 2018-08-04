class Emdash {
	int incrementer;
	boolean showCutScenes;
	String previousLocation = "suckit";
	Emdash(String previousStoryLine) {
		previousLocation = previousStoryLine;
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
				background(255, 109, 198);
				text("Third screen goes here, part of intro class", 0, 0, width, height);
				instructionText();
				break;
			case 1:
				background(109, 255, 198);
				text("Fourth screen goes here, part of intro class", 0, 0, width, height);
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
		switch(previousLocation) {
			case "intro":
				return "end";
			default:
				return "intro";
		}
	}
	void keyReleased(int codedKey) {
		println("Some key pressed");
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
