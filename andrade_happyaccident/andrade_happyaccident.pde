/*
CREATED: APRIL 27th
Here is a mistake version of my interpretation of Andrade's piece, this one was by accidentally
created as I segued into creating my interactive piece, but as Bob Ross says, "We don't make mistakes. We just have happy little accidents.

I recreated a version of one of Edna Andrade's screenprints, which I find utterly captivating. 
I love the metallic sheen to the work, and wanted to see if there was a way this could be re-interpreted in code.

A leader of the Op Art movement and a fascinating powerful woman, I wanted to 
give her homage. I first learned about her when the Philadelphia museum of Art
announced her exhibition, pre-covid lockdown. Every passing year living in Philly,
I gain more appreciation for the city and its rich art history. The mural arts program,
Isaiah Zagar's magic gardens, Andrade, and others add and have pathed the way
to Philadelphia's unique artistic culture today. 

After spending a long time trying to even understand the math and how to 
feasibly draw this print, I have a newfound appreciation for her work. The amount
of mistakes I made on this document makes me appreciate the amount of work
it must have been for her to create this work (one of her many fantastic works) 
on paper.

Link to original piece:
http://www.locksgallery.com/exhibitions/edna-andrade-prints#2*/

float px, py;
float angle = 0;

float px0, py0;
float newpx, newpy;
float angleHAH = 0;
float newangle;

//CONSTANTS
float radius = 492;
float frequency =3.6;
float raynum = 25;
float sqsize = 492;

float bend = 105;
PShape centerPiece;

//COLORS (grayscale)
//might need to change these values
float transparency = .8;
float transparencyRay = 200;
color b1 = color(255);
color b2 = color(50);
//color max = color(228);

void setup() {
  fullScreen();
}

