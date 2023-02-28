import controlP5.*;

ControlP5 cp5;

PImage bg;
int img_number;
int bg_imagecounter= 0;
boolean anim = false;
int model_no=1;

float t ;
int v ;

int a;
int b;
int c;
int d;



static final int NUM_TRAILS = 15;

PImage human1;
PImage human2;
PImage human3;
PImage human4;
PImage human5;

boolean h1= false;
boolean h2= false;
boolean h3= false;
boolean h4= false;
boolean h5 =false;


int UI_positionX = 50;
int UI_positionY =50;
int UI_distance = 60;


color UI_labels = color(255, 255, 255);

float model_scale;
int st_color_r = 255;
int st_color_g  = 255;
int st_color_b = 255;

int st_w = 1;

int pos_x = 512;
int pos_y = 512;
int rotate_z=0;

int human_scale_x;
int human_scale_y;
int human_y;
int human_x;

void setup() {
  size(1024, 1024,P3D);
  //add_human();

  setup_UI();
  cp5.hide();
}

void draw() {
  pushMatrix();
  
  background_changer ();
  anim();
  int image_n = bg_imagecounter+1;
  bg = loadImage("b"+image_n+".jpg");
  
  
  
 
  stroke(st_color_r,st_color_g,st_color_b);
  strokeWeight(st_w);
  translate(pos_x, pos_y);
  rotateZ(radians(rotate_z));
  scale(model_scale);
   
  model_control();
  
  
  stroke(0);
  strokeWeight(0);
  translate(0,0);
  rotateZ(0);
  scale(1);
  
  
    
  

popMatrix();
add_human();

}




void background_changer ()

{

  if (bg_imagecounter >12 ) {
    bg_imagecounter = 0;
  }

  if (bg_imagecounter == 0)
  {
    background(0, 0, 0);
  } else {
    background(bg);
  }
}

void model_control()

{

if (model_no == 1)
{

  
  
  for(int i = 0; i < v; i++) {
    
    line(x1(t - i), y1(t - i), x2(t - i), y2(t - i));
    line(x1(t - i), y1(t - i), xa(t - i), ya(t - i));
     
   }



}else if (model_no==2){




   for (int i = 0; i < v; i++) {
  
  
  line(xa(t - i), ya(t - i), xb(t - i), yb(t - i));
    
  
 }
 
  
}

else if (model_no==3){



for (int i = 0; i < v; i++) {
  
  line(xb(t + i), yb(t + i), xa(t + i), ya(t + i));
  line(x1(t - i), y1(t - i), xa(t - i), ya(t - i));
  
  
 
  


}}


else if (model_no==4){



for (int i = 0; i < v; i++) {
  
  
  
  line(xa(t-i), ya(t-i), xb(t-i), yb(t-i));
  line(xa(t-i), ya(t-i), a*x2(t+i), a*y2(t+i));
 
  
 
  


}}

}


float x1(float t) {
  return sin(t / 10) * 100 + sin(t / 5) * 20;
}

float y1(float t) {
  return cos(t / 10) * 100;
}


float x2(float t) {
  return cos(t / 10) * 200 + sin(t) * 2;
}

float y2(float t) {
  return sin(t / 90) * 200 + cos(t / 12) * 20;
}




//second set

float xa(float t) {
  return ( (a*sin(t/b) *d) + (sin(t/b) * d) ) ;
}

float ya(float t) {
  return sin(t/b) * b;
}



float xb(float t) {
  return ( (a*cos(t/b) * d) + (a*sin(t) * d) ) ;
}

float yb(float t) {
  return sin(t /b) * d + cos(t / c) * d;
}





void add_human()
{
  if (h1== true)
    {human1 = loadImage("h1.png");
     
     image(human1,human_x,human_y,human_scale_x,human_scale_y);}
 
  if (h2== true)
    {human2 = loadImage("h2.png");
    image(human2,human_x,human_y,human_scale_x,human_scale_y);}
     
   if (h3== true)
    {human3 = loadImage("h3.png");
     image(human3,human_x,human_y,human_scale_x,human_scale_y);}
     
     
    if (h4== true)
    {human4 = loadImage("h4.png");
     image(human4,human_x,human_y,human_scale_x,human_scale_y);}
     
     
     if (h5== true)
    {human5 = loadImage("h5.png");
    image(human5,human_x,human_y,human_scale_x,human_scale_y);}
}

