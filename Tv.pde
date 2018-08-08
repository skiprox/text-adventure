class Tv extends SceneHelper {
	PImage tv1;
	PImage tv2;
	PImage food;
	PImage war3;
	int tvScreen1Incrementer = 0;
	int tvScreen2Incrementer = 0;
	int tvScreen3Incrementer = 0;
	Tv() {
		incrementer = 0;
		showCutScenes = true;
		tv1 = loadImage("tv-1.png");
		tv2 = loadImage("tv-2.png");
		food = loadImage("lasagna.png");
		war3 = loadImage("war-3.png");
	}
	// Basically the draw function
	void update() {
		switch (incrementer) {
			case 0:
				background(colorArray[incrementer%3]);
				writeCenterText("Watching TV can be fun and relaxing.", 40);
				instructionText();
				break;
			case 1:
				showCutScenes = false;
				background(random(200, 255), random(200, 255), random(200, 255), 100);
				image(tv1, 0, 0);
				if (tvScreen1Incrementer < 140) {
					writeCenterText("WAR", 120);
				} else if (tvScreen1Incrementer < 280) {
					writeCenterText("REALLY, THAT\'S IT", 80);
				} else if (tvScreen1Incrementer < 420) {
					writeCenterText("JUST WAR", 100);
				} else {
					writeCenterText("All Day Every Day,\non The War Channel", 40);
				}
				tvScreen1Incrementer++;
				instructionText();
				break;
			case 2:
				background(random(200, 255), random(200, 255), random(200, 255), 100);
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
					writeCenterText("Every day,\non HBO-CNN-USA Network", 40);
				}
				tvScreen2Incrementer++;
				instructionText();
				break;
			case 3:
				background(random(200, 255), random(200, 255), random(200, 255), 100);
				if (tvScreen3Incrementer < 140) {
					image(war3, 0, 0);
					writeCenterText("Children Crying", 100);
				} else {
					image(war3, 0, 0);
					writeCenterText("Tuesdays,\nonly on Fox", 40);
				}
				tvScreen3Incrementer++;
				instructionText();
				break;
			case 4:
				showCutScenes = true;
				background(colorArray[3]);
				writeCenterText("You pass out", 40);
				instructionText();
				break;
		}
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 5;
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
			incrementer = 4;
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
