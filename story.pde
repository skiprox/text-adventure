/*
 * STORY LINES
 * ------------
 * Intro
 * Work
 * Home
 * Emdash
 * Tv
 * Bar
 * End 
 */
import processing.sound.*;
SoundFile musicIntro;
SoundFile musicWork;
SoundFile musicHome;
SoundFile musicEmdash;
SoundFile musicTv;
SoundFile musicBar;
SoundFile musicEnd;


int level = 0;
String previousStoryLine;
String storyLine = "intro";
Intro intro;
Emdash emdash;
Work work;
Home home;
Bar bar;
Tv tv;
End end;

void setup() {
	size(800, 600);
	intro = new Intro();
	background(255);
	musicIntro = new SoundFile(this, "intro.mp3");
	musicWork = new SoundFile(this, "work.mp3");
	musicHome = new SoundFile(this, "home.mp3");
	musicTv = new SoundFile(this, "tv.mp3");
	musicEmdash = new SoundFile(this, "emdash.mp3");
	musicBar = new SoundFile(this, "bar.mp3");
	musicEnd = new SoundFile(this, "end.mp3");
	musicIntro.loop();
}

void draw() {
	switch (storyLine) {
		case "intro":
			if (!intro.isComplete()) {
				intro.update();
			} else {
				previousStoryLine = "intro";
				storyLine = intro.getNextStoryLine();
				musicIntro.stop();
				if (storyLine == "work") {
					work = new Work();
					musicWork.loop();
				} else if (storyLine == "home") {
					home = new Home();
					musicHome.loop();
				}
			}
			break;
		case "work":
			if (!work.isComplete()) {
				work.update();
			} else {
				previousStoryLine = "work";
				storyLine = work.getNextStoryLine();
				musicWork.stop();
				if (storyLine == "end") {
					musicEnd.loop();
					end = new End();
				}
			}
			break;
		case "home":
			if (!home.isComplete()) {
				home.update();
			} else {
				previousStoryLine = "home";
				storyLine = home.getNextStoryLine();
				musicHome.stop();
				if (storyLine == "bar") {
					bar = new Bar();
					musicBar.loop();
				} else if (storyLine == "tv") {
					tv = new Tv();
					musicTv.loop();
				} else if (storyLine == "emdash") {
					emdash = new Emdash();
					musicEmdash.loop();
				}
			}
			break;
		case "bar":
			if (!bar.isComplete()) {
				bar.update();
			} else {
				previousStoryLine = "bar";
				storyLine = bar.getNextStoryLine();
				musicBar.stop();
				if (storyLine == "end") {
					musicEnd.loop();
					end = new End();
				}
			}
			break;
		case "tv":
			if (!tv.isComplete()) {
				tv.update();
			} else {
				previousStoryLine = "tv";
				storyLine = tv.getNextStoryLine();
				musicTv.stop();
				if (storyLine == "end") {
					musicEnd.loop();
					end = new End();
				}
			}
			break;
		case "emdash":
			if (!emdash.isComplete()) {
				emdash.update();
			} else {
				previousStoryLine = "emdash";
				storyLine = emdash.getNextStoryLine();
				bar = new Bar();
				musicEmdash.stop();
				musicBar.loop();
			}
			break;
		case "end":
			if (!end.isComplete()) {
				end.update();
			} else {
				previousStoryLine = "end";
				storyLine = "intro";
				intro = new Intro();
				musicEnd.stop();
				musicIntro.loop();
			}
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
			end.keyReleased(keyCode);
			break;
	}
}