void anim()

{ if (anim == false  )

{
  //t=cp5.addSlider("t").getValue();
}
else { if(v>500) {
t+= 0.2*frameRate;
v= 1;}

else {
t+= 0.2*frameRate;
v+= 0.1*frameRate;}
}

}



void setup_UI()
{
  cp5 = new ControlP5(this);

  cp5.addButton("next bg")
    .setPosition(20, 320)
    .setSize(80, 40);

  // Set up .pdf capture button
  cp5.addButton("save image")
    .setPosition(120,320)
    .setSize(80, 40);
    
   cp5.addSlider("a")
       .setPosition(20, 380)
       .setSize(20, 80)
       .setRange(-1, 1)
       .setValue(10)
       .setColorCaptionLabel(90);
       
   cp5.addSlider("b")
       .setPosition(50, 380)
       .setSize(20, 80)
       .setRange(0, 100)
       .setValue(10)
       .setColorCaptionLabel(90);
       
       
   cp5.addSlider("c")
       .setPosition(70, 380)
       .setSize(20, 80)
       .setRange(0, 100)
       .setValue(10)
       .setColorCaptionLabel(90);
       
    cp5.addSlider("d")
       .setPosition(90, 380)
       .setSize(20, 80)
       .setRange(0, 500)
       .setValue(10)
       .setColorCaptionLabel(90);
       
       
    cp5.addSlider("t")
       .setPosition(20, 20)
       .setSize(200, 20)
       .setRange(0, 100)
       .setValue(10)
       .setColorCaptionLabel(90);
   
  cp5.addSlider("v")
       .setPosition(20, 50)
       .setSize(200, 20)
       .setRange(0, 500)
       .setValue(80)
       .setColorCaptionLabel(90);
  
   cp5.addSlider("st_color_r")
       .setPosition(20, 80)
       .setSize(200, 20)
       .setRange(0, 255)
       .setValue(255)
       .setColorCaptionLabel(90);
  
   cp5.addSlider("st_color_g")
       .setPosition(20, 110)
       .setSize(200, 20)
       .setRange(0, 255)
       .setValue(255)
       .setColorCaptionLabel(90);
       
   cp5.addSlider("st_color_b")
       .setPosition(20, 140)
       .setSize(200, 20)
       .setRange(0, 255)
       .setValue(255)
       .setColorCaptionLabel(90);
       
   cp5.addSlider("st_w")
       .setPosition(20, 170)
       .setSize(200, 20)
       .setRange(0, 10)
       .setValue(1)
       .setColorCaptionLabel(90);
     
     
     cp5.addSlider("pos_x")
       .setPosition(20, 200)
       .setSize(200, 20)
       .setRange(0, 1024)
       .setValue(512)
       .setColorCaptionLabel(90);
      
      cp5.addSlider("pos_y")
       .setPosition(20, 230)
       .setSize(200, 20)
       .setRange(0, 1024)
       .setValue(512)
       .setColorCaptionLabel(90);
     
     cp5.addSlider("rotate_z")
       .setPosition(20, 260)
       .setSize(200, 20)
       .setRange(-180, 180)
       .setValue(0)
       .setColorCaptionLabel(90);
      
      cp5.addSlider("model_scale")
       .setPosition(20, 290)
       .setSize(200, 20)
       .setRange(0, 2)
       .setValue(1)
       .setColorCaptionLabel(90);
       
       
     cp5.addButton("model 1")
    .setPosition(260, 20)
    .setSize(40, 40);
    
     cp5.addButton("model 2")
    .setPosition(260+UI_distance, 20)
    .setSize(40, 40);
    
    cp5.addButton("model 3")
    .setPosition(260+UI_distance*2, 20)
    .setSize(40, 40);
    
    cp5.addButton("model 4")
    .setPosition(260+UI_distance*3, 20)
    .setSize(40, 40);
    
     cp5.addButton("Animate")
    .setPosition(260+UI_distance*4, 20)
    .setSize(80, 40);
    
    cp5.addButton("Stop Animate")
    .setPosition(260+UI_distance*6, 20)
    .setSize(80, 40);
    
    cp5.addButton("Start Saving Animaton")
    .setPosition(260+UI_distance*8, 20)
    .setSize(80, 40);
    
    cp5.addButton("End Saving Animaton")
    .setPosition(260+UI_distance*10, 20)
    .setSize(80, 40);
    
    
     cp5.addButton("Human 1")

     .setCaptionLabel("Human 1")
     .setPosition(260,80)
     .setSize(40,40) ;
     
     
     cp5.addButton("Human 2")

     .setCaptionLabel("Human 2")
     .setPosition(260+UI_distance,80)
     .setSize(40,40) ;
     
     cp5.addButton("Human 3")

     .setCaptionLabel("Human 3")
     .setPosition(260+UI_distance*2,80)
     .setSize(40,40) ;
     
     
      cp5.addButton("Human 4")

     .setCaptionLabel("Human 4")
     .setPosition(260+UI_distance*3,80)
     .setSize(40,40) ;
     
     cp5.addButton("Human 5")

     .setCaptionLabel("Human 5")
     .setPosition(260+UI_distance*4,80)
     .setSize(40,40) ;
     
     
     cp5.addSlider("human_scale_x")
       .setPosition(260+UI_distance*5, 80)
       .setSize(40,20)
       .setRange(1, 500)
       .setValue(100)
       .setColorCaptionLabel(90);
       
        cp5.addSlider("human_scale_y")
       .setPosition(260+UI_distance*5,120)
       .setSize(40, 20)
       .setRange(1, 500)
       .setValue(200)
       .setColorCaptionLabel(90);
       
       
       cp5.addSlider("human_x")
       .setPosition(260+UI_distance*7, 80)
       .setSize(40,20)
       .setRange(0, 1024)
       .setValue(500)
       .setColorCaptionLabel(90);
       
        cp5.addSlider("human_y")
       .setPosition(260+UI_distance*7,120)
       .setSize(40, 20)
       .setRange(0, 1024)
       .setValue(500)
       .setColorCaptionLabel(90);
}






