color filterColor(color prevState, color newInput){
  float beta = 0.4;
  float R = beta*red(newInput) + (1-beta)*red(prevState);
  float G = beta*green(newInput) + (1-beta)*green(prevState);
  float B = beta*blue(newInput) + (1-beta)*blue(prevState);
  return color(R,G,B);
}

color sumColor(color I1, float[] I2){
  float R = red(I1) + I2[0];
  float G = green(I1) + I2[1];
  float B = blue(I1) + I2[2];
  return color(R,G,B);
}
