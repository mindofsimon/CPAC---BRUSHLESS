void sendMsg(float x, float y,float z, float bright){
  float dust_amp=1.0;
  float dust_thr=0.99;
  OscMessage msg = new OscMessage("/sonification");
  float rel_x=map(x,0,width,-width,width);
  float rel_y=map(y,0,height,-height,height);
  rel_x=(rel_x/width)/2;
  rel_y=(rel_y/height)/2;
  rel_x=map(rel_x,-0.5,0.5,-1,1);
  rel_y=map(rel_y,-0.5,0.5,-1,1);
  msg.add(rel_x);//from -1 to 1 it will control PAN
  //msg.add(rel_y);
  if(bright>1){//from 0 to 1 it will control Reverb (mix parameter)
    bright=1;
  }
  msg.add(1-bright);
  if(rel_x>dust_thr || rel_x<-dust_thr || rel_y>dust_thr || rel_y<-dust_thr){
    dust_amp=1.0;
  }
  else{
    dust_amp=0.0;
  }
  msg.add(dust_amp);
  z = map(z, 0,100, 0,1);
  msg.add(z);
  oscP5.send(msg, ip_port_SC);
  //println(bright); //debug
  //bright è il rapporto tra la luminosità dell'immagine e la luminosità del target
  //ocio che può essere maggiore di 1! (ad es. in effetto 4, si può ottenere un'immagine più luminosa dell'originale)
}
