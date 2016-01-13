void loadImageList(){
  // scanning imageSet folder with specific paterns

  java.io.File folder = new java.io.File(dataPath(imageSet));
  java.io.FilenameFilter imgExtFilter = new java.io.FilenameFilter() {
    public boolean accept(File dir, String name) {
      return name.toLowerCase().endsWith(".jpg") | name.toLowerCase().endsWith(".jpeg") | name.toLowerCase().endsWith(".png") ;
    }
  };

  String[] filenames = folder.list(imgExtFilter);
  imageCount = filenames.length;
 
   images = new PImage[imageCount];
    
  println(imageCount + " layers in " + imageSet );  

  for ( int i = 0; i< imageCount; i++ ) {
    images[(imageCount-1)-i] = loadImage(imageSet+"/"+filenames[i]);
    if(imageCount > 20) {
      if(i%(imageCount/20) == 0) print("|");
    }else{ 
      print(filenames[i]+", ");
    }
  }

  println(" 100% !");
}