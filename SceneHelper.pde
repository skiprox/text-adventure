class SceneHelper {
	int incrementer;
	boolean showCutScenes;
	String nextScene;
	color[] colorArray = {color(255, 109, 198), color(198, 255, 109), color(109, 198, 255), color(109, 255, 198)};
	void writeCenterText(String textString, int fontSize) {
		textSize(fontSize);
		textAlign(CENTER, CENTER);
		fill(255);
		text(textString, 21, 1, width - 40, height);
		fill(0);
		text(textString, 20, 0, width - 40, height);
	}
	void writeBottomText(String textString, int fontSize) {
		textSize(fontSize);
		textAlign(CENTER, BOTTOM);
		fill(255);
		text(textString, 21, -19, width - 40, height);
		fill(0);
		text(textString, 20, -20, width - 40, height);
	}
}