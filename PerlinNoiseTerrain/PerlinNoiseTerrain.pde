    int cols, rows;
    int scale = 20;
     int w = 3000; //width
    int h = 1200; //height
    
    float flying = 0;
    PFont f;
    
    float[][] terrain;
    
    void setup(){
    size(600,600, P3D);
    
    cols = w/scale;
    rows = h/scale;
    terrain = new float[cols][rows];

    }
    
    
    void draw(){
   
      flying -= 0.1; 
     float yOffset = flying;
     
     
     for(int y = 0; y < rows; y++){
       float xOffset = 0;
      for(int x = 0; x < cols; x++)
         {
         terrain[x][y] = map(noise(xOffset,yOffset),0,1,-100,100);
         xOffset += 0.1;
         }
         
          yOffset += 0.1;
      }
      
    background(48,124,239);
    stroke(0);
    fill(3,118,26);
    translate(width/2,height/2 +50 ); //translate the origin 
    rotateX(PI/3); //rotate it about the x axis
    
    translate(-w/2,-h/2);
    
    for(int y = 0; y < rows-1; y++){
      beginShape(TRIANGLE_STRIP);
        for(int x = 0; x < cols; x++)
         {
          vertex(x*scale,y*scale,terrain[x][y]);
          vertex(x*scale,(y+1)*scale,terrain[x][y+1]);
         //rect(x*scale,y*scale,scale,scale);
       
       
         }
      
          endShape();
      }
      
    }
  
  
  
  
  /* 
  
  How to make terrain? rectangle? 
  
  
  - Triangle strip 
  
  
  
  
  *  *  *  *  *  *
  *  *  *  *  *  *
  *  *  *  *  *  *
  *  *  *  *  *  *
  *  *  *  *  *  *
  *  *  *  *  *  *
  
  computer will join each vertices(*) to make little triangle squares. 
  
  Extrude some of the points from out of the screen to then give the apperance of 3D
  -change the Z value to extrude
  -data structure to store all the Z values? as the X and Y values are always constant. 2D array might be best
  
  For each loop I need to do Y and Y +1 so it goes up and then down
  
  
  
  Perlin Noise
  
  - way of smooth random numbers
  - 2d perlin noise 
  - noise() function in Processing
  
  */