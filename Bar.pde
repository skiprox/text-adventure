class Bar extends SceneHelper {
	PImage barPerson1;
	PImage barPerson2;
	PImage barPerson3;
	Bar() {
		incrementer = 0;
		showCutScenes = true;
		barPerson1 = loadImage("bar-person-2.png");
		barPerson2 = loadImage("bar-person-3.png");
		barPerson3 = loadImage("bar-person-4.png");
	}
	// Basically the draw function
	void update() {
		switch (incrementer) {
			case 0:
				background(color1);
				writeCenterText("Bar screen 1", 40);
				instructionText();
				break;
			case 1:
				background(color2);
				writeCenterText("Bar screen 2", 40);
				instructionText();
				break;
			case 2:
				background(color3);
				writeCenterText("Bar screen 3", 40);
				instructionText();
				break;
			case 3:
				showCutScenes = false;
				background(color1);
				writeCenterText("Do you want to talk to a stranger?", 40);
				instructionText();
				break;
			case 4:
				showCutScenes = true;
				background(color2);
				image(barPerson1, 0, 0);
				writeCenterText("STRANGER: Is that a PLASTIC STRAW you're using?! Don't you know those things are horrible for the environment?", 24);
				instructionText();
				break;
			case 5:
				showCutScenes = true;
				background(color3);
				image(barPerson1, 0, 0);
				writeCenterText("STRANGER: As senior vice president of sales at Exxon, Chevron, Conoco & Associates I made sure we pushed an initiative that eliminated all plastic straws in our company breakrooms. What have YOU ever done for the environment?", 24);
				instructionText();
				break;
			case 6:
				showCutScenes = false;
				background(color1);
				writeCenterText("Do you want to talk to a stranger?", 40);
				instructionText();
				break;
			case 7:
				showCutScenes = true;
				background(color2);
				image(barPerson2, 0, 0);
				writeCenterText("STRANGER: ....", 24);
				instructionText();
				break;
			case 8:
				showCutScenes = true;
				background(color3);
				image(barPerson2, 0, 0);
				writeCenterText("STRANGER: ....", 24);
				instructionText();
				break;
			case 9:
				showCutScenes = false;
				background(color1);
				writeCenterText("Do you want to talk to a stranger?", 40);
				instructionText();
				break;
			case 10:
				showCutScenes = true;
				background(color2);
				image(barPerson3, 0, 0);
				writeCenterText("STRANGER: ....", 24);
				instructionText();
				break;
			case 11:
				showCutScenes = true;
				background(color3);
				image(barPerson3, 0, 0);
				writeCenterText("STRANGER: ....", 24);
				instructionText();
				break;
			case 12:
				showCutScenes = true;
				background(color4);
				writeCenterText("You are drunk. You pass out.", 40);
				instructionText();
				break;
		}
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 13;
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
			incrementer = 9;
		}
	}
	// Show the correct instruction text at the bottom of the screen
	void instructionText() {
		if (showCutScenes) {
			writeBottomText("(press space to continue)", 20);
		} else {
			writeBottomText("(press 'Y' to talk to stranger, or 'N' to continue drinking)", 20);
		}
	}
}
