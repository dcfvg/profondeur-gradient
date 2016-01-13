import org.openkinect.freenect.*;
import org.openkinect.processing.*;


// Setup

int maxDepth = 800;
int minDepth = 700;
String imageSet = "gradients";
int keyInc = 100;

//

Kinect kinect;
float deg;
boolean ir = true;
boolean colorDepth = false;
boolean mirror = false;
boolean showVideo = false;
boolean showGradient = true;

int maxDistVal;
int minDistVal;

PImage images[];
PImage gradient;
PImage depthImg;

int imageCount = 0;
int gradientId = 0;

void setup() {
  fullScreen();

//  size(640, 480);
  kinect = new Kinect(this);
  kinect.initDepth();
  kinect.initVideo();
  kinect.enableIR(ir);
  
  depthImg = new PImage(kinect.width, kinect.height);
  deg = kinect.getTilt();

  loadImageList();
   
  gradient = images[gradientId];
  
  println(kinect.width + " x " +kinect.height + "screen:" + width + " x " +height);
  
   int[] rawDepth = kinect.getRawDepth();
   maxDistVal = max(rawDepth);
   minDistVal = min(rawDepth);
   
   println("max depth : "+maxDistVal);
   println("min depth : "+minDistVal);
   println("depth/img : "+(maxDistVal-minDistVal)/imageCount);
}


void draw() {
  background(0);
  // Threshold the depth image
  int[] rawDepth = kinect.getRawDepth();
  for (int i=0; i < rawDepth.length; i++) {
    if(rawDepth[i] > maxDepth){
       depthImg.pixels[i] = color(0);
    }else {
       depthImg.pixels[i] = gradient.pixels[ constrain( (int)map(rawDepth[i], minDepth, maxDepth, 0, 500), 0, 500) ];
    }
  }
  
  depthImg.updatePixels();
  image(depthImg, 0, 0, width, height);

  if(showVideo) image(kinect.getVideoImage(), 0, 0, width, height);
  if(showGradient) image(gradient, 0, height - 20, width, height);
  
  if(showGradient){
    
    //rect(0,0, kinect.width, 20);
    
    //println(map(minDepth,0,2050,0,kinect.width));
     maxDistVal = max(rawDepth);
     minDistVal = min(rawDepth);
     
    float min = map(minDepth,maxDistVal,minDistVal,20,height-40);
    
    rect(10, min, 20, map(maxDepth,maxDistVal,minDistVal,20,height-40) - min);
  
  }

  //fill(255);
}