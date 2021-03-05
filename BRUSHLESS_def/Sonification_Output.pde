void sendMsg(float x, float y){
  OscMessage msg = new OscMessage("/sonification");
  float rel_x=map(x,0,width,-width,width);
  float rel_y=map(y,0,height,-height,height);
  if(rel_x<0){
    rel_x=-rel_x;
  }
  if(rel_y<0){
    rel_y=-rel_y;
  }
  rel_x=(rel_x/width)/2;
  rel_y=(rel_y/height)/2;
  msg.add(map(rel_x,-0.5,0.5,-1,1));
  msg.add(map(rel_y,-0.5,0.5,-1,1));
  oscP5.send(msg, ip_port_SC);
}
