
ArrayList<Animation> animations = new ArrayList<Animation>();

int currentDisplay=0;

String[] wordList;
PFont font;

int nbAnimations = 10;
int nbGenerators = 1;

void setup() {
  size(1280, 720, JAVA2D);
  frame.setResizable(true);
  frameRate(26);
  wordList = loadStrings(dataPath("wordList.txt"));
  for (int i=0;i<nbAnimations;i++) animations.add(new Animation());
  setupOSC();
  for (int i=0;i<nbGenerators;i++) generators.add(new Generator(100, "generator", i));// TODO lower frame rate
  for (int i=0;i<generators.size();i++) generators.get(i).start();
  font = loadFont("AmigaForeverPro-48.vlw");
}

void draw() {
  display();
}

void keyPressed() {
  if (keyCode==TAB) {
    for (int i=0;i<animations.get(currentDisplay).frames.size();i++) animations.get(currentDisplay).frames.get(i).save(dataPath("export/current"+"_"+nf(i, 5)+".png"));
  }
}

void exit() {
  for (int i=0;i<nbGenerators;i++) generators.get(i).quit();
  super.exit();
}

