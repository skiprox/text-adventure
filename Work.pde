class Work {
	int incrementer;
	boolean showCutScenes;
	int timesSaidYes = 0;
	int timesSaidNo = 0;
	color color1 = color(255, 109, 198);
	color color2 = color(198, 255, 109);
	color color3 = color(109, 198, 255);
	color color4 = color(109, 255, 198);
	PImage boss;
	Work() {
		incrementer = 0;
		showCutScenes = true;
		boss = loadImage("baby.png");
	}
	// Basically the draw function
	void update() {
		textSize(40);
		textAlign(CENTER, CENTER);
		fill(0);
		switch (incrementer) {
			case 0:
				background(color1);
				textSize(24);
				text("Welcome to work! Here at Terror Corp, a US military subsidiary, you play a small but vital role in the war on terror. As an unmanned drone operator it is your job to assess the threat levels of situations and decide whether to bomb the targets or not.", 20, 0, width - 40, height);
				instructionText();
				break;
			case 1:
				background(color1);
				textSize(40);
				image(boss, 0, 0);
				text("BOSS: Why are you late?!?", 20, 0, width - 40, height);
				instructionText();
				break;
			case 2:
				background(color1);
				textSize(24);
				image(boss, 0, 0);
				text("BOSS: This is unacceptable! I don't care if you have cancer – everyone has cancer! If this pattern of behavior continues I'll have no choice but to fire you. How do you think that would make me feel, huh?", 20, 0, width - 40, height);
				instructionText();
				break;
			case 3:
				showCutScenes = false;
				textSize(40);
				background(color2);
				text("This is your first target – should you bomb them?", 20, 0, width - 40, height);
				instructionText();
				break;
			case 4:
				background(color3);
				text("This is your second target – should you bomb them?", 20, 0, width - 40, height);
				instructionText();
				break;
			case 5:
				background(color1);
				text("This is your third target – should you bomb them?", 20, 0, width - 40, height);
				instructionText();
				break;
			case 6:
				background(color2);
				text("This is your fourth target – should you bomb them?", 20, 0, width - 40, height);
				instructionText();
				break;
			case 7:
				background(color3);
				text("This is your fifth target – should you bomb them?", 20, 0, width - 40, height);
				instructionText();
				break;
			case 8:
				showCutScenes = true;
				background(color4);
				image(boss, 0, 0);
				if (timesSaidYes >= 3) {
					textSize(24);
					text("BOSS: Congratulations! You have been promoted for your excellent work. Americans will sleep well tonight knowing that everyone attending that wedding party was slaughtered. You can never be too careful. Looks to be about quitting time, why don't you take off and get a good night sleep – you have another big day ahead of you tomorrow.", 20, 0, width - 40, height);
				} else {
					textSize(24);
					text("BOSS: Unfortunately, we're going to have to let you go. Since you never had healthcare there's not much paperwork to take care of. Please collect your things. Security will escort you out of the building.", 20, 0, width - 40, height);
				}
				instructionText();
				break;
		}
	}
	// Check if this story line is complete
	boolean isComplete() {
		return incrementer >= 9;
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
			text("(press space to continue)", 20, 0, width - 40, height);
		} else {
			textSize(20);
			textAlign(CENTER, BOTTOM);
			fill(0);
			text("(press 'Y' to bomb, or 'N' to not)", 20, 0, width - 40, height);
		}
	}
}
