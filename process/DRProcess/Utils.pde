
public float vrMax(float a, float b, float m) {
  float d1=b-a;
  if (d1>m/2) {
    d1=d1-m;
  }
  if (d1<-m/2) {
    d1=d1+m;
  }
  return d1;
}

int aColor(float r, float g, float b) {
  return ((int)floor(r)&0xFF)<<16|((int)floor(g)&0xFF)<<8|((int)floor(b)&0xFF);
}

