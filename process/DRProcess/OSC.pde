
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress remoteLocation;

void setupOSC() {
  oscP5 = new OscP5(this, 12000);
  remoteLocation = new NetAddress("127.0.0.1", 12001);
  oscP5.plug(this, "setGlobalPlayingSpeed", "/setGlobalPlayingSpeed");
  oscP5.plug(this, "switchDisplayedAnimation", "/switchDisplayedAnimation");
}

void sendOsc() {
  OscMessage message = new OscMessage("/tac");
  message.add(123);
  message.add(124);
  oscP5.send(message, remoteLocation);
}

void setGlobalPlayingSpeed(float _s) {
  globalPlayingSpeed=_s;
}
