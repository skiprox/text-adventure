class Bar extends SceneHelper {
	PImage bar;
	PImage barPerson1;
	PImage barPerson2;
	PImage barPerson3;
	Bar() {
		incrementer = 0;
		showCutScenes = true;
		bar = loadImage("bar.png");
		barPerson1 = loadImage("bar-person-2.png");
		barPerson2 = loadImage("bar-person-3.png");
		barPerson3 = loadImage("bar-person-4.png");
	}
	// Basically the draw function
	void update() {
		switch (incrementer) {
			case 0:
				background(colorArray[incrementer%3]);
				writeCenterText("Hell yeah, you made it to the bar. Time to cut loose and snort some synthetic alcohol powder.", 40);
				instructionText();
				break;
			case 1:
				showCutScenes = false;
				background(colorArray[incrementer%3]);
				image(bar, 0, 0);
				writeCenterText("Do you want to talk to a stranger?", 40);
				instructionText();
				break;
			case 2:
				showCutScenes = true;
				background(colorArray[incrementer%3]);
				image(barPerson1, 0, 0);
				writeCenterText("STRANGER: Is that a PLASTIC STRAW you're using?! Don't you know those things are horrible for the environment?", 24);
				instructionText();
				break;
			case 3:
				showCutScenes = true;
				background(colorArray[incrementer%3]);
				image(barPerson1, 0, 0);
				writeCenterText("STRANGER: As senior vice president of sales at Exxon, Chevron, Conoco & Associates I made sure we pushed an initiative that eliminated all plastic straws in our company breakrooms. What have YOU ever done for the environment?", 24);
				instructionText();
				break;
			case 4:
				showCutScenes = false;
				background(colorArray[incrementer%3]);
				image(bar, 0, 0);
				writeCenterText("Do you want to talk to a stranger?", 40);
				instructionText();
				break;
			case 5:
				showCutScenes = true;
				background(colorArray[incrementer%3]);
				image(barPerson2, 0, 0);
				writeCenterText("STRANGER: My heat went out last winter and my landlord refused to do anything about it. I tried witholding rent, but he took me to court and won because technically it wasn\'t cold enough for me to die.", 24);
				instructionText();
				break;
			case 6:
				showCutScenes = true;
				background(colorArray[incrementer%3]);
				image(barPerson2, 0, 0);
				writeCenterText("STRANGER: So, I hate landlards as much as the next person – but without them, where we would get houses?", 24);
				instructionText();
				break;
			case 7:
				showCutScenes = false;
				background(colorArray[incrementer%3]);
				image(bar, 0, 0);
				writeCenterText("Do you want to talk to a stranger?", 40);
				instructionText();
				break;
			case 8:
				showCutScenes = true;
				background(colorArray[incrementer%3]);
				image(barPerson3, 0, 0);
				writeCenterText("STRANGER: I used to think that it was a mistake to bring children into this world, but then the government passed the Declining Birthrate Debt Foregiveness Act... Now I have four.", 24);
				instructionText();
				break;
			case 9:
				showCutScenes = true;
				background(colorArray[incrementer%3]);
				image(barPerson3, 0, 0);
				writeCenterText("STRANGER: And I\'ve cut my debt down to $80,000. Another 35 years and I\'ll be all paid off.", 24);
				instructionText();
				break;
			case 10:
				showCutScenes = true;
				background(colorArray[3]);
				writeCenterText("You are drunk. You pass out.", 40);
				instructionText();
				break;
		}
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 11;
	}
	// Return the story line we should continue on next
	String getNextStoryLine() {
		return "end";
	}
	// The key released listener
	void keyReleased(int codedKey) {
		if (showCutScenes && codedKey == 32) {
			incrementer++;
		} else if (!showCutScenes && codedKey == 89) { // talk to stranger
			incrementer++;
		} else if (!showCutScenes && codedKey == 78) { // continue drinking
			incrementer = 10;
		}
	}
	// Show the correct instruction text at the bottom of the screen
	void instructionText() {
		if (showCutScenes) {
			writeBottomText("(press space to continue)", 20);
		} else {
			writeBottomText("(press 'Y' to talk to stranger, or 'N' to continue getting drunk)", 20);
		}
	}
}
