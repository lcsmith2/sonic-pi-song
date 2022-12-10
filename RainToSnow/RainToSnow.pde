/**
 * Author: Lily Smith (base code from Richard Pope: https://openprocessing.org/sketch/39064#)
 * Course: CSCI 3275
 * Assignment: M8
 * 12/10/22
 *
 * This file contains the main code for a processing program that animates a transition 
 * from rain to snow.
 */
String graphicsMode =  P2D;
ArrayList<Droplet> droplets;
int MAX_NEW_DROPLETS = 4;
int SNOW_START_TIME = 80;
int ALL_SNOW_TIME = 180;
int STOP_SNOW_START_TIME = 270;
int STOP_ALL_SNOW_TIME = 320;

/**
 * Creates a droplet with a random x position in the range [0, width)
 * and a random y position in the range [0, height / n).
 */
void createDroplet(int n, boolean isSnowflake) {
   int x = (int) random(width);
   int y = (int) random(height / n);
   droplets.add(new Droplet(x, -y, isSnowflake)); 
}

/*
 * Processing setup() method.
 */
void setup() {
  frameRate(30);
  size(1920, 1080, P2D); 
  colorMode(RGB, 255, 255, 255, 255);
  droplets = new ArrayList();  
}

/*
 * Processing draw method(). This method continues to execute until
 * the program is stopped.
 */
void draw() {
  background(0);
  for (int i = 0; i < droplets.size(); i++) {
    Droplet droplet = droplets.get(i);
    if (droplet.notVisible()) {
      droplets.remove(i);
      continue;
    }
    droplet.fall();
    droplet.display(); 
  }
  if ((frameCount & 2) > 0) {
    int x = (int) random(MAX_NEW_DROPLETS);
    for (int j = 0; j < x; j++) {
      boolean isSnowflake = false;
      int secondsSinceStart = millis() / 1000;
      // Transition to snowflakes
      if (secondsSinceStart > SNOW_START_TIME && random(1) < ((float) secondsSinceStart / ALL_SNOW_TIME)) {
        isSnowflake = true;
      }
      // Start to stop snow if enough time has passed
      if (secondsSinceStart < STOP_SNOW_START_TIME || (secondsSinceStart > STOP_SNOW_START_TIME && 
        random(1) > ((float) secondsSinceStart / STOP_ALL_SNOW_TIME))) {
        createDroplet(4, isSnowflake); // add droplet to top 1/4th of window
        createDroplet(8, isSnowflake); // add droplet to top 1/8th of window
      }
    }
  }
}

/**
 * Draws a star with nPoints, a smaller radius of rad1, and larger radius of rad2.
 */
void drawStar(int nPoints, float rad1, float rad2) {
  float angle = TWO_PI / nPoints;
  float angle2 = angle / 2;
  float origAngle = 0.0;
  beginShape();
  for (int i = 0; i < nPoints; i++) {
    float y1 = rad1 * sin(origAngle);
    float x1 = rad1 * cos(origAngle);
    float y2 = rad2 * sin(origAngle + angle2);
    float x2 = rad2 * cos(origAngle + angle2);
    vertex(x1, y1);
    vertex(x2, y2);
    origAngle += angle;
  }
  endShape(CLOSE);
}

/*
 * Draws a raindrop at (x, y) with the specified radius.
 */
void drawRaindrop(float x, float y, float radius) {
  noStroke();
  for (int i = 2; i < radius / 2; i++) {
    ellipse(x, y + i * 4, i * 2, i * 2);
  }
}
