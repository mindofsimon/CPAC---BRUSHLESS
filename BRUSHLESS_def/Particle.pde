class Particle{
  float x,v_x;
  float y,v_y;
  float offsetX,offsetY;
  color paint;
  color trace_color;
  float off_color[] = {0,0,0};
  float mass;
  float k;
  float c;
  Particle(float x, float y, float mass, float k, float c, float dispersion){
    this.x = x;
    this.v_x = 0;
    this.y = y;
    this.v_y = 0;
    this.paint = target.get(floor(x),floor(y));
    this.trace_color = color(random(255),random(255),random(255));
    for (int a=0;a<3;a++){off_color[a] = random(-50,50);}
    this.offsetX = dispersion*randomGaussian();
    this.offsetY = dispersion*randomGaussian();
    this.mass = mass;
    this.k = k;
    this.c = c;
  }
  void render(){
    color pixel = target.get(floor(this.x),floor(this.y));
    switch(EFFECT){
      case 0:
        fill(pixel,250);
        noStroke();
        ellipse(this.x, this.y, 1, 1);
        break;
      case 1:
        this.paint = filterColor(this.paint,pixel);
        fill(this.paint,10);
        noStroke();
        ellipse(this.x, this.y, 2, 2);
        break;
      case 2:
        float size = (255 - brightness(pixel))/40 + 1;
        fill(this.trace_color);
        noStroke();
        ellipse(this.x, this.y, size, size);
        break;
      case 3:
        this.paint = filterColor(this.paint,pixel);
        fill(this.paint,20);
        noStroke();
        ellipse(this.x, this.y, 2, 2);
        break;
      case 4:
        fill(sumColor(pixel,this.off_color),250);
        noStroke();
        ellipse(this.x, this.y, 2, 2);
        break;
    }
    
  }
  void update(float x, float y){//physic simulation
    this.x += this.v_x + this.offsetX;
    this.y += this.v_y + this.offsetY;
    this.x = constrain(this.x,0,width);
    this.y = constrain(this.y,0,height);
    if (EFFECT==3 && this.y>=height){
      this.x = x;
      this.y = y;
      this.v_x = random(-1,1);
      this.v_y = random(-1,1);
    }
  }
  void applyForce(float F_x, float F_y){
    this.v_x += F_x/this.mass;
    this.v_y += F_y/this.mass;
  }
}
