class Emdash {
	int incrementer;
	String previousLocation = "suckit";
	Emdash(String previousStoryLine) {
		previousLocation = previousStoryLine;
		incrementer = 0;
	}
	// Basically the draw function
	void update() {
		background(198, 109, 255);
		fill(255, 198, 90);
		ellipse(100, 100, 50, 50);
		println("sup nerds – emdash");
		incrementer++;
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 200;
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
}
