void init_camera(){
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }
}

void search_pointer(){
  int counter = 0;
  int x_sum = 0;
  int y_sum = 0;
  for (int i=0; i<cam.width*cam.height; i++) {
    color pix = cam.pixels[i];
    if (distance(pix,targetColor) < 2500){
      x_sum += i % cam.width;
      y_sum += floor(i/cam.width);
      counter++;
      this_dist = prev_dist;
    }
  }
  if (counter!=0){
    x = round(x_sum/counter);
    y = round(y_sum/counter);
    if (distance(cam.get(x,y),targetColor) < 100){
      targetColor = cam.get(x,y);
    }
  }
  ///rescaling and filtering
  x = cam.width - x;
  x = round(x*width/cam.width);
  y = round(y*height/cam.height);
  tapfilterX = 0.9*tapfilterX + 0.1*x;
  tapfilterY = 0.9*tapfilterY + 0.1*y;
  x = round(tapfilterX);
  y = round(tapfilterY);
  ////
}

float distance(color a,color b){
  return sq(red(a)-red(b)) + sq(green(a)-green(b) + sq(blue(a)-blue(b)));
}
