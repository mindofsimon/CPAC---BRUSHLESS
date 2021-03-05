/*
 __          __  _                            _                
 \ \        / / | |                          | |               
  \ \  /\  / /__| | ___ ___  _ __ ___   ___  | |_ ___          
   \ \/  \/ / _ \ |/ __/ _ \| '_ ` _ \ / _ \ | __/ _ \         
    \  /\  /  __/ | (_| (_) | | | | | |  __/ | || (_) |        
  ___\/ _\/_\___|_|\___\___/|_| |_| |_|\___|__\__\___/__ _____ 
 |  _ \|  __ \| |  | |/ ____| |  | | |    |  ____|/ ____/ ____|
 | |_) | |__) | |  | | (___ | |__| | |    | |__  | (___| (___  
 |  _ <|  _  /| |  | |\___ \|  __  | |    |  __|  \___ \\___ \ 
 | |_) | | \ \| |__| |____) | |  | | |____| |____ ____) |___) |
 |____/|_|  \_\\____/|_____/|_|  |_|______|______|_____/_____/
 Powered by Daniele Leonzio, Simone Mariani and Martino Schgör
 
*/
import oscP5.*;
import netP5.*;
ArrayList<Particle> particles = new ArrayList<Particle>();
int N_particles;
PImage target;
int PORT_SC = 57120;//SuperCollider default port
OscP5 oscP5 = new OscP5(this,PORT_SC);
NetAddress ip_port_SC = new NetAddress("127.0.0.1",PORT_SC);//ip address of SC (localhost);

//CHOOSE TARGET IMAGE AND EFFECT
String FILENAME = "maggiolino.jpg";
int EFFECT = 4;
/* POSSIBLE EFFECTS:
 * 0: DISCOVER
 * 1: SCRATCH
 * 2: COLORFUL
 * 3: POUR
 * 4: TRACE
 */

void setup(){
  target = loadImage(FILENAME);
  size(640,480);
  background(0);
  
  //POPULATE THE PARTICLE SET (ACCORDING TO CHOSEN EFFECT)
  switch(EFFECT){
    case 0:
      N_particles = 300;
      for(int i=0;i<N_particles;i++){
        particles.add(new Particle(random(width),random(height),1,0.2,0.2,5));
      }
      break;
    case 1:
      N_particles = 200;
      for(int i=0;i<N_particles;i++){
        particles.add(new Particle(random(width),random(height),1,0.2,0.2,10));
      }
      break;
    case 2:
      N_particles = 40;
      for(int i=0;i<N_particles;i++){
        particles.add(new Particle(random(width),random(height),random(40,200),1,20,0.5));
      }
      break;
    case 3:
      N_particles = 200;
      for(int i=0;i<N_particles;i++){
        particles.add(new Particle(random(width),random(height),1,0,0,0));
      }
      break;
    case 4:
      N_particles = 80;
      for(int i=0;i<N_particles;i++){
        particles.add(new Particle(random(width),random(height),1,0.2,0.2,12));
      }
      break;
  }
}

void draw(){
  
  //Get Kinect Data
  
  //COMMENT THIS LINES TO CONNECT SENSOR
  float CtrlX = mouseX;
  float CtrlY = mouseY;
  
  for (Particle p : particles){
    //APPLY FORCE: EFFECT 3 HAS GRAVITY
    switch(EFFECT){
      case 0:
        p.applyForce((CtrlX-p.x)*p.k - p.v_x*p.c,(CtrlY-p.y)*p.k - p.v_y*p.c);
        break;
      case 1:
        p.applyForce((CtrlX-p.x)*p.k - p.v_x*p.c,(CtrlY-p.y)*p.k - p.v_y*p.c);
        break;
      case 2:
        p.applyForce((CtrlX-p.x)*p.k - p.v_x*p.c,(CtrlY-p.y)*p.k - p.v_y*p.c);
        break;
      case 3:
        p.applyForce(0,0.2);
        break;
      case 4:
        p.applyForce((CtrlX-p.x)*p.k - p.v_x*p.c,(CtrlY-p.y)*p.k - p.v_y*p.c);
        break;
    }
    //SIMULATE AND RENDER
    p.update();
    p.render();
  }
  sendMsg(CtrlX,CtrlY);
}

void keyPressed(){ //PRESS S TO SAVE THE IMAGE
  if (key == 's'){
    save("output.png");
  }
}
