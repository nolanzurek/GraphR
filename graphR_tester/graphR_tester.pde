GraphR myGraphR = new GraphR(-8.5, 8.5, -8.5, 8.5);

void setup() {
  
  size(1000, 1000);
  background(255);
    
}

void draw() {
  
  myGraphR.addFunction(new Function("f(x) = tan(x)"), new Function("g(x) = sin(x)"));
  myGraphR.setTextSize(20);
  myGraphR.setBigStep(2);
  myGraphR.integral(1, -PI*2, 0);
  myGraphR.integral(2, -PI, PI);
  myGraphR.setGraphStroke(1, color(0, 0, 0));
  myGraphR.setGraphStroke(2, color(0, 0, 0));
  myGraphR.setAsymptoteStroke(1, color(0, 0, 0, 150));
  myGraphR.setIntegralFill(1, color(230, 150, 30, 150));
  myGraphR.setIntegralFill(2, color(30, 230, 150, 150));
  myGraphR.drawGraph();
  
  
  noLoop();

}

void keyPressed() {

  saveFrame("oof.png");
  
}
