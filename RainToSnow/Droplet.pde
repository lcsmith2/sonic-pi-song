/**
 * Author: Lily Smith (base code from Richard Pope: https://openprocessing.org/sketch/39064#)
 * Course: CSCI 3275
 * Assignment: M8
 * 12/10/22
 *
 * This file contains the code for the Droplet class.
 */
 
/*
 * Represents a droplet which falls down from the top of the screen. Each droplet is
 * either a raindrop or snowflake.
 */
class Droplet {
  int x;
  float y;
  float alpha;
  float radius;
  float rotation;
  int numPoints;
  boolean isSnowflake;
  
  int MIN_POINTS_STAR = 6;
  int MAX_POINTS_STAR = 11;
  int MAX_RADIUS = 14;
  float RAIN_FALL_FACTOR = 8;
  float SNOW_FALL_FACTOR = 12;
  float RAIN_ALPHA_RATE = 0.6;
  float SNOW_ALPHA_RATE = 0.25;
  float RADIUS_DECREASE_RATE = 0.00000001;
  float INVISIBLE_RADIUS = 1.5;

  /**
   * Constructor for the droplet class. Creates a droplet with position
   * (x, y) that is specified as a raindrop or snowflake.
   */
  Droplet(int x, int y, boolean isSnowflake) {
    this.x = x; 
    this.y = y; 
    alpha = 255; 
    radius = random(MAX_RADIUS);
    rotation = random(TWO_PI);
    numPoints = MIN_POINTS_STAR + (int) random(MAX_POINTS_STAR - MIN_POINTS_STAR);
    this.isSnowflake = isSnowflake;
  }
  
  /**
   * Returns if the droplet is visible (outside the window, fully transparent,
   * or has a small enough radius).
   */
  boolean notVisible() { 
    if (y < 0) {
      return false;
    }
    return (y > height) || (alpha < 0)  || (radius < INVISIBLE_RADIUS);
  }
  
  /*
   * Draws the droplet with its current attributes and position.
   */
  void display() {
    if (!notVisible()) {
      fill(255, 255, 255, alpha);
      stroke(255, 255, 255, alpha);
      strokeWeight(1);
      pushMatrix();
      translate(x - radius / 2, y - radius / 2);
      if (isSnowflake) {
        rotate(rotation);
        drawStar(numPoints, radius, radius / 4);
      }
      else {
        drawRaindrop(x, y, radius);
      }
      popMatrix();
     }
  }
    
  /**
   * Decreases the droplet's radius, and increases its transparency and y
   * position so it will be located lower in the window.
   */
  void fall() {
    if (isSnowflake) {
      alpha -= SNOW_ALPHA_RATE;
      y += radius / SNOW_FALL_FACTOR;
    }
    else {
      alpha -= RAIN_ALPHA_RATE;
      y += radius / RAIN_FALL_FACTOR;
    }
    radius *= (1 - RADIUS_DECREASE_RATE);
  }
}
