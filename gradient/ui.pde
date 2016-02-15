
void keyPressed() {

  if (key == 'w') keyInc = 100;
  if (key == 'x') keyInc = 10;
  if (key == 'c') keyInc = 1;

  else if (key == 'k') { minDepth = minDepth+keyInc; }
  else if (key == 'j') { minDepth = minDepth-keyInc; }
  else if (key == 'i') { maxDepth = maxDepth+keyInc; }
  else if (key == 'u') { maxDepth = maxDepth-keyInc; }
  else if (key == 'g') {  // video showVideo
    showGradient = !showGradient;
  }
  else if (key == 'v') {  // video showVideo
    showVideo = !showVideo;
  }
  else if (key == 'i') {  // infrared enable
    ir = !ir;
    //kinect.enableIR(ir);
  }else if(key == 'm'){
    mirror = !mirror;
    // kinect.enableMirror(mirror);
  } else if (key == CODED) { // inclinaison
    if (keyCode == UP) {
      deg++;
    } else if (keyCode == DOWN) {
      deg--;
    } else if(keyCode == RIGHT){
      gradientId++;
    } else if(keyCode == LEFT){
      gradientId--;
    }
    deg = constrain(deg, 0, 30);
    // kinect.setTilt(deg);

    gradient = images[abs(gradientId) % imageCount];
  }

  println(" maxDepth:" + maxDepth + " minDepth:" + minDepth);
}