public void controlEvent(ControlEvent theEvent) {
 
  String eventIs = theEvent.getController().getName();
  if (eventIs == "next bg") {
    bg_imagecounter += 1;
    println(bg_imagecounter);
    
  } else if (eventIs == "save image") {
    saveFrame();
    
    
  } else if (eventIs == "model 1") {
    
    model_no = 1;
  }else if (eventIs == "model 2") {
    
    model_no = 2;
  }else if (eventIs == "model 3") {
    
    model_no = 3;
}  else if (eventIs == "model 4") {
    
    model_no = 4;
} else if (eventIs == "Animate") {
    
    anim = true;
}

else if (eventIs == "Stop Animate") {
    
    anim = false;
}

else if (eventIs == "Start Saving Animaton") {
    
    beginRecord(PDF, "pdf_####.pdf");
}

else if (eventIs == "End Saving Animaton") {
    
   endRecord();
}else if (eventIs == "Human 1") {
  
  if (h1 == false ){
   
    h1 = true;
    println("h1 true");
   
  }
    else {h1=false;
    println("h1 false");
   
  
}

}else if (eventIs == "Human 2") {
  
  if (h2 == false ){
   
    h2 = true;
    
  }
    else {h2=false;
  
}
   }else if (eventIs == "Human 3") {
    if (h3 == false ){
   
    h3 = true;
   
  }
    else {h3=false;
  
}
}  else if (eventIs == "Human 4") {
    
    if (h4 == false ){
   
    h4 = true;
   
  }
    else {h4=false;
  
}
} else if (eventIs == "Human 5") {
    
    if (h5 == false ){
   
    h5 = true;
    
  }
    else {h5=false;
  
}
}
}


void keyPressed(){
  if(key == 's'){
    cp5.show();
    println("showing controls");
  } else if (key == 'h'){
    cp5.hide();
    println("hiding controls");
  } else if (key == 'P') {
    saveFrame();
  } 
}
