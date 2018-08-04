class Intro {
	int incrementer;
	Intro() {
		incrementer = 0;
	}
	void draw() {

	}
	// Basically the draw function
	void update() {
		background(255, 109, 198);
	    fill(90, 198, 255);
	    ellipse(400, 400, 50, 50);
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 2;
	}
	// Return the story line we should continue on next
	String getNextStoryLine() {
		return "emdash";
	}
	void keyReleased() {
		println("some key pressed");
		incrementer++;
	}
}
