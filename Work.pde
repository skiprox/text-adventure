class Work extends SceneHelper {
	int timesSaidYes = 0;
	int timesSaidNo = 0;
	PImage boss;
	PImage war1;
	PImage war2;
	PImage war3;
	PImage war4;
	PImage war5;
	Work() {
		incrementer = 0;
		showCutScenes = true;
		boss = loadImage("baby.png");
		war1 = loadImage("war-1.png");
		war2 = loadImage("war-2.png");
		war3 = loadImage("war-3.png");
		war4 = loadImage("war-4.png");
		war5 = loadImage("war-5.png");
	}
	// Basically the draw function
	void update() {
		switch (incrementer) {
			case 0:
				background(color1);
				writeCenterText("Welcome to work! Here at Terror Corp, a US military subsidiary, you play a small but vital role in the war on terror. As an unmanned drone operator it is your job to assess the threat levels of situations and decide whether to bomb the targets or not.", 24);
				instructionText();
				break;
			case 1:
				background(color1);
				image(boss, 0, 0);
				writeCenterText("BOSS: Why are you late?!?", 40);
				instructionText();
				break;
			case 2:
				background(color1);
				image(boss, 0, 0);
				writeCenterText("BOSS: This is unacceptable! I don't care if you have cancer – everyone has cancer! If this pattern of behavior continues I'll have no choice but to fire you. How do you think that would make me feel, huh?", 24);
				instructionText();
				break;
			case 3:
				showCutScenes = false;
				background(color2);
				image(war1, 0, 0);
				writeCenterText("This is your first target – should you bomb them?", 40);
				instructionText();
				break;
			case 4:
				background(color3);
				image(war2, 0, 0);
				writeCenterText("This is your second target – should you bomb them?", 40);
				instructionText();
				break;
			case 5:
				background(color1);
				image(war3, 0, 0);
				writeCenterText("This is your third target – should you bomb them?", 40);
				instructionText();
				break;
			case 6:
				background(color2);
				image(war4, 0, 0);
				writeCenterText("This is your fourth target – should you bomb them?", 40);
				instructionText();
				break;
			case 7:
				background(color3);
				image(war5, 0, 0);
				writeCenterText("This is your fifth target – should you bomb them?", 40);
				instructionText();
				break;
			case 8:
				showCutScenes = true;
				background(color4);
				image(boss, 0, 0);
				if (timesSaidYes >= 3) {
					writeCenterText("BOSS: Congratulations! You have been promoted for your excellent work. Americans will sleep well tonight knowing that everyone attending that wedding party was slaughtered. You can never be too careful. Looks to be about quitting time, why don't you take off and get a good night sleep – you have another big day ahead of you tomorrow.", 24);
				} else {
					writeCenterText("BOSS: Unfortunately, we're going to have to let you go. Since you never had healthcare there's not much paperwork to take care of. Please collect your things. Security will escort you out of the building.", 24);
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
			writeBottomText("(press space to continue)", 20);
		} else {
			writeBottomText("(press 'Y' to bomb, or 'N' to not)", 20);
		}
	}
}
