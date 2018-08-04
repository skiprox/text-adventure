class Emdash {
	int incrementer;
	String previousLocation = "suckit";
	Emdash(String previousStoryLine) {
		previousLocation = previousStoryLine;
		incrementer = 0;
	}
	void draw() {

	}
	// Basically the draw function
	void update() {
		background(198, 109, 255);
		fill(255, 198, 90);
		ellipse(100, 100, 50, 50);
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
	void keyReleased() {
		println("Some key pressed");
		incrementer++;
	}
}
