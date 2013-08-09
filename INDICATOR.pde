//import libraries-------------------------------
import processing.opengl.*;
//import processing.video.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import peasy.*;
import controlP5.*;

ControlP5 cp5;


int myColorBackground = color(0, 0, 0);
ControlWindow controlWindow;
public int sliderValue = 40;

PImage obstacleImg;

PImage spawnImg;//see http://processing.org/reference/PImage.html
//Getting the color of a single pixel with get(x, y) is easy, 
//but not as fast as grabbing the data directly from pixels[]. 
//The equivalent statement to get(x, y) using pixels[] is pixels[y*width+x].



PeasyCam cam;
PrintWriter output;

//define global variables------------------------
ArrayList importAgentPos;
ArrayList importAgentVel;
ArrayList agentPop;
ArrayList springPop;
ArrayList aColl = new ArrayList();
ArrayList fsqColl = new ArrayList();
ArrayList spawnList = new ArrayList();

int boxWidth = 1281;
int boxHeight = 1656;
int boxDepth = 300;
boolean pause = false;
boolean showSprings = true;
boolean showBackgroundImage = false;
int agentNum = 0;

float globalVision = 1.0;
float globalMaxForce = 3.5;
float globalMaxVel = 1;
boolean imageToggle = true;
boolean initialAgents = false;
boolean G1 = false;
boolean G2 = false;
boolean G3 = false;
boolean makeAttr = true;
boolean makeAttr2 = true;

int g1Cnt;
int g2Cnt;
int g3Cnt;

boolean seedAgents = false;
int initialPopulation = 2200;

Slider slInPop;
Slider slGlVis;
Slider slGlMaxForse;
Slider slGlMaxVel;
Slider slSepS1;
Slider slSepS2;
Slider slSepS3;
Slider slSepS4;
Slider slSepS5;

Group g1;
Slider slWanScale1;
Slider slSprScale1;
Slider cslCohScale1;
Slider slAliScale1;
Slider slCohRange1;
Slider slSepRange1;
Slider slAliRange1;

Group g2;
Slider slWanScale2;
Slider slSprScale2;
Slider cslCohScale2;
Slider slAliScale2;
Slider slCohRange2;
Slider slSepRange2;
Slider slAliRange2;

Group g3;
Slider slWanScale3;
Slider slSprScale3;
Slider cslCohScale3;
Slider slAliScale3;
Slider slCohRange3;
Slider slSepRange3;
Slider slAliRange3;

Button butMakeIA;
Button butMakeG1;
Button butMakeG2;
Button butMakeG3;
Button butMakeAttr;
Button butMakeAttr2;

Button butMakeSA;
Button butPause;
Button butExport;
Button butImgBeh;
Button butImgDisp;
Button butRest;
Button butDebug;

boolean isDebug = false;

int sliderHeight = 10;
int sliderWidth = 100;
int groupWidth = 150;

int sliderX = 10;
int sliderSpacing = 5;
int buttonSpacing = 10;
int step;
int stepInGroup;
int grNum;
int elemInGr;
int prevGrCntr;



float SepScale1 = 1.5;
float SepScale2 = 2.9;
float SepScale3 = 0.9;
float SepScale4 = 2.9;
float SepScale5 = 3.2;

float wanScale1=0.01;
float springscale1=0.08;
float cohscale1=1;
float aliscale1=0.2;
float cohrange1=1.0;
float seprange1=1.0;
float alirange1=0.6;

float wanScale2=0.01;
float springscale2=0.08;
float cohscale2=1.2;
float aliscale2=0.2;
float cohrange2=1.0;
float seprange2=1.0;
float alirange2=0.6;


float wanScale3=0.01;
float springscale3=0.08;
float cohscale3=0.2;
float aliscale3=0.2;
float cohrange3=1.0;
float seprange3=1.0;
float alirange3=0.6;

float timerG1=0;

ArrayList imageMap[][]= new ArrayList[boxWidth + 1][boxHeight + 1];
//int[] imageMap[][]= new int[0] [boxWidth][boxHeight];


int counterSpawn = 0;