void draw() {


  /*BACKGROUND——————————————————————————————————————————*/
  //DISCLAIMER! this code up until noFill is not my intellectual property, 
  //found on the processing reference example guide!

  //background noise 
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float bright = random(0, 255);
      pixels[x+y*width] = color(bright);
    }
  }
  updatePixels();

  //background gradient
  for (int i = 0; i <= height; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(b1, b2, inter);
    stroke(c, transparency*255);
    line(0, i, width, i);
  }
  /*BACKGROUND——————————————————————————————————————————*/

  pushMatrix();
  translate(width/2, height/2);

  /*RAYS——————————————————————————————————————————*/

  //RAYSFILL OF SHAPE
  noStroke();

  for (int i = 0; i <raynum; i++) {
    px0 = 0 + cos(radians(angleHAH))*(radius);
    py0 = 0 + sin(radians(angleHAH))*(radius);

    newangle = angleHAH - frequency;
    newpx = cos(radians(newangle))*(radius);
    newpy = sin(radians(newangle))*(radius);

    /*TOP RIGHT QUADRANT——————————————————————————————————————————*/
    //EDIT FILL PROPERTIES HERE INNER
    fill(random(25, 228), transparencyRay);

    //INNERRAYSFILLSHAPE
    beginShape();
    vertex(0, 0);

    vertex(px0, py0); //old vertex
    vertex(newpx, newpy); //new updated vertex

    vertex(0, 0); 
    endShape();

    //EDIT FILL PROPERTIES HERE OUTER
    fill(random(50, 228), transparencyRay);

    //OUTERRAYSFILLSHAPE
    beginShape();
    vertex(px0, py0);

    vertex(sqsize, -sqsize);
    vertex(newpx, newpy);

    vertex(px0, py0);
    endShape();
    /*END OF TOP RIGHT——————————————————————————————————————————*/

    /*BOTTOM LEFT QUADRANT——————————————————————————————————————————*/
    //EDIT FILL PROPERTIES HERE INNER
    fill(random(25, 228), transparencyRay);

    //INNERRAYSFILLSHAPE
    beginShape();
    vertex(0, 0);

    vertex(-px0, -py0); //old vertex
    vertex(-newpx, -newpy); //new updated vertex

    vertex(0, 0); 
    endShape();

    //EDIT FILL PROPERTIES HERE OUTER
    fill(random(50, 228), transparencyRay);

    //OUTERRAYSFILLSHAPE
    beginShape();
    vertex(-px0, -py0);

    vertex(-sqsize, sqsize);
    vertex(-newpx, -newpy);

    vertex(-px0, -py0);
    endShape();
    /*END OF BOTTOM LEFT——————————————————————————————————————————*/

    /*TOP LEFT QUADRANT——————————————————————————————————————————*/
    //EDIT FILL PROPERTIES HERE outer
    fill(random(25, 228), transparencyRay);

    //OUUTERRAYSFILLSHAPE
    beginShape();
    vertex(-sqsize, -sqsize);

    vertex(px0-sqsize, -py0-sqsize); //old vertex
    vertex(newpx-sqsize, -newpy-sqsize); //new updated vertex

    vertex(-sqsize, -sqsize); 
    endShape();

    //EDIT FILL PROPERTIES HERE inner
    fill(random(50, 228), transparencyRay);

    ////INNERRAYSFILLSHAPE
    beginShape();
    vertex(px0-sqsize, -py0-sqsize);

    vertex(0, 0);
    vertex(newpx-sqsize, -newpy-sqsize);

    vertex(px0-sqsize, -py0-sqsize);
    endShape();
    /*END OF TOP LEFT——————————————————————————————————————————*/

    /*BOTTOM RIGHT QUADRANT——————————————————————————————————————————*/
    //EDIT FILL PROPERTIES HERE outer
    fill(random(25, 228), transparencyRay);

    //OUUTERRAYSFILLSHAPE
    beginShape();

    vertex(sqsize, sqsize);

    vertex(-px0+sqsize, py0+sqsize); //old vertex
    vertex(-newpx+sqsize, newpy+sqsize); //new updated vertex

    vertex(sqsize, sqsize); 

    endShape();

    //EDIT FILL PROPERTIES HERE inner
    fill(random(50, 228), transparencyRay);

    ////INNERRAYSFILLSHAPE
    beginShape();

    vertex(-px0+sqsize, py0+sqsize);

    vertex(0, 0);
    vertex(-newpx+sqsize, newpy+sqsize);

    vertex(-px0+sqsize, py0+sqsize);

    endShape();
    /*END OF BOTTOM RIGHT——————————————————————————————————————————*/

    angleHAH = angleHAH - frequency;
  }

  //OUTLINES
  stroke(0);
  noFill();
  for (int i = 0; i <=raynum; i++) {
    px = 0 + cos(radians(angle))*(radius);
    py = 0 + sin(radians(angle))*(radius);

    //longlines
    //top right quadrant
    line(0, 0, px, py);
    //bottom left quadrant
    line(0, 0, -px, -py);
    //topleftquadrant
    line(-sqsize, -sqsize, px-sqsize, -py-sqsize);
    //bottomrightquadrant
    line(sqsize, sqsize, -px+sqsize, py+sqsize);

    //shorterlines
    //top right quadrant
    line(px, py, sqsize, -sqsize);
    //bottom left quadrant
    line(-px, -py, -sqsize, sqsize);
    //topleftquadrant
    line(px-sqsize, -py-sqsize, 0, 0);
    //bottomrightquadrant
    line(-px+sqsize, py+sqsize, 0, 0);

    angle = angle - frequency;
  }
  /*END OFRAYS——————————————————————————————————————————*/

  /*OUTLINES——————————————————————————————————————————*/
  //fill(max);
  noFill();
  ////+- quadrant, top right
  rect(0, -sqsize, sqsize, sqsize, 0, bend, 0, bend);
  ////-- quadrant, top left
  rect(-sqsize, -sqsize, sqsize, sqsize, bend, 0, bend, 0);
  //-+ quadrant, bottom left
  rect(-sqsize, 0, sqsize, sqsize, 0, bend, 0, bend);
  //++ quadrant, bottom right
  rect(0, 0, sqsize, sqsize, bend, 0, bend, 0);

  //centerpiece COLORING
  noStroke();
  //fill(255,200);
  centerPiece = createShape(RECT, 0, 0, 0, 0, -bend, -bend, -bend, -bend);
  shape(centerPiece, 0, 0);

  popMatrix();

  //ADD HERE IF I WANT TO COLOR THE OTHER EDGES OR NAW, 
  //OO OR I COULD JUST CREATE A NEW BACKGROUND AND PLACE IT ONTOP!

  noFill();
  stroke(0);
  //arcs
  //bottomright
  arc(1344, 1006, 1006, 957, radians(178.5), radians(268.5));
  //bottomleft
  arc(852, 538, 1006, 957, radians(91.5), radians(181.5));
  //topleft
  arc(335, 45, 1006, 957, radians(-1.4), radians(88.5));
  //topright
  arc(827, 514, 1006, 957, radians(271.5), radians(361.5));
}
