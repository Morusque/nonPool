
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress remoteLocation;

void setupOSC() {
  oscP5 = new OscP5(this, 12000);
  remoteLocation = new NetAddress("127.0.0.1", 12001);
  oscP5.plug(this, "setGlobalPlayingSpeed", "/setGlobalPlayingSpeed");
<<<<<<< HEAD
  oscP5.plug(this, "switchDisplayedAnimationOsc", "/switchDisplayedAnimationOsc");
  oscP5.plug(this, "ping", "/ping");
}

void ping() {
  OscMessage message = new OscMessage("/pong");
=======
  oscP5.plug(this, "switchDisplayedAnimation", "/switchDisplayedAnimation");
}

void sendOsc() {
  OscMessage message = new OscMessage("/tac");
>>>>>>> abf7967c20ea6f3cb3b1465d32dfd8dff1bae4f0
  message.add(123);
  message.add(124);
  oscP5.send(message, remoteLocation);
}

void setGlobalPlayingSpeed(float _s) {
  globalPlayingSpeed=_s;
}