void setup() {

  //camera + movie setup--------------
  size(960, 1000, OPENGL);//keep pixel resolution same proportions as 1920x1080 (used for final movies)
  cp5 = new ControlP5(this);
  MakeInterface(true); 

  loadVecData("imports/bus.txt", aColl);
  loadVecData("imports/fsq.txt", fsqColl);
  frameRate(30);
  smooth();
  cam = new PeasyCam(this, 1300);
  cam.lookAt(boxWidth*0.35, boxHeight/2, 0);

  //get and store colour values for each pixel in the background image
  spawnImg = loadImage("imports/" + "spawnMap.jpg");
  obstacleImg = loadImage("imports/" + "comfortObstacleMap.jpg");

  int dimension = spawnImg.width*spawnImg.height;

  for (int i = 0; i<spawnImg.width;i++) {
    for (int j = 0; j<spawnImg.height;j++) {
      counterSpawn++;
      color  c1 = spawnImg.get(i, j);

      //Если счетчик не кратен числу, то переходим в начало цикла
      if (counterSpawn % 100 != 0) continue;

      int r1=(c1>>16)&255;
      if (random(255) < r1) {
        Vec3D pointLoc_= new Vec3D(i, j, 0); 
        spawnList.add(pointLoc_);
      }
    }
  }

  for (int i = 0; i<obstacleImg.width;i++) {
    for (int j = 0; j<obstacleImg.height;j++) {
      counterSpawn++;

      color  c1 = obstacleImg.get(i, j);

      ArrayList<String> test = new ArrayList<String>();

      imageMap[i][j] = new ArrayList<Integer>();
      // imageMap[i][j] = new int[2];

      int r1=(c1>>16)&255;
      int g1=(c1>>8)&255;
      int b1=c1&255;

      imageMap[i][j].add(int(r1));
      imageMap[i][j].add(int(g1));
      imageMap[i][j].add(int(b1));
    }
  }
  // initiate arraylists------------------
  agentPop = new ArrayList();
  springPop = new ArrayList();
}


