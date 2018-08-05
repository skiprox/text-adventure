int level = 0;
String previousStoryLine;
String storyLine = "intro";
Intro intro;
Emdash emdash;
Work work;
Home home;
Bar bar;
Tv tv;

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
				if (storyLine == "bar") {
					bar = new Bar();
				} else if (storyLine == "tv") {
					tv = new Tv();
				} else if (storyLine == "emdash") {
					emdash = new Emdash();
				}
			}
			break;
		case "bar":
			if (!bar.isComplete()) {
				bar.update();
			} else {
				previousStoryLine = "bar";
				storyLine = bar.getNextStoryLine();
			}
			break;
		case "tv":
			if (!tv.isComplete()) {
				tv.update();
			} else {
				previousStoryLine = "tv";
				storyLine = tv.getNextStoryLine();
			}
			break;
		case "emdash":
			if (!emdash.isComplete()) {
				emdash.update();
			} else {
				previousStoryLine = "emdash";
				storyLine = emdash.getNextStoryLine();
				bar = new Bar();
			}
			break;
		case "end":
			background(255);
			textSize(120);
			textAlign(CENTER, CENTER);
			fill(0);
			text("the end", 0, 0, width, height);
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
		case "bar":
			bar.keyReleased(keyCode);
			break;
		case "tv":
			tv.keyReleased(keyCode);
			break;
		case "end":
			break;
	}
}
