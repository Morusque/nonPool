
import java.awt.Color;

float globalPlayingSpeed = 0.01;

class Animation {
  ArrayList<PImage> frames = new ArrayList<PImage>();
  float currentFrame=0;
  PImage lastFrame, newFrame;
  PImage toBlendFrame;
  boolean generated=false;
  int animDirection=1;
  float specificSpeed=1;
  Animation() {
    initialize();
  }
  void initialize() {
    PGraphics thisFrame = createGraphics(width, height, JAVA2D);
    thisFrame.beginDraw();
    thisFrame.background(0);
    thisFrame.endDraw();
    addFrame(thisFrame.get());
    generated=false;
  }
  void addFrame(PImage _im) {
    frames.add(_im);
  }
  void draw() {
    if (!frames.isEmpty()) {
      try {
        // println(specificSpeed);
        if (currentFrame+globalPlayingSpeed*specificSpeed*animDirection<0) animDirection=1;
        if (currentFrame+globalPlayingSpeed*specificSpeed*animDirection>frames.size()-1) animDirection=-1;
        currentFrame = constrain(currentFrame+globalPlayingSpeed*specificSpeed*animDirection, 0, frames.size()-1);
        int nextFrame = floor(constrain(currentFrame+animDirection, 0, frames.size()-1));
        tint(0xFF);
        // TODO it seems the very fact of reading the picture removes it from the array !! WHY ?!
        image(frames.get(floor(currentFrame)), 0, 0);
        if (animDirection==1) tint(0xFF, (currentFrame%1)*(float)0x100);
        if (animDirection==-1) tint(0xFF, (1-(currentFrame%1))*(float)0x100);
        image(frames.get(nextFrame), 0, 0);
      }
      catch (Exception e) {
<<<<<<< HEAD
        println("Animation draw : "+e);
      }
    }
  }
  float adaptSpeedToChanges() {
    // check how the picture changed from last picture (not to much, not too little) and adapt the animation time accordingly (changes = slow anim, no change = fast anim)
    if (frames.size()>=2) {
      float comparison = compareFrames(frames.get(frames.size()-2), frames.get(frames.size()-1));
      specificSpeed=(specificSpeed*(frames.size()-1)/frames.size())+(comparison*1/frames.size());
      return comparison;
    }
    return 0;
=======
        println(e);
      }
    }
  }
  void adaptSpeedToChanges() {
    // check how the picture changed from last picture (not to much, not too little) and adapt the animation time accordingly (changes = slow anim, no change = fast anim)
    if (frames.size()>=2) {
      specificSpeed=(specificSpeed*(frames.size()-1)/frames.size())+(compareFrames(frames.get(frames.size()-2), frames.get(frames.size()-1))*1/frames.size());
    }
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
  }
  void setToBlendFrame(PImage f) {
    this.toBlendFrame=f;
    this.toBlendFrame.loadPixels();
  }
  void applyToBlendFrame(float mix) {
<<<<<<< HEAD
    try {
      if (toBlendFrame!=null) {
        beginModify();
        for (int x=0; x<lastFrame.width; x++) {
          for (int y=0; y<lastFrame.height; y++) {
            int thisPixel = x+y*lastFrame.width;
            color thisC = lerpColor(lastFrame.pixels[thisPixel], toBlendFrame.pixels[thisPixel], pow(mix*0.6f, 8.0f));
            setPC(newFrame, x, y, thisC);
          }
        }
        endModify();
      }
    } 
    catch (Exception e) {
      println("Animation blend frame : "+e);
=======
    if (toBlendFrame!=null) {
      beginModify();
      for (int x=0;x<lastFrame.width;x++) {
        for (int y=0;y<lastFrame.height;y++) {
          int thisPixel = x+y*lastFrame.width;
          color thisC = lerpColor(lastFrame.pixels[thisPixel], toBlendFrame.pixels[thisPixel], pow(mix*0.8f, 5.0f));
          setPC(newFrame, x, y, thisC);
        }
      }
      endModify();
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
    }
  }
  void copyToNextFrame() {
    if (!frames.isEmpty()) {
      addFrame(frames.get(frames.size()-1).get());
    }
  }
  void beginModify() {
    if (frames.isEmpty()) initialize();
    if (!frames.isEmpty()) {
      lastFrame = frames.get(frames.size()-1);
      newFrame = createImage(lastFrame.width, lastFrame.height, RGB);
      lastFrame.loadPixels();
      newFrame.loadPixels();
    }
  }
  void endModify() {
    if (!frames.isEmpty()) {
      newFrame.updatePixels();
      frames.set(frames.size()-1, newFrame);
    }
  }
  void applySubcells(float inputX, float inputY) {
    beginModify();
    int nbX = lastFrame.width;
    int nbY = lastFrame.height;
    int tabX=max(floor(pow(inputX, 5)*nbX), 1);
    int tabY=max(floor(pow(inputY, 5)*nbY), 1);
    color[][] tableau = new color[nbX][nbY]; 
<<<<<<< HEAD
    for (int x=0; x<nbX; x++) {
      for (int y=0; y<nbY; y++) {
=======
    for (int x=0;x<nbX;x++) {
      for (int y=0;y<nbY;y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        int index = (floor((float)x/tabX)+floor((float)y/tabY)*floor((float)nbX/tabX))*(tabX*tabY)+(x%tabX+(y%tabY)*tabX);
        setPC(newFrame, x, y, lastFrame.pixels[floor(index)%lastFrame.pixels.length]);
      }
    }
    endModify();
  }
  void applyShift(float xInput, float yInput) {
    beginModify();
    int xS = round((pow(xInput-0.5, 3))*lastFrame.width);
    int yS = round((pow(yInput-0.5, 3))*lastFrame.height);
<<<<<<< HEAD
    for (int x=0; x<lastFrame.width; x++) {
      for (int y=0; y<lastFrame.height; y++) {
=======
    for (int x=0;x<lastFrame.width;x++) {
      for (int y=0;y<lastFrame.height;y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        color thisColor = getPC(lastFrame, x+xS, y+yS);
        setPC(newFrame, x, y, thisColor);
      }
    }
    endModify();
  }
  void applyKernel(float[][][] kernel) {
    beginModify();
<<<<<<< HEAD
    int halfKLength = floor((float)kernel.length/2);
    for (int x=0; x<lastFrame.width; x++) {
      for (int y=0; y<lastFrame.height; y++) {
        color thisColor = getPC(lastFrame, x, y);
        float r = red(thisColor);
        float g = green(thisColor);
        float b = blue(thisColor);
        for (int xK=0; xK<kernel.length; xK++) {
          for (int yK=0; yK<kernel[xK].length; yK++) {
            color thisKColor = getPC(lastFrame, x+xK-halfKLength, y+yK-halfKLength);            
            r=constrain(r+red(thisKColor)*kernel[xK][yK][0], 0, 0xFF);
            g=constrain(g+green(thisKColor)*kernel[xK][yK][1], 0, 0xFF);
            b=constrain(b+blue(thisKColor)*kernel[xK][yK][2], 0, 0xFF);
          }
        }
        thisColor = aColor(r, g, b);//color(r, g, b);
=======
    for (int x=0;x<lastFrame.width;x++) {
      for (int y=0;y<lastFrame.height;y++) {
        color thisColor = getPC(lastFrame, x, y);
        for (int xK=0;xK<kernel.length;xK++) {
          for (int yK=0;yK<kernel[xK].length;yK++) {
            color thisKColor = getPC(lastFrame, x+xK-floor((float)kernel.length/2), y+yK-floor((float)kernel[xK].length/2));            
            float r = red(thisColor);
            float g = green(thisColor);
            float b = blue(thisColor);          
            r=constrain(r+red(thisKColor)*kernel[xK][yK][0], 0, 0xFF);
            g=constrain(g+green(thisKColor)*kernel[xK][yK][1], 0, 0xFF);
            b=constrain(b+blue(thisKColor)*kernel[xK][yK][2], 0, 0xFF);          
            thisColor = aColor(r, g, b);//color(r, g, b);
          }
        }
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        setPC(newFrame, x, y, thisColor);
      }
    }
    endModify();
  }
  void applyHSBShift(float hShift, float sShift, float bShift) {
    beginModify();
    hShift-=0.5;
    sShift-=0.5;
    bShift-=0.5;
    hShift/=10;
    sShift=pow(sShift, 3);
    bShift=pow(bShift, 3);
    sShift/=10;
    bShift/=10;
<<<<<<< HEAD
    for (int x=0; x<lastFrame.width; x++) {
      for (int y=0; y<lastFrame.height; y++) {
=======
    for (int x=0;x<lastFrame.width;x++) {
      for (int y=0;y<lastFrame.height;y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        color thisC = getPC(lastFrame, x, y);
        color newC = Color.HSBtoRGB((hue(thisC)/0xFF+hShift+1)%1, constrain(saturation(thisC)/0xFF+sShift, 0, 1), constrain(brightness(thisC)/0xFF+bShift, 0, 1));
        setPC(newFrame, x, y, newC);
      }
    }
    endModify();
  }
  void applyPixelize(float inputX1, float inputY1, float inputX2, float inputY2) {// TODO add noisy factor
    beginModify();
    int xP = max(1, floor(sq(inputX1)*50));
    int yP = max(1, floor(sq(inputY1)*50));
    int offsetX = floor(pow(inputX2, 3)*50);
    int offsetY = floor(pow(inputY2, 3)*50);
<<<<<<< HEAD
    for (int x=0; x<lastFrame.width; x++) {
      for (int y=0; y<lastFrame.height; y++) {
=======
    for (int x=0;x<lastFrame.width;x++) {
      for (int y=0;y<lastFrame.height;y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        int xPos = floor((float)((x+offsetX+lastFrame.width )%lastFrame.width )/xP)*xP;
        int yPos = floor((float)((y+offsetY+lastFrame.height)%lastFrame.height)/yP)*yP;
        setPC(newFrame, x, y, getPC(lastFrame, xPos, yPos));
      }
    }
    endModify();
  }
  void applyMosaik(float inputX, float inputY) {
    beginModify();
    int xM = max(floor(inputX*3.0f), 1);
    int yM = max(floor(inputY*3.0f), 1);
    float xMS = (float)lastFrame.width/(float)xM;
    float yMS = (float)lastFrame.height/(float)yM;
    PGraphics layer = createGraphics(lastFrame.width, lastFrame.height, JAVA2D);
    layer.beginDraw();
    layer.background(0);
<<<<<<< HEAD
    for (int x=0; x<xM; x++) {
      for (int y=0; y<yM; y++) {
=======
    for (int x=0;x<xM;x++) {
      for (int y=0;y<yM;y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        layer.image(lastFrame, x*xMS, y*yMS, xMS, yMS);
      }
    }
    layer.endDraw();
    newFrame = layer.get();
    endModify();
  }
  void applyOverShoot(float rA, float gA, float bA) {
    beginModify();
    rA*=20;
    gA*=20;
    bA*=20;
    color[][] overShoot = new color[lastFrame.width][lastFrame.height];
<<<<<<< HEAD
    for (int x=0; x<lastFrame.width; x++) {
      for (int y=0; y<lastFrame.height; y++) {
=======
    for (int x=0;x<lastFrame.width;x++) {
      for (int y=0;y<lastFrame.height;y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        color thisC = getPC(lastFrame, x, y);
        overShoot[x][y] = aColor(max((red(thisC)+rA)-0xFF, 0), max((green(thisC)+gA)-0xFF, 0), max((blue(thisC)+bA)-0xFF, 0));
      }
    }
<<<<<<< HEAD
    for (int x=0; x<lastFrame.width; x++) {
      for (int y=0; y<lastFrame.height; y++) {
        color thisC = getPC(lastFrame, x, y);
        for (int x2= (x-1+lastFrame.width)%lastFrame.width; x2<(x+2)%lastFrame.width; x2++) {
          for (int y2= (y-1+lastFrame.height)%lastFrame.height; y2<(y+2)%lastFrame.height; y2++) {
=======
    for (int x=0;x<lastFrame.width;x++) {
      for (int y=0;y<lastFrame.height;y++) {
        color thisC = getPC(lastFrame, x, y);
        for (int x2=(x-1+lastFrame.width)%lastFrame.width ; x2<(x+2)%lastFrame.width ; x2++) {
          for (int y2=(y-1+lastFrame.height)%lastFrame.height ; y2<(y+2)%lastFrame.height ; y2++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
            thisC = blendColor(thisC, overShoot[x2][y2], ADD);
          }
        }
        setPC(newFrame, x, y, thisC);
      }
    }    
    endModify();
  }
  void applyTorsion(float inputX, float inputY, float inputM) {
    beginModify();
    inputX-=0.5;
    inputY-=0.5;
    int mode = floor(inputM*3);
    float shiftY=0;
<<<<<<< HEAD
    for (int x=0; x<lastFrame.width; x++) {
      shiftY += inputY;
      float shiftX=0;
      for (int y=0; y<lastFrame.height; y++) {
=======
    for (int x=0;x<lastFrame.width;x++) {
      shiftY += inputY;
      float shiftX=0;
      for (int y=0;y<lastFrame.height;y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        shiftX += inputX;
        int posX=x;
        int posY=y;
        if (mode==0||mode==2) posX = floor(x+shiftX-((float)lastFrame.height*inputX/2)+lastFrame.width)%lastFrame.width;
        if (mode==1||mode==2) posY = floor(y+shiftY-((float)lastFrame.width*inputY/2)+lastFrame.height)%lastFrame.height;
        color thisC = getPC(lastFrame, posX, posY);
        setPC(newFrame, x, y, thisC);
      }
    }    
    endModify();
  }
  void applyLayerShift(float rSI, float gSI, float bSI) {
    beginModify();
    int rS = floor((rSI-0.5)*10);
    int gS = floor((gSI-0.5)*10);
    int bS = floor((bSI-0.5)*10);
    color[] pix = lastFrame.pixels;
<<<<<<< HEAD
    for (int x=0; x<lastFrame.width; x++) {
      for (int y=0; y<lastFrame.height; y++) {
=======
    for (int x=0;x<lastFrame.width;x++) {
      for (int y=0;y<lastFrame.height;y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        int thisPixel = x+y*lastFrame.width;
        color thisC = aColor(red(pix[(thisPixel+rS+pix.length)%pix.length]), green(pix[(thisPixel+gS+pix.length)%pix.length]), blue(pix[(thisPixel+bS+pix.length)%pix.length]));
        setPC(newFrame, x, y, thisC);
      }
    }
    endModify();
  }
  void applyBlur(float amount) {
    beginModify();
    newFrame = lastFrame; 
    lastFrame.filter(BLUR, amount*10);
    endModify();
  }
  void applyP5Filter(float which, float mix) {
    int filterChoice = floor(which*5);
    beginModify();
    newFrame=lastFrame.get();
    if (filterChoice==0) newFrame.filter(THRESHOLD);
    if (filterChoice==1) newFrame.filter(GRAY);
    if (filterChoice==2) newFrame.filter(INVERT);
    if (filterChoice==3) newFrame.filter(ERODE);
    if (filterChoice==4) newFrame.filter(DILATE);
    newFrame.loadPixels();
<<<<<<< HEAD
    for (int x=0; x<lastFrame.width; x++) {
      for (int y=0; y<lastFrame.height; y++) {
=======
    for (int x=0;x<lastFrame.width;x++) {
      for (int y=0;y<lastFrame.height;y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        int thisPixel = x+y*lastFrame.width;
        color thisC = lerpColor(newFrame.pixels[thisPixel], lastFrame.pixels[thisPixel], mix);
        setPC(newFrame, x, y, thisC);
      }
    }
    endModify();
  }
  void applyPosterize(float amount) {
    beginModify();
    newFrame = lastFrame; 
    lastFrame.filter(BLUR, 1);
    lastFrame.filter(POSTERIZE, constrain(amount*10, 3, 254));
    endModify();
  }
  void applyLerpHue(float amount, float cX, float cY) {
    beginModify();
    color c = getPC(lastFrame, floor(cX*lastFrame.width), floor(cY*lastFrame.height));
<<<<<<< HEAD
    for (int x=0; x<lastFrame.width; x++) {
      for (int y=0; y<lastFrame.height; y++) {
=======
    for (int x=0;x<lastFrame.width;x++) {
      for (int y=0;y<lastFrame.height;y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        color thisC = getPC(lastFrame, x, y);
        float hueA = (float)hue(thisC)/256;
        float hueB = (float)hue(c)/256;
        float hueC = hueA+vrMax(hueA, hueB, 1)*amount;
        float satA = (float)saturation(thisC)/256;
        float satB = (float)saturation(c)/256;
        float satC = satA+(satB-satA)*amount;
        float briA = (float)brightness(thisC)/256;
        float briB = (float)brightness(c)/256;
        float briC = briA+(briB-briA)*amount;
        color newC = Color.HSBtoRGB(hueC, satC, briC);
        setPC(newFrame, x, y, newC);
      }
    }
    endModify();
  }
  void applyRegionRotations(float dI, float rI) {// TODO do it with an offset
    beginModify();
    int partsS = floor(dI*100+1);
<<<<<<< HEAD
    if (partsS%10==0) partsS=1;
    int partsR = floor(rI*3+1);
    for (int pX=0; pX<floor (lastFrame.width/partsS); pX++) {
      for (int pY=0; pY<floor (lastFrame.height/partsS); pY++) {
=======
    int partsR = floor(rI*3+1);
    for (int pX=0;pX<floor(lastFrame.width/partsS);pX++) {
      for (int pY=0;pY<floor(lastFrame.height/partsS);pY++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        int xA = pX*partsS;
        int xB = ((pX+1)*partsS);
        int yA = pY*partsS;
        int yB = ((pY+1)*partsS);
<<<<<<< HEAD
        for (int x=xA; x<xB; x++) {
          for (int y=yA; y<yB; y++) {
=======
        for (int x=xA;x<xB;x++) {
          for (int y=yA;y<yB;y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
            if (partsR==0) setPC(newFrame, x, y, getPC(lastFrame, x, y));
            if (partsR==1) setPC(newFrame, x, y, getPC(lastFrame, y, xB-(x-xA)));
            if (partsR==2) setPC(newFrame, x, y, getPC(lastFrame, xB-(x-xA), yB-(y-yA)));
            if (partsR==3) setPC(newFrame, x, y, getPC(lastFrame, yB-(y-yA), x));
          }
        }
      }
    }
<<<<<<< HEAD
    for (int x=floor (lastFrame.width/partsS)*partsS; x<lastFrame.width; x++) {
      for (int y=0; y<lastFrame.height; y++) {
        setPC(newFrame, x, y, getPC(lastFrame, x, y));
      }
    }
    for (int y=floor (lastFrame.height/partsS)*partsS; y<lastFrame.height; y++) {
      for (int x=0; x<lastFrame.width; x++) {
=======
    for (int x=floor(lastFrame.width/partsS)*partsS;x<lastFrame.width;x++) {
      for (int y=0;y<lastFrame.height;y++) {
        setPC(newFrame, x, y, getPC(lastFrame, x, y));
      }
    }
    for (int y=floor(lastFrame.height/partsS)*partsS;y<lastFrame.height;y++) {
      for (int x=0;x<lastFrame.width;x++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        setPC(newFrame, x, y, getPC(lastFrame, x, y));
      }
    }
    endModify();
  }
  void applySorting(float _d) {
    int distance = floor(pow(_d, 5)*((float)lastFrame.height-2))+2;
    beginModify();
<<<<<<< HEAD
    for (int o=0; o<2; o++) {
      for (int x=0; x<lastFrame.width; x++) {
        for (int y=0; y+o<lastFrame.height; y+=distance) {
          color[] line = new color[min(distance, lastFrame.height-(y+o))];
          for (int i=0; i<line.length; i++) line[i]=getPC(lastFrame, x, y+i+o);
          for (int ts = line.length-1; ts>0; ts--) {
            for (int i=0; i<ts; i++) {
=======
    for (int o=0;o<2;o++) {
      for (int x=0;x<lastFrame.width;x++) {
        for (int y=0;y+o<lastFrame.height;y+=distance) {
          color[] line = new color[min(distance, lastFrame.height-(y+o))];
          for (int i=0;i<line.length;i++) line[i]=getPC(lastFrame, x, y+i+o);
          for (int ts = line.length-1;ts>0;ts--) {
            for (int i=0;i<ts;i++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
              if (brightness(line[i])>brightness(line[ts])) {
                color temp = line[i];
                line[i] = line[ts];
                line[ts] = temp;
              }
            }
          }
<<<<<<< HEAD
          for (int i=0; i<line.length; i++) setPC(newFrame, x, y+i+o, line[i]);
=======
          for (int i=0;i<line.length;i++) setPC(newFrame, x, y+i+o, line[i]);
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        }
      }
      newFrame.updatePixels();
      lastFrame=newFrame.get();
      lastFrame.loadPixels();
    }
    endModify();
  }
  void applySwitching(float _d) {
    int distance = (floor(pow(_d, 10)*((float)lastFrame.height-1))+1)*((floor(_d*2)==0)?1:-1);
    beginModify();
<<<<<<< HEAD
    for (int x=0; x<lastFrame.width; x++) {
      for (int y=0; y<lastFrame.height; y++) {
=======
    for (int x=0;x<lastFrame.width;x++) {
      for (int y=0;y<lastFrame.height;y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        int dY = (y+distance);
        if (dY<lastFrame.height&&dY>=0) {
          if (brightness(getPC(lastFrame, x, y))>brightness(getPC(lastFrame, x, dY))) {
            setPC(newFrame, x, y, getPC(lastFrame, x, dY));
            setPC(newFrame, x, dY, getPC(lastFrame, x, y));
<<<<<<< HEAD
          } else {
=======
          } 
          else {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
            setPC(newFrame, x, y, getPC(lastFrame, x, y));
            setPC(newFrame, x, dY, getPC(lastFrame, x, dY));
          }
        }
      }
    }
    endModify();
<<<<<<< HEAD
  }
  void applyZoom(float _x, float _y) {
    float ratio=100;
    float x = (pow(_x, 2)-0.1)*ratio;
    float y = (pow(_y, 2)-0.1)*ratio;
    beginModify();
    PGraphics zoomed = createGraphics(lastFrame.width, lastFrame.height, JAVA2D);
    zoomed.beginDraw();
    zoomed.image(lastFrame, -x, -y, lastFrame.width+x*2, lastFrame.height+y*2);
    zoomed.endDraw();
    newFrame=zoomed.get();
    endModify();
  }
  void applyRotate(float _r) {
    float r = _r*TWO_PI;
    beginModify();
    PGraphics zoomed = createGraphics(lastFrame.width, lastFrame.height, JAVA2D);
    zoomed.beginDraw();
    zoomed.pushMatrix();
    zoomed.translate(lastFrame.width/2, lastFrame.height/2);    
    zoomed.rotate(r);
    zoomed.translate(-lastFrame.width/2, -lastFrame.height/2);    
    zoomed.image(lastFrame, 0, 0);
    zoomed.popMatrix();    
    zoomed.endDraw();
    newFrame=zoomed.get();
    endModify();
  }
  void applyCopy(float _x, float _y, float _w, float _h) {
    beginModify();
    float x=_x*lastFrame.width;
    float y=_y*lastFrame.height;
    float w=_w*lastFrame.width/2;
    float h=_h*lastFrame.height/2;
    PGraphics zoomed = createGraphics(lastFrame.width, lastFrame.height, JAVA2D);
    zoomed.beginDraw();
    zoomed.image(lastFrame, 0, 0);
    zoomed.image(lastFrame, x, y, w, h);
    zoomed.endDraw();
    newFrame=zoomed.get();
    endModify();
  }
  void applyCut(float _a, float _b, float _t) {
    int a=floor(_a*lastFrame.height/5);
    int b=floor(_b*lastFrame.height/5);
    beginModify();
    for (int x=0; x<lastFrame.width; x++) {
      for (int y=0; y<lastFrame.height; y++) {
        if (_t<=0.5f) {
          if (x<(float)lastFrame.width/2) setPC(newFrame, x, y, getPC(lastFrame, x, (y+a+lastFrame.height)%lastFrame.height));
          else setPC(newFrame, x, y, getPC(lastFrame, x, (y+b+lastFrame.height)%lastFrame.height));
        } else {
          if (y<(float)lastFrame.height/2) setPC(newFrame, x, y, getPC(lastFrame, (x+a+lastFrame.width)%lastFrame.width, y));
          else setPC(newFrame, x, y, getPC(lastFrame, (x+b+lastFrame.width)%lastFrame.width, y));
        }
      }
    }
    endModify();
  }  
  void applyRectangle(float _x, float _y, float _r, float _g, float _b, float _a) {
    beginModify();
    float x=_x*lastFrame.width/2;
    float y=_y*lastFrame.height/2;
    PGraphics zoomed = createGraphics(lastFrame.width, lastFrame.height, JAVA2D);
    zoomed.beginDraw();
    zoomed.noStroke();
    zoomed.fill(_r*0x100, _g*0x100, _b*0x100, _a*0x100);
    zoomed.rect(x, y, lastFrame.width-x*2, lastFrame.height-y*2);
    zoomed.endDraw();
    newFrame=zoomed.get();
    endModify();
=======
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
  }  
  void applyText(String text, float p) {
    beginModify();
    PGraphics layer = createGraphics(newFrame.width, newFrame.height, JAVA2D);
    layer.beginDraw();
    layer.background(0);
    layer.image(lastFrame, 0, 0);
    layer.textSize(30);// TODO pas random
    layer.stroke(0xFF);
<<<<<<< HEAD
    layer.fill(0xFF, 0xC0);
    layer.textFont(fonts[1]);
    layer.textAlign(CENTER, CENTER);
    if (floor(p*10)%2==0) p=0;
=======
    layer.fill(0xFF);
    layer.textFont(font);
    layer.textAlign(CENTER, CENTER);
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
    layer.text(text, (float)0, (float)layer.height/5.0f+p*(float)layer.height*3.0f/5.0f, layer.width, (float)layer.height/5.0f);
    layer.endDraw();
    newFrame = layer.get();
    endModify();
  }
  void empty() {
    frames = new ArrayList<PImage>();
  }
  void removeOldFrames(int _nb) {
    try {
<<<<<<< HEAD
      for (int i=0; i<_nb; i++) {
=======
      for (int i=0;i<_nb;i++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
        if (frames.size()>0) {
          frames.remove(0);
        }
      }
      if (!frames.isEmpty()) currentFrame = (currentFrame)%frames.size();
    } 
    catch(Exception e) {
<<<<<<< HEAD
      println("Animation : "+e);
=======
      println(e);
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
    }
  }
  boolean isDisplayable() {
    if (!generated) return false;
    if (frames.isEmpty()) return false;
<<<<<<< HEAD
    for (int i=0; i<generators.size (); i++) if (animations.get(generators.get(i).currentGenerate)==this) return false;
=======
    for (int i=0;i<generators.size();i++) if (animations.get(generators.get(i).currentGenerate)==this) return false;
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
    return true;
  }
}

color getPC(PImage im, int x, int y) {
  while (x<0||x>=im.width) x=(x+im.width)%im.width;
  while (y<0||y>=im.height) y=(y+im.height)%im.height;
  int index = (x+y*im.width);
  return im.pixels[index];
}

void setPC(PImage im, int x, int y, color c) {
  while (x<0||x>=im.width) x=(x+im.width)%im.width;
  while (y<0||y>=im.height) y=(y+im.height)%im.height;
  int index = (x+y*im.width);
  im.pixels[index]=c;
}

float compareFrames(PImage a, PImage b) {
  a.loadPixels();
  b.loadPixels();
  double difference = 0;
<<<<<<< HEAD
  for (int x=0; x<min (a.width, b.width); x++) {
    for (int y=0; y<min (a.height, b.height); y++) {
=======
  for (int x=0;x<min(a.width,b.width);x++) {
    for (int y=0;y<min(a.height,b.height);y++) {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
      color aC = a.pixels[x+y*a.width];
      color bC = b.pixels[x+y*b.width];
      difference += abs(vrMax(hue(aC), hue(bC), 0x100))/0x100;
      difference += abs(saturation(aC)-saturation(bC))/0x100;
      difference += abs(brightness(aC)-brightness(bC))/0x100;
    }
  }
  difference/=min(a.width, b.width)*min(a.height, b.height);
  return constrain((1.0f/constrain((float)difference, 0.00001f, 10000.0f)), 0.1f, 10.0f);
}
<<<<<<< HEAD

=======
 
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
