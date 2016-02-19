/**
Processing Summative
Convex Mirror
Afnan Yousuf
June 2012
**/
/*
Formula Used:
1/f=hi/ho=-di/do
f=focal length
hi= image height
ho=object height
di=image distance from optical centre
do(note:dd was used in this sketch)=object distance from optical centre
**/
//variables
boolean moveable=false;//boolean for moving the object
int xPos=30;//xpos for object
int yPos=80;//ypos for object
int fxPos=500;//xpos for focal point
 
void setup(){
  size(800,300);//set up size
  background(206);//background
  smooth();
  ellipseMode(CENTER);
}
 
void draw(){
  lens();//call function
  calculate();//call function
  text("Copyright Afnan Yousuf 2012",630,280);
//allows for object to be changed
 if(mousePressed){
   moveable=true;
   if(moveable){
    xPos=mouseX;//if user moves mouse right, the x position changes
    yPos=mouseY;//if user moves mouse up, the y position changes
    cursor(HAND);//makes the cursor the hand
   }
 }
 else{
   moveable=false;
 }
 
 
   
 
 
 
 
}
//when mouse is released, the cursor goes back to arrow
void mouseReleased(){
   moveable=false;
     if(!moveable){
       cursor(ARROW);
       
       
     }
     
}
 
void lens(){
   background(206);
   //draw a light source
   noStroke();
   fill(230, 240, 0, 105);
   ellipse(5,8,20,20);
   fill(240, 240, 0, 55);
   ellipse(5,8,40,40);
   fill(240, 240, 0, 25);
   ellipse(5,8,60,60);
   //draw object (arrow)
   strokeWeight(4);
   stroke(0);
   //draw the object
line(xPos,130,xPos,yPos);
 line(xPos,yPos,xPos-18,yPos+10);
 line(xPos,yPos,xPos+18,yPos+10);
 //makes sure object doesnt pass center
 if(xPos>320){
  xPos=320;
}
if(xPos<30){
  xPos=30;
}
//makes sure object height doesnt exceed window height
if(yPos>81){
  yPos=80;
}
if(yPos<30){
  yPos=30;
}
 
  noFill();
  //draw convex mirror
  arc(450, 130, 230, 200, 2,PI+1.2);
  //draw principle axis
  line(0,130,width,130);
  fill(0);
  //focal point
  ellipse(fxPos,130,10,10);
  text("F",500,150);
 
 
  //find & draw curvature
  float c=500+dist(fxPos,130,335,130);
  ellipse(c,130,10,10);
  text("C",c,150);
 
 
 
}//end function
 
 
 
//gets virtual image
void calculate(){
  //get focal length
  float focal=-dist(335,130,500,130);/*convex mirrors have a negative focal length*/
  text("Focal Length:"+(int)focal,550,90);
  //get distance of object from optic center
  float dd= 335-xPos;
  //make sure text doesn't over lap
  float t=xPos-30;
  if(t>200){
    t=200;
  }
  text("Object Distance:"+(int)dd,t,150);
  //get height of object
  float ho= dist(xPos,130,xPos,yPos);
  //write text and makes sure text doesn't over lap
  int l=xPos+15;
  if(l>200){
    l=200;
  }
  text("Object Height:"+(int)ho,l,105);
  //find distance of image
  //note: 1/f=1/do/1di
  float di=1/((1/dd)-(1/focal));
  //find height of image
  //note: hi/ho=-di/do
  float hi=-(ho)*(-di)/(dd);
  //get magnification
  //note: m=hi/ho=di/do
  float magni=hi/ho;
  //draw out image
  strokeWeight(4);
  stroke(105,0,0,105);
  fill(105,0,0,105);
  ellipse(335+di,130,10,10);
  float note=130-hi;
  //if the virtual image is too big for the mirror, display the text
  if(note<70&&335+di<370){
    fill(255,0,0);
    text("Note:Mirror is too small",280,240);
  }
  stroke(105,0,0,105);
  fill(105,0,0,105);
  line(335+di,130,335+di,note);
  textSize(10);
  //write text and makes sure text doesnt overlap
  float k=300+di;
  if(k<340){
    k=340;
  }
  text("Virtual Image Height:"+(int)hi,k+40,120);
  text("Virtual Image Distance:"+(int)di,k,150);
  fill(0);
  text("Magnification:"+magni,550,170);
 
 
 
 
 
}//end func