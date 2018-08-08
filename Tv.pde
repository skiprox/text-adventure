class Tv extends SceneHelper {
	PImage tv1;
	PImage tv2;
	PImage food;
	int tvScreen1Incrementer = 0;
	int tvScreen2Incrementer = 0;
	int tvScreen3Incrementer = 0;
	Tv() {
		incrementer = 0;
		showCutScenes = true;
		tv1 = loadImage("tv-1.png");
		tv2 = loadImage("tv-2.png");
		food = loadImage("lasagna.png");
	}
	// Basically the draw function
	void update() {
		switch (incrementer) {
			case 0:
				background(color1);
				writeCenterText("TV screen 1", 40);
				instructionText();
				break;
			case 1:
				background(color2);
				writeCenterText("TV screen 2", 40);
				instructionText();
				break;
			case 2:
				background(color3);
				writeCenterText("TV screen 3", 40);
				instructionText();
				break;
			case 3:
				showCutScenes = false;
				background(random(100, 255), random(100, 255), random(100, 255), 100);
				image(tv1, 0, 0);
				if (tvScreen1Incrementer < 140) {
					writeCenterText("WAR", 120);
				} else if (tvScreen1Incrementer < 280) {
					writeCenterText("REALLY, THAT\'S IT", 80);
				} else {
					writeCenterText("JUST WAR", 100);
				}
				tvScreen1Incrementer++;
				instructionText();
				break;
			case 4:
				showCutScenes = false;
				background(random(100, 255), random(100, 255), random(100, 255), 100);
				if (tvScreen2Incrementer < 140) {
					image(tv2, 0, 0);
					writeCenterText("SEX", 120);
				} else if (tvScreen2Incrementer < 280) {
					image(tv2, 0, 0);
					writeCenterText("ALSO,", 120);
				} else if (tvScreen2Incrementer < 420) {
					image(food, 0, 0);
					image(tv2, 0, 0);
					writeCenterText("FOOD?", 120);
				} else {
					image(food, 0, 0);
					image(tv2, 0, 0);
					writeCenterText("Every day,\nonly on HBO-CNN-USA Network", 40);
				}
				tvScreen2Incrementer++;
				instructionText();
				break;
			case 5:
				showCutScenes = false;
				background(color3);
				writeCenterText("TV Channel 3", 120);
				instructionText();
				break;
			case 6:
				showCutScenes = true;
				background(color4);
				writeCenterText("You pass out", 40);
				instructionText();
				break;
		}
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 7;
	}
	// Return the story line we should continue on next
	String getNextStoryLine() {
		return "end";
	}
	// The key released listener
	void keyReleased(int codedKey) {
		if (showCutScenes && codedKey == 32) {
			incrementer++;
		} else if (!showCutScenes && codedKey == 89) { // Change the channel
			incrementer++;
		} else if (!showCutScenes && codedKey == 78) { // pass out
			incrementer = 9;
		}
	}
	// Show the correct instruction text at the bottom of the screen
	void instructionText() {
		if (showCutScenes) {
			writeBottomText("(press space to continue)", 20);
		} else {
			writeBottomText("(press 'Y' to change the channel, or 'N' to pass out)", 20);
		}
	}
}
