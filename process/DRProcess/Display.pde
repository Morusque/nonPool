
<<<<<<< HEAD
float transition=0;
float flashTransition=1;
PImage transitionPic;

int switchAnimCounter=0;
int autoSwitchAnim=500;// use pd instead (=0), but otherwise 70 is a fine value

void switchDisplayedAnimationOsc(float f) {
  flashTransition=f;
  switchDisplayedAnimation();
}

void switchDisplayedAnimation() {
  boolean found=false;
  for (int i=0; i<animations.size ()&&!found; i++) {
    currentDisplay=(currentDisplay+1)%animations.size();
    if (animations.get(currentDisplay).isDisplayable()) found=true;
  }
  if (found) {
    transitionPic=get();
    transition=flashTransition;
  }
=======
int switchAnimCounter=0;
int autoSwitchAnim=70;// TODO use pd instead, balance anyway
void switchDisplayedAnimation() {
  boolean found=false;
  for (int i=0;i<animations.size()&&!found;i++) {
    currentDisplay=(currentDisplay+1)%animations.size();
    if (animations.get(currentDisplay).isDisplayable()) found=true;
  }
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
}

void display() {
  if (animations.get (currentDisplay).isDisplayable()) {
    // println("drawing animation "+currentDisplay);
    animations.get(currentDisplay).draw();
<<<<<<< HEAD
    if (autoSwitchAnim>0) {
      if (switchAnimCounter%autoSwitchAnim==0) switchDisplayedAnimation(); 
      switchAnimCounter++;
    }
  } else {
=======
    if (autoSwitchAnim!=-1) {
      if (switchAnimCounter%autoSwitchAnim==0) switchDisplayedAnimation(); 
      switchAnimCounter++;
    }
  }
  else {
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
    // println("animation "+currentDisplay+" not generated");
    switchDisplayedAnimation();
    background(0);
  }
<<<<<<< HEAD
  if (transition>0) {
    transition=transition*0.8f-0.05f;
    tint(0xFF, transition*0xFF);
    image(transitionPic, 0, 0);
    tint(0xFF);
  }
=======
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
}

