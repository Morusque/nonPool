
ArrayList<Animation> animations = new ArrayList<Animation>();

int currentDisplay=0;

String[] wordList;
<<<<<<< HEAD
PFont[] fonts = new PFont[2];

int nbAnimations = 10;
int nbGenerators = 2;

PVector framePosition;

void setup() {
  String[] params = loadStrings(dataPath("params.txt"));
  size(Integer.parseInt(params[9]), Integer.parseInt(params[11]), JAVA2D);
  ((javax.swing.JFrame) frame).getContentPane().setBackground(new java.awt.Color(0));
  frame.setResizable(true);
  framePosition = new PVector(Float.parseFloat(params[1]), Float.parseFloat(params[3]));
  nbAnimations=Integer.parseInt(params[5]);
  nbGenerators=Integer.parseInt(params[7]);
  autoSwitchAnim=Integer.parseInt(params[13]);
  maxFramesInOneAnim=Integer.parseInt(params[15]);
  println();
  frameRate(26);
  wordList = loadStrings(dataPath("wordList.txt"));
  for (int i=0; i<nbAnimations; i++) animations.add(new Animation());
  setupOSC();
  for (int i=0; i<nbGenerators; i++) generators.add(new Generator(100, "generator", i));// TODO lower frame rate
  for (int i=0; i<generators.size (); i++) generators.get(i).start();
  fonts[0] = loadFont("AmigaForeverPro-48.vlw");
  fonts[1] = loadFont("HelveticaNeue-Heavy-48.vlw");
}

void draw() {
  //frame.setLocation(floor(framePosition.x), floor(framePosition.y));
=======
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
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
  display();
}

void keyPressed() {
  if (keyCode==TAB) {
<<<<<<< HEAD
    for (int i=0; i<animations.get (currentDisplay).frames.size(); i++) animations.get(currentDisplay).frames.get(i).save(dataPath("export/current"+"_"+nf(i, 5)+".png"));
  }
  if (keyCode==ENTER) {
    switchDisplayedAnimation();
=======
    for (int i=0;i<animations.get(currentDisplay).frames.size();i++) animations.get(currentDisplay).frames.get(i).save(dataPath("export/current"+"_"+nf(i, 5)+".png"));
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
  }
}

void exit() {
<<<<<<< HEAD
  oscP5.stop();
  for (int i=0; i<nbGenerators; i++) generators.get(i).quit();
=======
  for (int i=0;i<nbGenerators;i++) generators.get(i).quit();
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
  super.exit();
}

