

String svgspath;
File svgfolder;
PShape[] svgset;
IntDict svgnames;
float[][] svgwh; //width & height of svgPShape noteshape;

PShape noteshape;
int svgnum;
String svgname = "";


void setup() {
  size(500, 500);
  spf = 1.0/frmrt;
  monaco12 = loadFont("Monaco-12.vlw");
  textFont(monaco12);

  svgnames = new IntDict();
  svgspath = sketchPath("svgs/");
  svgfolder = new File(svgspath);

  //Load SVGs from folder, store names in an IntDict
  if (svgfolder.exists() && svgfolder.isDirectory()) {
    svgset = new PShape[svgfolder.listFiles().length];
    svgwh = new float[svgfolder.listFiles().length][2];
    for (int i=0; i<svgfolder.listFiles ().length; i++) {
      if (!svgfolder.listFiles()[i].getName().equals(".DS_Store")) {
        svgset[i] = loadShape(svgfolder.listFiles()[i].getPath());
        svgnames.set(svgfolder.listFiles()[i].getName(), i);
        svgwh[i][0] = svgset[i].getWidth();
        svgwh[i][1] = svgset[i].getHeight();
      }
    }
  }
  svgnum = svgnames.get(svgname);
  noteshape = svgset[svgnum];
} //end setup

void draw() {
  background(25, 33, 47);

  shapeMode(CENTER);

  shape(noteshape, svgwh[svgnum][0], svgwh[svgnum][1]);
}