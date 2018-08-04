int level = 0;
String previousStoryLine;
String storyLine = "intro";
Intro intro;
Emdash emdash;
Work work;
Home home;

void setup() {
	size(800, 800);
	intro = new Intro();
	background(255);
}

void draw() {
	switch (storyLine) {
		case "intro":
			if (!intro.isComplete()) {
				intro.update();
			} else {
				previousStoryLine = "intro";
				storyLine = intro.getNextStoryLine();
				if (storyLine == "work") {
					work = new Work();
				} else if (storyLine == "home") {
					home = new Home();
				}
			}
			break;
		case "work":
			if (!work.isComplete()) {
				work.update();
			} else {
				previousStoryLine = "work";
				storyLine = work.getNextStoryLine();
			}
			break;
		case "home":
			if (!home.isComplete()) {
				home.update();
			} else {
				previousStoryLine = "home";
				storyLine = home.getNextStoryLine();
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
			println("We are at the end");
			break;
		default:
			println("We are fucking done");
	}
}

void keyReleased() {
	switch (storyLine) {
		case "intro":
			intro.keyReleased(keyCode);
			break;
		case "emdash":
			emdash.keyReleased(keyCode);
			break;
		case "work":
			work.keyReleased(keyCode);
			break;
		case "home":
			home.keyReleased(keyCode);
			break;
		case "end":
			break;
	}
}
