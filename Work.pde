class Work {
	int incrementer;
	boolean showCutScenes;
	int timesSaidYes = 0;
	int timesSaidNo = 0;
	color color1 = color(255, 109, 198);
	color color2 = color(198, 255, 109);
	color color3 = color(109, 198, 255);
	color color4 = color(109, 255, 198);
	Work() {
		incrementer = 0;
		showCutScenes = true;
	}
	// Basically the draw function
	void update() {
		textSize(40);
		textAlign(CENTER, CENTER);
		fill(0);
		switch (incrementer) {
			case 0:
				background(color1);
				text("Welcome to work! Here at Terror Corp, a US military subsidiary, you play a small but vital role in the war on terror. As an unmanned drone operator it is your job to assess the threat levels of situations and decide whether to bomb the targets or not.", 0, 0, width, height);
				instructionText();
				break;
			case 1:
				showCutScenes = false;
				background(color2);
				text("This is your first target – should you bomb them?", 0, 0, width, height);
				instructionText();
				break;
			case 2:
				background(color3);
				text("This is your second target – should you bomb them?", 0, 0, width, height);
				instructionText();
				break;
			case 3:
				background(color1);
				text("This is your third target – should you bomb them?", 0, 0, width, height);
				instructionText();
				break;
			case 4:
				background(color2);
				text("This is your fourth target – should you bomb them?", 0, 0, width, height);
				instructionText();
				break;
			case 5:
				background(color3);
				text("This is your fifth target – should you bomb them?", 0, 0, width, height);
				instructionText();
				break;
			case 6:
				showCutScenes = true;
				background(color4);
				if (timesSaidYes >= 3) {
					text("Congratulations! You have been promoted for your excellent work. Americans will sleep well tonight knowing that everyone attending that wedding party was slaughtered. You can never be too careful. Looks to be about quitting time, why don't you take off and get a good night sleep – you have another big day ahead of you tomorrow.", 0, 0, width, height);
				} else {
					text("Unfortunately you have been fired. Please collect your things. Security will escort you out of the building.", 0, 0, width, height);
				}
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
		println(codedKey);
		if (showCutScenes && codedKey == 32) {
			incrementer++;
		} else if (!showCutScenes && codedKey == 89) { // bomb
			timesSaidYes++;
			incrementer++;
		} else if (!showCutScenes && codedKey == 78) { // no bomb
			timesSaidNo++;
			incrementer++;
		}
	}
	// Show the correct instruction text at the bottom of the screen
	void instructionText() {
		if (showCutScenes) {
			textSize(20);
			textAlign(CENTER, BOTTOM);
			fill(0);
			text("(press space to continue)", 0, 0, width, height);
		} else {
			textSize(20);
			textAlign(CENTER, BOTTOM);
			fill(0);
			text("(press 'Y' to bomb, or 'N' to not)", 0, 0, width, height);
		}
	}
}
