void setup() {
  size(400, 400);
 
  String path = sketchPath("Images/");
  String path2 = dataPath("sounds/");
 
  File file = new File(path);
  File file2 = new File(path2);
  int sizeOfFolder = 0;
  int sizeOfFolder2 = 0;
  
  if(file.exists()) println("exsists");
  else println("no file");
 
  if(file.exists() && file.isDirectory()) {
    sizeOfFolder = file.listFiles().length;
  }
  else{
    println("folder is empty");
  }
  
  
  if(file2.exists() && file2.isDirectory()) {
    sizeOfFolder2 = file2.listFiles().length;
      println(file2.listFiles()[0].getName());
      println(file2.listFiles()[0].getPath());
      println(sizeOfFolder2);

  }
  else{
    println("folder is empty");
  }
 
  println(sizeOfFolder);
}
