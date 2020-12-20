import processing.core.PGraphics;
import processing.awt.PGraphicsJava2D;
import processing.video.*;

boolean DEBUG_MODE = false;//set to bypass controller
PGraphics drawing = new PGraphicsJava2D();
PImage target;
int N_particles = 40;
float damp = 0.08; //viscous damping coefficient
ArrayList<Particle> particles = new ArrayList<Particle>();


color thisColor;
color targetColor = color(0,255,0);
float this_dist = 0;
float prev_dist = sq(255);
boolean display = true;
float tapfilterX = 0;
float tapfilterY = 0;

int x = width/2;
int y = height/2;

Capture cam;

void setup() {
  target = loadImage("Gocce.png");
  size(512,512);
  drawing.setSize(width,height);
  background(255,255,255);
  for(int i=0;i<N_particles;i++){//populating the particle set
    Particle this_particle = new Particle();
    particles.add(this_particle);
  }
  frameRate(30);
  init_camera();
}

void draw() {
  if (cam.available() == true) {
    cam.read();
    search_pointer();//updates x,y,targetColor
  }
  if (DEBUG_MODE){
    x = mouseX;
    y = mouseY;
  }
  for (Particle myPart: particles){//apply force to particles and simulate
    myPart.applyForce((x-myPart.x)/400,(y-myPart.y)/400);
    if (!display){
      myPart.update();
      myPart.render();
    }
  }
  //final render
  if (display){
    image(cam,0,0);
  }
  else {
    background(255);
    image(drawing,0,0);
    drawBall(x,y);
  }
}

void mouseClicked(){
  targetColor = cam.get(mouseX,mouseY);  
  display = false;
  background(255,255,255);
}

void drawBall(int x, int y){
    fill(targetColor);
    stroke(0,0,0);
    ellipse(x,y,10,10);
}