void draw() {
  background(0);

  MakeInterface(false); 

  /*  if(!g1.isOpen()){
   butMakeIA.setPosition(sliderX, step+sliderSpacing*2);
   }
   else{
   butMakeIA.setPosition(sliderX, step+stepInGroup+sliderSpacing*2);
   }*/

  //  if (imageToggle == true) image(spawnImg, 0, 0);




  if (showBackgroundImage == true) image(obstacleImg, 0, 0);


  if (initialAgents == true) {
    //loop to create agents
    for (int i = 0; i< initialPopulation/2 ;i++) {
      //get setup vectors needed for agent-----
      Vec3D    p = new Vec3D(random(1) *boxWidth, random(1) *boxHeight, 0);

      Vec3D    v = new Vec3D(0, 0, 0);//(Vec3D) new Vec3D(random(1) -random(1) *speed, random(1) -random(1) *speed, 0);

      kAgent a = new kAgent ( p, v, globalMaxVel, globalMaxForce, 1, true);//position, velocity, maxVel, maxForce, type, active

        Vec3D   p2 = new Vec3D(random(1) *boxWidth, random(1) *boxHeight, 0);
      Vec3D  v2 = new Vec3D(0, 0, 0);//(Vec3D) new Vec3D(random(1) -random(1) *speed, random(1) -random(1) *speed, 0);

      kAgent b = new kAgent ( p2, v2, globalMaxVel, globalMaxForce, 2, true);//position, velocity, maxVel, maxForce, type, active
    }
    initialAgents = false;
  }

  //////////////////////////////////////////////MY_CODE{

  if (G1 == true) {
    //loop to create agents
    for (int i = 0; i < spawnList.size(); i++) {
      //get setup vectors needed for agent-----
      Vec3D    p = (Vec3D) spawnList.get(i);

      Vec3D    v = new Vec3D(0, 0, 0);//(Vec3D) new Vec3D(random(1) -random(1) *speed, random(1) -random(1) *speed, 0);

      kAgent a = new kAgent ( p, v, globalMaxVel, globalMaxForce, 1, true);//position, velocity, maxVel, maxForce, type, active
    }
    G1 = false;
  }


  if (G2 == true) {
    //loop to create agents
    for (int i = 0; i< initialPopulation;i++) {
      //get setup vectors needed for agent-----
      Vec3D    p = new Vec3D(random(1) *boxWidth, random(1) *boxHeight, 0);

      Vec3D    v = new Vec3D(0, 0, 0);//(Vec3D) new Vec3D(random(1) -random(1) *speed, random(1) -random(1) *speed, 0);

      kAgent a = new kAgent ( p, v, globalMaxVel, globalMaxForce, 2, true);//position, velocity, maxVel, maxForce, type, active
    }
    G2 = false;
  }


  if (G3 == true) {
    //loop to create agents
    for (int i = 0; i< initialPopulation;i++) {
      //get setup vectors needed for agent-----
      Vec3D    p = new Vec3D(random(1) *boxWidth, random(1) *boxHeight, 0);

      Vec3D    v = new Vec3D(0, 0, 0);//(Vec3D) new Vec3D(random(1) -random(1) *speed, random(1) -random(1) *speed, 0);

      kAgent a = new kAgent ( p, v, globalMaxVel, globalMaxForce, 3, false);//position, velocity, maxVel, maxForce, type, active
    }
    G3 = false;
  }


  if (makeAttr == true) {
    //loop to create agents
    for (int i = 0; i< aColl.size();i++) {
      //get setup vectors needed for agent-----

      Vec3D    p = (Vec3D)aColl.get(i);

      Vec3D    v = new Vec3D(0, 0, 0);//(Vec3D) new Vec3D(random(1) -random(1) *speed, random(1) -random(1) *speed, 0);

      kAgent a = new kAgent ( p, v, globalMaxVel, globalMaxForce, 3, false);//position, velocity, maxVel, maxForce, type, active
    }
    makeAttr = false;
  }

  if (makeAttr2 == true) {
    //loop to create agents
    for (int i = 0; i< fsqColl.size();i++) {
      //get setup vectors needed for agent-----

      Vec3D    p = (Vec3D)fsqColl.get(i);

      Vec3D    v = new Vec3D(0, 0, 0);//(Vec3D) new Vec3D(random(1) -random(1) *speed, random(1) -random(1) *speed, 0);

      kAgent a = new kAgent ( p, v, globalMaxVel, p.z*5, 2, false);//position, velocity, maxVel, maxForce, type, active
    }
    makeAttr2 = false;
  }
  //////////////////////////////////////////////}MY_CODE

  if (seedAgents == true) {

    float dice = random(1);
    if (dice > 0.9) {

      //get setup vectors needed for agent-----
      Vec3D    p3 = new Vec3D(200, 200, 0);
      Vec3D    v3 =  new Vec3D(random(1) -random(1) *globalMaxVel, random(1) -random(1) *globalMaxVel, 0);
      kAgent c = new kAgent ( p3, v3, globalMaxVel, globalMaxForce, 3, true);//position, velocity, maxVel, maxForce, type, active

      //get setup vectors needed for agent-----
      Vec3D    p4 = new Vec3D(600, 400, 0);
      Vec3D    v4 =  new Vec3D(random(1) -random(1) *globalMaxVel, random(1) -random(1) *globalMaxVel, 0);
      kAgent d = new kAgent ( p4, v4, globalMaxVel, globalMaxForce, 2, true);//position, velocity, maxVel, maxForce, type, active
    }
  }


  // controlP5.draw();

  // println(globalVision);

  //LOOP THROUGH ALL CLASSES AND UPDATE & RENDER FOR EACH FRAME-----------------------------------------------------------------------

  //println(agentPop.size());


  if (agentPop.size() > 0) {

    for (int i = 0; i < agentPop.size(); i++) {
      kAgent a = (kAgent) agentPop.get(i); 


      // AGENTS COUNTER     

      if (a.type==1) {
        g1Cnt++;
      }
      if (a.type==2) {
        g2Cnt++;
      }

      if (a.type==3) {
        g3Cnt++;
      }
      //////////////////


      if (pause == false) { 
        a.update();
      }
      else {
        a.render();
      }
    }

    for (int i = 0; i < springPop.size(); i++) {
      spring s = (spring) springPop.get(i); 
      s.render();
    }
  }
  //println("population = " + agentNum);

  //draw environment box --------------------
  ///*
  pushMatrix();
  noFill();
  stroke(226, 223, 199);
  strokeWeight(.5);
  //translate(boxWidth/2, boxHeight/2, boxDepth/2); 
  //box(boxWidth, boxHeight, boxDepth);
  rect(0, 0, boxWidth, boxHeight);
  popMatrix();
  // */


  // HUD
  fill(255);
  text("g1 Count " + Integer.toString(g1Cnt), 250, 20);
  text("g2 Count " + Integer.toString(g2Cnt), 350, 20);
  text("g3 Count " + Integer.toString(g3Cnt), 450, 20);
  g1Cnt=0;
  g2Cnt=0;
  g3Cnt=0;






  //---ADD FRAME TO MOVIE FILE--------------------

  cam.beginHUD();
  gui();
  cam.endHUD();

  cam.setMouseControlled(true);
  if (mouseX<200) {
    cam.setMouseControlled(false);
  }
}

void gui() {
  hint(DISABLE_DEPTH_TEST);
  pushStyle();
  noStroke();
  fill(255, 20);
  rect(0, 0, 200, height);
  popStyle();
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

void clean() {
}

