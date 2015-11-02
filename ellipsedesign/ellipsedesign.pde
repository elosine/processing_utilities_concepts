/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/126620*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* This program draws several ellipses on the screen
/* This code draws several ellipses on the screen using 
*  only two Processing commands ellipse(); and strokeWeight(6); 
*  Created by Olaf Keller
*/

import processing.pdf.*;
int s = 4;
//size(500, 500, PDF, "ellipses_olaf_keller.pdf");
void setup(){
size(500, 500, OPENGL);
}


void draw(){
  background(255);
//Two spirals
noStroke();
fill(0, 255, 0);

s = 4;
ellipse(316, 306, s, s);
s+=2;
ellipse(306, 319, s, s);
s+=2;
ellipse(318, 332, s, s);
s+=2;
ellipse(347, 308, s, s);
s+=2;
ellipse(344, 289, s, s);
 s+=2;
ellipse(343, 326, s, s);
s+=2;
ellipse(331, 275, s, s);
s+=2;
ellipse(310, 268, s, s);
s+=2;
ellipse(292, 276, s, s);
s+=2;
ellipse(279, 302, s, s);
s+=2;
ellipse(282, 333, s, s);
s+=2;
ellipse(307, 358, s, s);
s+=2;
ellipse(350, 368, s, s);
s+=2;
ellipse(395, 343, s, s);
s+=2;
ellipse(413, 302, s, s);
s+=2;
ellipse(399, 258, s, s);
s+=2;
ellipse(369, 236, s, s);
s+=2;
ellipse(332, 224, s, s);
s-=2;
ellipse(275, 236, s, s);
s-=2;
ellipse(238, 238, s, s);
s-=2;
ellipse(200, 223, s, s);
s-=2;
ellipse(176, 183, s, s);
s-=2;
ellipse(172, 137, s, s);
s-=2;
ellipse(202, 101, s, s);
s-=2;
ellipse(236, 96, s, s);
s-=2;
ellipse(276, 116, s, s);
s-=2;
ellipse(294, 157, s, s);
s-=2;
ellipse(268, 196, s, s);
s-=2;
ellipse(228, 192, s, s);
s-=2;
ellipse(210, 178, s, s);
s-=2;
ellipse(210, 157, s, s);
s-=2;
ellipse(223, 146, s, s);
s-=2;
ellipse(243, 146, s, s);
s-=2;
ellipse(253, 162, s, s);
s-=2;
ellipse(243, 176, s, s);

//Big star
s = 80;
ellipse(88, 343, s, s);


//glow(3, 2);
}
