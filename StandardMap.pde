//Briag Dupont, Sept. 2018

//number of points that will be used. Change the values to get different resolutions
int numPoints = 1000;//10000;
//number of iterations for each point at each frame. Change the values to get different resolutions
int numIter = 500;//50000;
//Position vector of each point
PVector[] p;
//Array to store each of color for each point
color[] cols;

//Temporary x and y coordinates of the points
float xTemp, yTemp;

//k is a parameter in the reccursion formula, values between 0 and 5.8 give the best results
float k;


void setup() {

  //size(4961,3508); 
  size(600,600);
  background(0);
  //Set the initial value of k
  k = 1.52;
  //Setting the color mode to HSB to make it easier to cycle through the raimbow accross the x-coordinates
  //Each point will have its own color
  colorMode(HSB,numPoints,100,100);
 
 //Initialize the arrays
  p = new PVector[numPoints];
  cols = new color[numPoints];
  
  //Initialize the values in the array
  for (int i =0; i<numPoints; i++) {
    //the x-coordinates range between 0 and two pi, the y-coordinates are intialized to random values
    p[i] = new PVector(i*TWO_PI/numPoints,random(TWO_PI));
    //initialize the color values
    cols[i] = color(i,100,100);
  }
}

void draw() {

  pushMatrix();
  translate(width/TWO_PI,0);
  //Black background
  background(0);
  
  //reccursion part
  for (int i =0; i<numPoints; i++) {
    for (int j=0; j<numIter; j++) {
      //updates the coordinates of the points
      xTemp = p[i].x+k*sin(p[i].y);
      yTemp = p[i].y+xTemp;
      p[i].x = xTemp;
      p[i].y = yTemp%TWO_PI; //take modulo 2 pi
      //Draw the points
      stroke(cols[i]);
      point(p[i].x*width*0.1,p[i].y*height*0.18);
    }
    
  }
  popMatrix();
  
  //Uncomment to increase the value of k every frame
  //k+=0.001;
  //Uncomment to save the frames as png file
  //saveFrame("stdMapA3-######.png");

  //Uncomment so the program quits when k is greater 5.8
  //if (k>5.8){
  //  exit();
  //}
 
}