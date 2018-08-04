class Intro {
	int incrementer;
	Intro() {
		incrementer = 0;
	}
	// Basically the draw function
	void update() {
		background(255, 109, 198);
	    fill(90, 198, 255);
	    ellipse(400, 400, 50, 50);
		println("sup nerds – Intro");
		incrementer++;
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 200;
	}
	// Return the story line we should continue on next
	String getNextStoryLine() {
		return "emdash";
	}
}
