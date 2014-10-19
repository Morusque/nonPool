
ArrayList<Generator> generators = new ArrayList<Generator>();

<<<<<<< HEAD
int maxFramesInOneAnim = 10;

=======
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
class Generator extends Thread {

  boolean running;
  int wait;// minimum frame time in milliseconds
  String id;
  int count;// frame counter
  int index;
  float[][][] kernel;

  int currentGenerate=0;

<<<<<<< HEAD
  int maxFramesInThisAnim=maxFramesInOneAnim;

=======
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
  DataProvider dataProvider;

  Generator(int w, String s, int index) {
    wait = w;
    running = false;
    id = s;
    this.index=index;
    count = 0;
    // TODO generate just one picture for the first Animation
    dataProvider = new DataProvider("_");// TODO warning duplicate, do it also for the kernel
    regenerateKernel(dataProvider.lettersData);
    findNextAvailableAnim();
  }

  int getCount() {
    return count;
  }

  void start () {
    running = true;
    super.start();
  }

  int modType=0;

<<<<<<< HEAD
  void update() {
    if (Runtime.getRuntime ().freeMemory()>=10000000) {
      modType = floor(pow(dataProvider.getNextWordData(), 1.45f)*20)+1;
      if (floor(dataProvider.getNextWordData()*1000)%5<1.5f) modType=0;
      animations.get(currentGenerate).applyToBlendFrame(dataProvider.getNextLetterData());
      animations.get(currentGenerate).applyText(dataProvider.text, dataProvider.getNextLetterData());
      if (modType==0) animations.get(currentGenerate).applyKernel(kernel);
      if (modType==1) animations.get(currentGenerate).applyZoom(dataProvider.getNextLetterData(), dataProvider.getNextLetterData());      
      if (modType==2) animations.get(currentGenerate).applyHSBShift(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==3) animations.get(currentGenerate).applyCut(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==4) animations.get(currentGenerate).applySorting(dataProvider.getNextLetterData());
      if (modType==5) animations.get(currentGenerate).applySwitching(dataProvider.getNextLetterData());
      if (modType==6) animations.get(currentGenerate).applyBlur(dataProvider.getNextLetterData());
      if (modType==7) animations.get(currentGenerate).applyRotate(dataProvider.getNextLetterData());
      if (modType==8) animations.get(currentGenerate).applyP5Filter(dataProvider.getNextLetterData(), dataProvider.getNextLetterData());      
      if (modType==9) animations.get(currentGenerate).applyOverShoot(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==10) animations.get(currentGenerate).applyPosterize(dataProvider.getNextLetterData());
      if (modType==11) animations.get(currentGenerate).applyMosaik(dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==12) animations.get(currentGenerate).applyCopy(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());      
      if (modType==13) animations.get(currentGenerate).applyTorsion(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==14) animations.get(currentGenerate).applyPixelize(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==15) animations.get(currentGenerate).applyRegionRotations(dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==16) animations.get(currentGenerate).applyLayerShift(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==17) animations.get(currentGenerate).applyLerpHue(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==18) animations.get(currentGenerate).applyShift(dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==19) animations.get(currentGenerate).applyRectangle(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==20) animations.get(currentGenerate).applySubcells(dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (animations.get(currentGenerate).adaptSpeedToChanges()>7) {
        maxFramesInThisAnim=constrain(maxFramesInThisAnim+1, 1, maxFramesInOneAnim*2);
      }
      animations.get(currentGenerate).copyToNextFrame();
    }    
    if (animations.get(currentGenerate).frames.size()>maxFramesInThisAnim) {
=======
  int maxFramesInOneAnim = 7;

  void update() {
    if (Runtime.getRuntime ().freeMemory()>=10000000) {
      modType = floor(pow(dataProvider.getNextWordData(), 2.0f)*16);
      animations.get(currentGenerate).applyToBlendFrame(dataProvider.getNextLetterData());
      animations.get(currentGenerate).applyText(dataProvider.text, dataProvider.getNextLetterData());
      if (modType==0) animations.get(currentGenerate).applyKernel(kernel);
      if (modType==1) animations.get(currentGenerate).applySorting(dataProvider.getNextLetterData());
      if (modType==2) animations.get(currentGenerate).applySwitching(dataProvider.getNextLetterData());
      if (modType==3) animations.get(currentGenerate).applyOverShoot(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==4) animations.get(currentGenerate).applyPosterize(dataProvider.getNextLetterData());
      if (modType==5) animations.get(currentGenerate).applyP5Filter(dataProvider.getNextLetterData(), dataProvider.getNextLetterData());      
      if (modType==6) animations.get(currentGenerate).applyBlur(dataProvider.getNextLetterData());
      if (modType==7) animations.get(currentGenerate).applyPixelize(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==8) animations.get(currentGenerate).applyLayerShift(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==9) animations.get(currentGenerate).applyLerpHue(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==10) animations.get(currentGenerate).applyHSBShift(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==11) animations.get(currentGenerate).applyShift(dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==12) animations.get(currentGenerate).applyTorsion(dataProvider.getNextLetterData(), dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==13) animations.get(currentGenerate).applyMosaik(dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==14) animations.get(currentGenerate).applyRegionRotations(dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      if (modType==15) animations.get(currentGenerate).applySubcells(dataProvider.getNextLetterData(), dataProvider.getNextLetterData());
      animations.get(currentGenerate).adaptSpeedToChanges();
      animations.get(currentGenerate).copyToNextFrame();
    }    
    if (animations.get(currentGenerate).frames.size()>maxFramesInOneAnim) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
      switchToNextAnim();
    }
    if (Runtime.getRuntime ().freeMemory()<10000000 && !animations.get(0).frames.isEmpty()) {
      animations.get(0).removeOldFrames(2);
      System.gc();
    }
  }

  void switchToNextAnim() {
    animations.get(currentGenerate).generated=true;
    int lastGenerated = currentGenerate;
    findNextAvailableAnim();
    animations.get(currentGenerate).empty();
    try {
      String[] next = loadStrings("http://www.tntb.net/nonPool/getNextSentence");
      dataProvider = new DataProvider(next[0]);
    } 
    catch (Exception e) {
      String text = wordList[floor(random(wordList.length))];
      if (random(1)<0.5) text+=" "+wordList[floor(random(wordList.length))];
      dataProvider =  new DataProvider(text);
<<<<<<< HEAD
      println("Generator switch, from web : "+e.toString());
=======
      println(e.toString());
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
    }
    if (!animations.get(lastGenerated).frames.isEmpty()) {
      animations.get(currentGenerate).addFrame(animations.get(lastGenerated).frames.get(animations.get(lastGenerated).frames.size()-1));
      try {
        String translation = loadStrings("http://www.officialdatabase.org/translate/?text="+dataProvider.text)[0];
        String flickrUrl = loadStrings("http://www.officialdatabase.org/flickrQuery/?text="+translation)[0];
        String tumblrUrl = loadStrings("http://www.officialdatabase.org/tumblr/?query="+translation)[0];
        String imageUrl = "";
        if (flickrUrl.length()>0) imageUrl=flickrUrl;
        if (tumblrUrl.length()>0) imageUrl=tumblrUrl;
        if (!imageUrl.equals("")) {
          println("loading picture from the web > "+imageUrl);
          PImage webIm = loadImage(imageUrl);
          if (webIm.width>0&&webIm.height>0) {
            float screenRatio = (float)width / (float)height;
            float heightGoal = (float)webIm.height*2/5;
            float widthGoal = heightGoal*screenRatio;
            webIm=webIm.get(floor(((float)webIm.width/2)-widthGoal/2), floor(((float)webIm.height/2)-heightGoal/2), floor(widthGoal), floor(heightGoal));
            webIm.resize(width, height);
            animations.get(currentGenerate).setToBlendFrame(webIm);
          }
        }
      }
      catch(Exception e) {
<<<<<<< HEAD
        println("Generator switch, pics from web : "+e);
      }
    }
    maxFramesInThisAnim=maxFramesInOneAnim;
=======
        println(e);
      }
    }
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
    regenerateKernel(dataProvider.lettersData);
    System.gc();
  }

  void findNextAvailableAnim() {
    boolean taken=true;
    while (taken) {
      taken=false;
      currentGenerate=(currentGenerate+1)%animations.size();
      if (currentGenerate!=currentDisplay) {
<<<<<<< HEAD
        for (int i=0; i<generators.size (); i++) if (i!=this.index) if (generators.get(i).currentGenerate==currentGenerate) taken=true;
=======
        for (int i=0;i<generators.size();i++) if (i!=this.index) if (generators.get(i).currentGenerate==currentGenerate) taken=true;
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
      }
    }
  }

  void run () {
    while (running) {
      update();
      count++;
      try {
        sleep((long)(wait));
      }
      catch (Exception e) {
<<<<<<< HEAD
        println("Generator run : "+e.toString());
=======
        println(e.toString());
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
      }
    }
  }

  void quit() {
    running = false;
    interrupt();
  }

  void regenerateKernel(float[] data) {
<<<<<<< HEAD
    int xS = max(floor(data[0]*10), 1);
    int yS = max(floor(data[1%data.length]*9), 2);
=======
    int xS = max(floor(data[0]*7), 1);
    int yS = max(floor(data[1%data.length]*7), 2);
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
    if (xS+yS==2) yS++;
    kernel = generateKernel(xS, yS, data);
  }
}

class DataProvider {
  int lCounter=0;
  int wCounter=0;
  float[] lettersData;
  float[] wordsData;
  boolean wRetrigger;
  boolean lRetrigger;
  String text = "";
  DataProvider(String _text) {
    this.text = _text;
    int v=0;
    lettersData = new float[text.length()];
<<<<<<< HEAD
    for (int i=0; i<text.length (); i++) {
      v+=(int)floor(pow(text.charAt(i), 1.5));
      lettersData[i]=((float)v%0x200)/0x200;
    }
    wRetrigger = ((v%6)==0);
    lRetrigger = ((v%4)==0);
=======
    for (int i=0;i<text.length();i++) {
      v+=(int)floor(pow(text.charAt(i), 1.5));
      lettersData[i]=((float)v%0x200)/0x200;
    }
    wRetrigger = (v%4==0);
    lRetrigger = (v%5==0);
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
    String[] words = text.split(" ");
    if (words.length==0) {
      words = new String[1];
      words[0] = " ";
    }
    wordsData = new float[words.length];
<<<<<<< HEAD
    for (int i=0; i<words.length; i++) {
      wordsData[i]=0;
      for (int j=0; j<words[i].length (); j++) {
=======
    for (int i=0;i<words.length;i++) {
      wordsData[i]=0;
      for (int j=0;j<words[i].length();j++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        wordsData[i]+=words[i].charAt(j);
      }
      wordsData[i]=(wordsData[i]%0x200)/0x200;
    }
    lCounter=0;
    wCounter=0;
  }
  float getNextWordData() {
    if (wRetrigger) wCounter=0;
    else wCounter=(wCounter+1)%wordsData.length;
    return wordsData[wCounter];
  }
  float getNextLetterData() {
    if (lRetrigger) lCounter=0;
    else lCounter=(lCounter+1)%lettersData.length;
    return lettersData[lCounter];
  }
}

float[][][] generateKernel(int sizeX, int sizeY, float[] data) {
  int dataCounter=0;
  float[][][] kernel = new float[sizeX][sizeY][3];
<<<<<<< HEAD
  for (int x=0; x<kernel.length; x++) {
    for (int y=0; y<kernel[x].length; y++) {
      for (int c=0; c<kernel[x][y].length; c++) {
        kernel[x][y][c]=map(pow(data[dataCounter], 2)*(data[dataCounter]<=0?-1:1), 0, 1, -2, 2);
=======
  for (int x=0;x<kernel.length;x++) {
    for (int y=0;y<kernel[x].length;y++) {
      for (int c=0;c<kernel[x][y].length;c++) {
        kernel[x][y][c]=map(data[dataCounter], 0, 1, -2, 2);
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        dataCounter=(dataCounter+1)%data.length;
      }
    }
  }
  return kernel;
}

