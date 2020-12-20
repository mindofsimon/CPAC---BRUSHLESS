class Particle{
  float x,v_x,a_x;
  float y,v_y,a_y;
  float size;
  float mass;
  color trace_color;
  float offset_x;
  float offset_y;
  Particle(){//initial position and color are random, particles start still.
    this.x = random(width);
    this.v_x = 0;
    this.a_x = 0;
    this.y = random(height);
    this.v_y = 0;
    this.a_y = 0;
    this.size = 5;
    this.trace_color = color(random(255),random(255),random(255));
    this.mass = random(0.2,0.5);
    this.offset_x = random(-10,10);
    this.offset_y = random(-10,10);
  }
  void render(){
    color pixel = target.get(floor(this.x + this.offset_x),floor(this.y + this.offset_y));
    this.size = (255 - brightness(pixel))/40 + 1;
    drawing.beginDraw();
    drawing.fill(this.trace_color);
    drawing.noStroke();
    drawing.ellipse(this.x + this.offset_x, this.y + this.offset_y, this.size, this.size);
    drawing.endDraw();
  }
  void update(){//phisic simulation
    this.x += this.v_x;
    this.v_x += this.a_x - damp*v_x;
    this.y += this.v_y;
    this.v_y += this.a_y - damp*v_y;
  }
  void applyForce(float F_x, float F_y){
    this.a_x = F_x/this.mass;
    this.a_y = F_y/this.mass;
  }
}
