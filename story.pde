int level = 0;
String previousStoryLine;
String storyLine = "intro";
Intro introduction;
Emdash emdash;

void setup() {
	size(800, 800);
	introduction = new Intro();
	background(255);
}

void draw() {
	switch(storyLine) {
		case "intro":
			if (!introduction.isComplete()) {
				introduction.update();
			} else {
				previousStoryLine = "intro";
				storyLine = introduction.getNextStoryLine();
				emdash = new Emdash(previousStoryLine);
			}
			break;
		case "emdash":
			if (!emdash.isComplete()) {
				emdash.update();
			} else {
				previousStoryLine = "emdash";
				storyLine = emdash.getNextStoryLine();
			}
			break;
		case "end":
			background(255);
			fill(198, 255, 90);
			ellipse(400, 200, 50, 50);
		default:
			println("We are fucking done");
	}
}
