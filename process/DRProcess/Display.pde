
int switchAnimCounter=0;
int autoSwitchAnim=70;// TODO use pd instead, balance anyway
void switchDisplayedAnimation() {
  boolean found=false;
  for (int i=0;i<animations.size()&&!found;i++) {
    currentDisplay=(currentDisplay+1)%animations.size();
    if (animations.get(currentDisplay).isDisplayable()) found=true;
  }
}

void display() {
  if (animations.get (currentDisplay).isDisplayable()) {
    // println("drawing animation "+currentDisplay);
    animations.get(currentDisplay).draw();
    if (autoSwitchAnim!=-1) {
      if (switchAnimCounter%autoSwitchAnim==0) switchDisplayedAnimation(); 
      switchAnimCounter++;
    }
  }
  else {
    // println("animation "+currentDisplay+" not generated");
    switchDisplayedAnimation();
    background(0);
  }
}

