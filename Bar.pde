class Bar {
	int incrementer;
	boolean showCutScenes;
	String nextScene;
	color color1 = color(255, 109, 198);
	color color2 = color(198, 255, 109);
	color color3 = color(109, 198, 255);
	color color4 = color(109, 255, 198);
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
		textSize(40);
		textAlign(CENTER, CENTER);
		fill(0);
		switch (incrementer) {
			case 0:
				background(color1);
				text("Bar screen 1", 20, 0, width - 40, height);
				instructionText();
				break;
			case 1:
				background(color2);
				text("Bar screen 2", 20, 0, width - 40, height);
				instructionText();
				break;
			case 2:
				background(color3);
				text("Bar screen 3", 20, 0, width - 40, height);
				instructionText();
				break;
			case 3:
				showCutScenes = false;
				background(color1);
				text("Do you want to talk to a stranger?", 20, 0, width - 40, height);
				instructionText();
				break;
			case 4:
				textSize(24);
				showCutScenes = true;
				background(color2);
				image(barPerson1, 0, 0);
				text("STRANGER: Is that a PLASTIC STRAW you're using?! Don't you know those things are horrible for the environment?", 20, 0, width - 40, height);
				instructionText();
				break;
			case 5:
				textSize(24);
				showCutScenes = true;
				background(color3);
				image(barPerson1, 0, 0);
				text("STRANGER: As senior vice president of sales at Exxon, Chevron, Conoco & Associates I made sure we pushed an initiative that eliminated all plastic straws in our company breakrooms. What have YOU ever done for the environment?", 20, 0, width - 40, height);
				instructionText();
				break;
			case 6:
				textSize(40);
				showCutScenes = false;
				background(color1);
				text("Do you want to talk to a stranger?", 20, 0, width - 40, height);
				instructionText();
				break;
			case 7:
				showCutScenes = true;
				background(color2);
				image(barPerson2, 0, 0);
				text("STRANGER: ....", 20, 0, width - 40, height);
				instructionText();
				break;
			case 8:
				showCutScenes = true;
				background(color3);
				image(barPerson2, 0, 0);
				text("STRANGER: ....", 20, 0, width - 40, height);
				instructionText();
				break;
			case 9:
				showCutScenes = false;
				background(color1);
				text("Do you want to talk to a stranger?", 20, 0, width - 40, height);
				instructionText();
				break;
			case 10:
				showCutScenes = true;
				background(color2);
				image(barPerson3, 0, 0);
				text("STRANGER: ....", 20, 0, width - 40, height);
				instructionText();
				break;
			case 11:
				showCutScenes = true;
				background(color3);
				image(barPerson3, 0, 0);
				text("STRANGER: ....", 20, 0, width - 40, height);
				instructionText();
				break;
			case 12:
				showCutScenes = true;
				background(color4);
				text("You are drunk. You pass out.", 20, 0, width - 40, height);
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
		println(codedKey);
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
			textSize(20);
			textAlign(CENTER, BOTTOM);
			fill(0);
			text("(press space to continue)", 20, 0, width - 40, height);
		} else {
			textSize(20);
			textAlign(CENTER, BOTTOM);
			fill(0);
			text("(press 'Y' to talk to stranger, or 'N' to continue drinking)", 20, 0, width - 40, height);
		}
	}
}
