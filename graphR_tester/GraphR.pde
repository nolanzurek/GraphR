class GraphR {

  float xMin = -10; float xMax = 10; float yMin = -10; float yMax = 10;
  
  float bigStep = 5; int bigStepWeight = 5; color bigStepStroke = color(230, 230, 230);
  float smallStep = 1; int smallStepWeight = 2; color smallStepStroke = color(230, 230, 230);
  int mainAxisWeight = 8; color mainAxisStroke = color(230, 230, 230);
  
  color backgroundColor = color(255, 255, 255);
  
  boolean showLabels = true; boolean showGridlines = true;
  
  int textSize = 20; color textColor = #000000; int textDisplayDecimals = 0; float textStep = 2;
  
  color[] graphColors = {#FF0000, #00FF00, #0000FF, #00FFFF, #FF00FF, #FFFF00};
  int[] graphStrokeWeights = {5, 5, 5, 5, 5, 5};
  color[] riemannFills = {#FF0000, #00FF00, #0000FF, #00FFFF, #FF00FF, #FFFF00};
  color[] riemannStrokes = {#FF0000, #00FF00, #0000FF, #00FFFF, #FF00FF, #FFFF00};
  int[] riemannStrokeWeights = {5, 5, 5, 5, 5, 5};
  boolean[] riemannPoints = {true, true, true, true, true, true};
  color[] riemannPointColors = {#000000, #000000, #000000, #000000, #000000, #000000};
  int[] riemannPointWeights = {10, 10, 10, 10, 10, 10};
  color[] integralFills = {#FF0000, #00FF00, #0000FF, #00FFFF, #FF00FF, #FFFF00};
  color[] tangentStrokes = {#FF0000, #00FF00, #0000FF, #00FFFF, #FF00FF, #FFFF00};
  int[] tangentWeights = {3, 3, 3, 3, 3, 3};
  boolean[] tangentDashed = {false, false, false, false, false, false};
  color[] asymptoteStroke = {#FF0000, #00FF00, #0000FF, #00FFFF, #FF00FF, #FFFF00};
  int[] asymptoteWeights = {3, 3, 3, 3, 3, 3};
  boolean[] drawVAsymptote = {true, true, true, true, true, true};
  boolean[] drawHAsymptote = {true, true, true, true, true, true};
  boolean[] drawPoints = {false, false, false, false, false, false};
  int[] functionPointWeight = {10, 10, 10, 10, 10, 10};
  color[] functionPointColor = {#000000, #000000, #000000, #000000, #000000, #000000};
  
  ArrayList<Function> functionsToGraph = new ArrayList<Function>();
  
  ArrayList<ArrayList<float[]>> riemanns = new ArrayList<ArrayList<float[]>>();
  ArrayList<ArrayList<float[]>> integrals = new ArrayList<ArrayList<float[]>>();
  ArrayList<ArrayList<Float>> tangents = new ArrayList<ArrayList<Float>>();

  GraphR() {
    
  }
  
  GraphR(float xMin, float xMax, float yMin, float yMax) {
  
    this.xMin = xMin;
    this.xMax = xMax;
    this.yMin = yMin;
    this.yMax = yMax;
    
  }
  
  GraphR(float xMin, float xMax, float yMin, float yMax, float bigStep, float smallStep) {
  
    this.xMin = xMin;
    this.xMax = xMax;
    this.yMin = yMin;
    this.yMax = yMax;
    this.bigStep = bigStep;
    this.smallStep = smallStep;
    
  }
  
  void addFunction(Function... functions) {
  
    for(int i = 0; i < functions.length; i++) {
    
      functionsToGraph.add(functions[i]);
      
      ArrayList<float[]> tempFloatArrRiemanns = new ArrayList<float[]>();
      riemanns.add(tempFloatArrRiemanns);
      
      ArrayList<float[]> tempFloatArrIntegrals = new ArrayList<float[]>();
      integrals.add(tempFloatArrIntegrals);
      
      ArrayList<Float> tempFloatTangents = new ArrayList<Float>();
      tangents.add(tempFloatTangents);
      
    }
    
  }
  
  void drawGraph() {
    
    //draw axes
    
    background(backgroundColor);
    
    stroke(mainAxisStroke); strokeWeight(mainAxisWeight);
  
    point(map(0, xMin, xMax, 0, width), map(0, yMin, yMax, 0, height));
    
    line(map(0, xMin, xMax, 0, width), height, map(0, xMin, xMax, 0, width), 0);
    line(0, map(0, yMin, yMax, 0, height), width, map(0, yMin, yMax, 0, height));
    
    if(showGridlines) {
    
      strokeWeight(bigStepWeight); textSize(textSize); fill(textColor);
    
      //big step vertical lines
      
      for(float i = 0; i < xMax; i += bigStep) {
      
        line(map(i, xMin, xMax, 0, width), height, map(i, xMin, xMax, 0, width), 0);
        
      }
      
      for(float i = 0; i > xMin; i -= bigStep) {
      
        line(map(i, xMin, xMax, 0, width), height, map(i, xMin, xMax, 0, width), 0);
        
      }
      
      //big step horizontal lines
      
      for(float i = 0; i < yMax; i += bigStep) {
      
        line(0, map(i, yMin, yMax, 0, height), width, map(i, yMin, yMax, 0, height));
        
      }
      
      for(float i = 0; i > yMin; i -= bigStep) {
      
        line(0, map(i, yMin, yMax, 0, height), width, map(i, yMin, yMax, 0, height));
        
      }
      
      stroke(smallStepStroke); strokeWeight(smallStepWeight);
      
      //small step vertical lines
      
      for(float i = 0; i < xMax; i += smallStep) {
      
        line(map(i, xMin, xMax, 0, width), height, map(i, xMin, xMax, 0, width), 0);
        
      }
      
      for(float i = 0; i > xMin; i -= smallStep) {
      
        line(map(i, xMin, xMax, 0, width), height, map(i, xMin, xMax, 0, width), 0);
        
      }
      
      //small step horizontal lines
      
      for(float i = 0; i < yMax; i += smallStep) {
      
        line(0, map(i, yMin, yMax, 0, height), width, map(i, yMin, yMax, 0, height));
        
      }
      
      for(float i = 0; i > yMin; i -= smallStep) {
      
        line(0, map(i, yMin, yMax, 0, height), width, map(i, yMin, yMax, 0, height));
        
      }
      
    }
    
    if(showLabels) {
    
      for(float i = 0; i < xMax + textStep; i += textStep) {
      
        if(i == 0) {} else {
          
          if(yMin > 0) {
            
            textAlign(CENTER, BOTTOM);
          
            text(nf(i, 0, textDisplayDecimals), map(i, xMin, xMax, 0, width), height-textSize*0.7);
            
          } else if (yMax < 0) {
            
            textAlign(CENTER, TOP);
          
            text(nf(i, 0, textDisplayDecimals), map(i, xMin, xMax, 0, width), textSize*1.3);
            
          } else {
            
            textAlign(CENTER, TOP);
          
            text(nf(i, 0, textDisplayDecimals), map(i, xMin, xMax, 0, width), map(0, yMin, yMax, 0, height) + textSize*0.7);
            
          }
          
        }
      
      }
      
      for(float i = 0; i > xMin - textStep; i -= textStep) {
      
        if(i == 0) {} else {
          
          if(yMin > 0) {
            
            textAlign(CENTER, BOTTOM);
          
            text(nf(i, 0, textDisplayDecimals), map(i, xMin, xMax, 0, width), height-textSize*0.7);
            
          } else if (yMax < 0) {
            
            textAlign(CENTER, TOP);
          
            text(nf(i, 0, textDisplayDecimals), map(i, xMin, xMax, 0, width), textSize*1.3);
            
          } else {
            
            textAlign(CENTER, TOP);
          
            text(nf(i, 0, textDisplayDecimals), map(i, xMin, xMax, 0, width), map(0, yMin, yMax, 0, height) + textSize*0.7);
            
          }
          
        }
      
      }
    
    //big step y-axis text
    
      for(float i = 0; i < yMax + textStep; i += textStep) {
        
        if(i == 0) {
          
          textAlign(RIGHT, TOP);
        
          text(nf(i, 0, textDisplayDecimals), map(0, xMin, xMax, 0, width) - textSize*0.7, map(0, yMin, yMax, 0, height) + textSize*0.7);
          
        } else {  
          
          if(xMin > 0) {
            
            textAlign(LEFT, CENTER);
          
            text(nf(i, 0, textDisplayDecimals), textSize*0.7, map(i, yMin, yMax, height, 0));
            
          } else if (xMax < 0) {
            
            textAlign(RIGHT, CENTER);
          
            text(nf(i, 0, textDisplayDecimals), width - textSize*0.7, map(i, yMin, yMax, height, 0));
            
          } else {
            
            textAlign(RIGHT, CENTER);
          
            text(nf(i, 0, textDisplayDecimals), map(0, xMin, xMax, 0, width) - textSize*0.7, map(i, yMin, yMax, height, 0));
            
          }
          
        }
        
      }
      
      for(float i = 0; i > yMin - textStep; i -= textStep) {
        
        if(i == 0) {
          
          textAlign(RIGHT, TOP);
        
          text(nf(i, 0, textDisplayDecimals), map(0, xMin, xMax, 0, width) - textSize*0.7, map(0, yMin, yMax, 0, height) + textSize*0.7);
          
        } else {  
          
          if(xMin > 0) {
            
            textAlign(LEFT, CENTER);
          
            text(nf(i, 0, textDisplayDecimals), textSize*0.7, map(i, yMin, yMax, height, 0));
            
          } else if (xMax < 0) {
            
            textAlign(RIGHT, CENTER);
          
            text(nf(i, 0, textDisplayDecimals), width - textSize*0.7, map(i, yMin, yMax, height, 0));
            
          } else {
            
            textAlign(RIGHT, CENTER);
          
            text(nf(i, 0, textDisplayDecimals), map(0, xMin, xMax, 0, width) - textSize*0.7, map(i, yMin, yMax, height, 0));
            
          }
          
        }
        
      }
      
    }
    
    float increment = (xMax - xMin)/width;
    
    for(int i = 0; i < functionsToGraph.size(); i++) {
      
      //integrals
      
      stroke(integralFills[i]); strokeWeight(1);
      
      for(int j = 0; j < integrals.get(i).size(); j++) {
      
        for(float k = integrals.get(i).get(j)[0]; k < integrals.get(i).get(j)[1]; k += map(1, -width/2, width/2, xMin, xMax)) {
        
          line(map(k, xMin, xMax, -width/2, width/2)+width/2, -1*map(0, yMin, yMax, -height/2, height/2)+height/2, map(k, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(k), yMin, yMax, -height/2, height/2)+height/2);

        }
        
      }
      
      //riemanns
      
      for(int j = 0; j < riemanns.get(i).size(); j++) {
        
        rectMode(CORNERS);
        
        if(riemanns.get(i).get(j)[0] == 1) {
        
          for(float k = riemanns.get(i).get(j)[1]; k < riemanns.get(i).get(j)[2]; k += (riemanns.get(i).get(j)[2] - riemanns.get(i).get(j)[1])/riemanns.get(i).get(j)[3]) {
          
            fill(riemannFills[i]); stroke(riemannStrokes[i]); strokeWeight(riemannStrokeWeights[i]);
            
            rect(map(k, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(k), yMin, yMax, -height/2, height/2)+height/2, map(k + ((riemanns.get(i).get(j)[2] - riemanns.get(i).get(j)[1])/riemanns.get(i).get(j)[3]), xMin, xMax, -width/2, width/2)+width/2, -1*map(0, yMin, yMax, -height/2, height/2)+height/2);
            
            if(riemannPoints[i]) {
              
              stroke(riemannPointColors[i]); strokeWeight(riemannPointWeights[i]);
            
              point(map(k, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(k), yMin, yMax, -height/2, height/2)+height/2);
              
            }
            
          }
          
        } else if (riemanns.get(i).get(j)[0] == 2) {
        
          for(float k = riemanns.get(i).get(j)[1]; k < riemanns.get(i).get(j)[2]; k += (riemanns.get(i).get(j)[2] - riemanns.get(i).get(j)[1])/riemanns.get(i).get(j)[3]) {
          
            fill(riemannFills[i]); stroke(riemannStrokes[i]); strokeWeight(riemannStrokeWeights[i]);
            
            rect(map(k, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(k + ((riemanns.get(i).get(j)[2] - riemanns.get(i).get(j)[1])/riemanns.get(i).get(j)[3])), yMin, yMax, -height/2, height/2)+height/2, map(k + ((riemanns.get(i).get(j)[2] - riemanns.get(i).get(j)[1])/riemanns.get(i).get(j)[3]), xMin, xMax, -width/2, width/2)+width/2, -1*map(0, yMin, yMax, -height/2, height/2)+height/2);
            
            if(riemannPoints[i]) {
              
              stroke(riemannPointColors[i]); strokeWeight(riemannPointWeights[i]);
            
              point(map(k, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(k), yMin, yMax, -height/2, height/2)+height/2);
              
            }
            
          }
          
        } else if (riemanns.get(i).get(j)[0] == 3) {
        
          for(float k = riemanns.get(i).get(j)[1]; k < riemanns.get(i).get(j)[2]; k += (riemanns.get(i).get(j)[2] - riemanns.get(i).get(j)[1])/riemanns.get(i).get(j)[3]) {
          
            fill(riemannFills[i]); stroke(riemannStrokes[i]); strokeWeight(riemannStrokeWeights[i]);
            
            rect(map(k, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(k + 0.5*((riemanns.get(i).get(j)[2] - riemanns.get(i).get(j)[1])/riemanns.get(i).get(j)[3])), yMin, yMax, -height/2, height/2)+height/2, map(k + ((riemanns.get(i).get(j)[2] - riemanns.get(i).get(j)[1])/riemanns.get(i).get(j)[3]), xMin, xMax, -width/2, width/2)+width/2, -1*map(0, yMin, yMax, -height/2, height/2)+height/2);
            
            if(riemannPoints[i]) {
              
              stroke(riemannPointColors[i]); strokeWeight(riemannPointWeights[i]);
            
              point(map(k + (abs(riemanns.get(i).get(j)[1] - riemanns.get(i).get(j)[2])/riemanns.get(i).get(j)[3])*0.5, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(k + (abs(riemanns.get(i).get(j)[1] - riemanns.get(i).get(j)[2])/riemanns.get(i).get(j)[3])*0.5), yMin, yMax, -height/2, height/2)+height/2);
              
            }
            
          }
          
        }
        
      }
      
      //tangent at point x
      
      stroke(tangentStrokes[i]); strokeWeight(tangentWeights[i]);
      
      for(int j = 0; j < tangents.get(i).size(); j++) {
        
        float y1 = -1*map((float)(functionsToGraph.get(i).calculate(tangents.get(i).get(j)) + ((functionsToGraph.get(i).calculate(tangents.get(i).get(j) + increment*0.1) - functionsToGraph.get(i).calculate(tangents.get(i).get(j)))/(increment*0.1)) * (xMin - tangents.get(i).get(j))), yMin, yMax, -height/2, height/2)+height/2;
        float y2 = -1*map((float)(functionsToGraph.get(i).calculate(tangents.get(i).get(j)) + ((functionsToGraph.get(i).calculate(tangents.get(i).get(j) + increment*0.1) - functionsToGraph.get(i).calculate(tangents.get(i).get(j)))/(increment*0.1)) * (xMax - tangents.get(i).get(j))), yMin, yMax, -height/2, height/2)+height/2;
      
        if(tangentDashed[i]) {
        
          dottedLine(0, (float)y1, width, (float)y2);
          
        } else {
        
          line(0, (float)y1, width, (float)y2);
          
        }
        
      }
      
      beginShape();
    
      for(float j = xMin; j < xMax; j+= increment) {
        
        /* VARIABLE INCREMENT
        
        if(1/functionsToGraph.get(i).calculate(j) < 5 && 1/functionsToGraph.get(i).calculate(j) > 0.1) {
        
          increment = (float)(1/functionsToGraph.get(i).calculate(j))*(xMax - xMin)/width;
          
        }
        
        */
        
        //check for vertical asymptotes
        
        if(drawVAsymptote[i]) {
        
          if(above0((float)functionsToGraph.get(i).calculate(j)) != above0((float)functionsToGraph.get(i).calculate(j + increment)) && abs((float)functionsToGraph.get(i).calculate(j) - (float)functionsToGraph.get(i).calculate(j + increment)) > 100) {
            
            stroke(asymptoteStroke[i]); strokeWeight(asymptoteWeights[i]);
            
            dottedLine(map(j, xMin, xMax, -width/2, width/2)+width/2, 0, map(j, xMin, xMax, -width/2, width/2)+width/2, height);
            
          }
          
        }
        
        //check for horizontal asymptotes
        
        if(drawHAsymptote[i]) {
        
          if(Math.abs(functionsToGraph.get(i).calculate(1000000) - functionsToGraph.get(i).calculate(1000000 + random(100, 200))) < 0.0001 && Math.abs(functionsToGraph.get(i).calculate(1000000) - functionsToGraph.get(i).calculate(1000000 + random(100, 200))) < 0.0001) {
            
            stroke(asymptoteStroke[i]); strokeWeight(asymptoteWeights[i]);
            
            dottedLine(0, -1*map((float)functionsToGraph.get(i).calculate(1000000), yMin, yMax, -height/2, height/2)+height/2, width, -1*map((float)functionsToGraph.get(i).calculate(1000000), yMin, yMax, -height/2, height/2)+height/2);
            
          }
          
          if(Math.abs(functionsToGraph.get(i).calculate(-1000000) - functionsToGraph.get(i).calculate(-1000000 + random(100, 200))) < 0.0001 && Math.abs(functionsToGraph.get(i).calculate(-1000000) - functionsToGraph.get(i).calculate(-1000000 + random(100, 200))) < 0.0001) {
            
            stroke(asymptoteStroke[i]); strokeWeight(asymptoteWeights[i]);
            
            dottedLine(0, -1*map((float)functionsToGraph.get(i).calculate(-1000000), yMin, yMax, -height/2, height/2)+height/2, width, -1*map((float)functionsToGraph.get(i).calculate(-1000000), yMin, yMax, -height/2, height/2)+height/2);
            
          }
          
        }
        
        //if a vertex isn't drawn on the screen and isn't connected to any that are, create a new shape. Otherwise, draw a vertex() for each point calculated
        
        if(functionsToGraph.get(i).calculate(j) > yMax) {
          
          stroke(graphColors[i]); strokeWeight(graphStrokeWeights[i]); noFill();
          
          if((functionsToGraph.get(i).calculate(j) - functionsToGraph.get(i).calculate(j+increment))/increment > 0) {
            
            stroke(graphColors[i]); strokeWeight(graphStrokeWeights[i]); noFill();
          
            endShape();
          
            beginShape();
            
            vertex(map(j, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(j), yMin, yMax, -height/2, height/2)+height/2);
            
          } else if((functionsToGraph.get(i).calculate(j) - functionsToGraph.get(i).calculate(j+increment))/increment < 0) {
          
            stroke(graphColors[i]); strokeWeight(graphStrokeWeights[i]); noFill();
            
            vertex(map(j, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(j), yMin, yMax, -height/2, height/2)+height/2);
          
            endShape();
          
            beginShape();
            
          }
          
        } else if(functionsToGraph.get(i).calculate(j) < yMin) {
          
          strokeWeight(graphStrokeWeights[i]);
        
          if((functionsToGraph.get(i).calculate(j) - functionsToGraph.get(i).calculate(j+increment))/increment > 0) {
            
            stroke(graphColors[i]); strokeWeight(graphStrokeWeights[i]); noFill();
            
            vertex(map(j, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(j), yMin, yMax, -height/2, height/2)+height/2);
          
            endShape();
          
            beginShape();
            
          } else if((functionsToGraph.get(i).calculate(j) - functionsToGraph.get(i).calculate(j+increment))/increment < 0) {
            
            stroke(graphColors[i]); strokeWeight(graphStrokeWeights[i]); noFill();
          
            endShape();
          
            beginShape();
            
            vertex(map(j, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(j), yMin, yMax, -height/2, height/2)+height/2);
            
          }
        
        } else {
          
          stroke(graphColors[i]); strokeWeight(graphStrokeWeights[i]); noFill();
        
          vertex(map(j, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(j), yMin, yMax, -height/2, height/2)+height/2);
          
        }
        
        if(drawPoints[i]) {
        
          if(abs(j) < increment || abs((float)functionsToGraph.get(i).calculate(j)) < increment || (abs((float)(functionsToGraph.get(i).calculate(j) - functionsToGraph.get(i).calculate(j + increment*0.01)) / (increment*0.01)) < 0.005)) {
            
            stroke(functionPointColor[i]); strokeWeight(functionPointWeight[i]);
            
            point(map(j, xMin, xMax, -width/2, width/2)+width/2, -1*map((float)functionsToGraph.get(i).calculate(j), yMin, yMax, -height/2, height/2)+height/2);
            
          }
          
        }
        
      }
            
      endShape();
    
    }
    
  }
  
  void drawGraph(Function... functions) {
  
    functionsToGraph.clear();
    addFunction(functions);
    
    drawGraph();
    
  }
  
  void drawGraph(float xMinIn, float xMaxIn, float yMinIn, float yMaxIn) {
  
    xMin = xMinIn;
    xMax = xMaxIn;
    yMin = yMinIn;
    yMax = yMaxIn;
    
    drawGraph();
    
  }
  
  void drawGraph(float xMinIn, float xMaxIn, float yMinIn, float yMaxIn, Function functions) {
  
    xMin = xMinIn;
    xMax = xMaxIn;
    yMin = yMinIn;
    yMax = yMaxIn;
    
    drawGraph(functions);
    
  }
  
  void setRange(float xMin, float xMax, float yMin, float yMax, float bigStep, float smallStep) {
  
    this.xMin = xMin;
    this.xMax = xMax;
    this.yMin = yMin;
    this.yMax = yMax;
    this.bigStep = bigStep;
    this.smallStep = smallStep;
    
  }
  
  void drawVAsymptotes(int functionNumber, float... in) {
    
    stroke(graphColors[functionNumber-1]);
  
    for(int i = 0; i < in.length; i++) {
    
      dottedLine(map(in[i], xMin, xMax, -width/2, width/2)+width/2, 0, map(in[i], xMin, xMax, -width/2, width/2)+width/2, height);
      
    }
    
  }
  
  void drawVAsymptotes(float... in) {
  
    for(int i = 0; i < in.length; i++) {
    
      dottedLine(map(in[i], xMin, xMax, -width/2, width/2)+width/2, 0, map(in[i], xMin, xMax, -width/2, width/2)+width/2, height);
      
    }
    
  }
  
  void drawHAsymptotes(int functionNumber, float... in) {
    
    stroke(graphColors[functionNumber-1]);
  
    for(int i = 0; i < in.length; i++) {
    
      dottedLine(0, -1*map(in[i], yMin, yMax, -height/2, height/2)+height/2, width, -1*map(in[i], yMin, yMax, -height/2, height/2)+height/2);
      
    }
    
  }
  
  void drawHAsymptotes(float... in) {
  
    for(int i = 0; i < in.length; i++) {
    
      dottedLine(0, -1*map(in[i], yMin, yMax, -height/2, height/2)+height/2, width, -1*map(in[i], yMin, yMax, -height/2, height/2)+height/2);
      
    }
    
  }
  
  void dottedLine(float x1, float y1, float x2, float y2) {
  
    for(float i = 0; i < 1; i += 0.05) {
    
      line(lerp(x1, x2, i), lerp(y1, y2, i), lerp(x1, x2, i+0.025), lerp(y1, y2, i+0.025));
      
    }
  
  }
  
  void riemann(int functionNum, int mode, float lowerBound, float higherBound, int partitions) {
  
    float[] temp = {mode, lowerBound, higherBound, partitions};
    riemanns.get(functionNum-1).add(temp);
    
  }
  
  void integral(int functionNum, float lowerBound, float higherBound) {
  
    float[] temp = {lowerBound, higherBound};
    integrals.get(functionNum-1).add(temp);
    
  }
  
  void tangent(int functionNum, float xPoint) {
  
    tangents.get(functionNum-1).add(xPoint);
    
  }
  
  //setters
  
  void setGraphStroke(int functionNum, color colorIn) {
  
    graphColors[functionNum-1] = colorIn;
    
  }
  
  void setGraphStrokeWeight(int functionNum, int strokeWeightIn) {
  
    graphStrokeWeights[functionNum-1] = strokeWeightIn;
    
  }
  
  void setRiemannFill(int functionNum, color colorIn) {
  
    riemannFills[functionNum-1] = colorIn;
    
  }
  
  void setRiemannStroke(int functionNum, color colorIn) {
  
    riemannStrokes[functionNum-1] = colorIn;
    
  }
  
  void setRiemannStrokeWeight(int functionNum, int strokeWeightIn) {
  
    riemannStrokeWeights[functionNum-1] = strokeWeightIn;
    
  }
  
  void setRiemannPoints(int functionNum, boolean points) {
  
    riemannPoints[functionNum-1] = points;
    
  }
  
  void setRiemannPointStroke(int functionNum, color pointColor) {
  
    riemannPointColors[functionNum-1] = pointColor;
    
  }
  
  void setRiemannPointWeight(int functionNum, int riemannWeight) {
  
    riemannPointWeights[functionNum-1] = riemannWeight;
    
  }
  
  void setIntegralFill(int functionNum, color colorIn) {
  
    integralFills[functionNum-1] = colorIn;
    
  }
  
  void setTangentStroke(int functionNum, int strokeIn) {
  
    tangentStrokes[functionNum-1] = strokeIn;
    
  }
  
  void setTangentWeight(int functionNum, int strokeWeightIn) {
  
    tangentWeights[functionNum-1] = strokeWeightIn;
    
  }
  
  void setTangentDash(int functionNum, boolean dashStrokeIn) {
  
    tangentDashed[functionNum-1] = dashStrokeIn;
    
  }
  
  void setAsymptoteStroke(int functionNum, color strokeIn) {
  
    asymptoteStroke[functionNum-1] = strokeIn;
    
  }
  
  void setAsymptoteWeight(int functionNum, int strokeWeightIn) {
  
    asymptoteWeights[functionNum-1] = strokeWeightIn;
    
  }
  
  void setVAsymptote(int functionNum, boolean boolIn) {
  
    drawVAsymptote[functionNum-1] = boolIn;
    
  }
  
  void setHAsymptote(int functionNum, boolean boolIn) {
  
    drawHAsymptote[functionNum-1] = boolIn;
    
  }
  
  void setFunctionPoints(int functionNum, boolean boolIn) {
  
    drawPoints[functionNum-1] = boolIn;
  
  }
  
  void setFunctionPointsStroke(int functionNum, color strokeIn) {
  
    functionPointColor[functionNum-1] = strokeIn;
    
  }
  
  void setFunctionPointsWeight(int functionNum, int weightIn) {
  
    functionPointWeight[functionNum-1] = weightIn;
    
  }
  
  void setShowLabels(boolean boolIn) {
  
    showLabels = boolIn;
    
  }
  
  void setShowGridlines(boolean boolIn) {
  
    showGridlines = boolIn;
    
  }
  
  void setTextSize(int textSizeIn) {
  
    textSize = textSizeIn;
    
  }
  
  void setTextStroke(color colorIn) {
  
    textColor = colorIn;
    
  }
  
  void setXMin(float in) {
  
    xMin = in;
    
  }
  
  void setXMax(float in) {
  
    xMax = in;
    
  }
  
  void setYMin(float in) {
  
    yMin = in;
    
  }
  
  void setYmax(float in) {
  
    yMax = in;
    
  }
  
  void setBigStep(float in) {
  
    bigStep = in;
    
  }
  
  void setSmallStep(float in) {
  
    smallStep = in;
    
  }
  
  void setTextDisplayDecimals(int in) {
  
    textDisplayDecimals = in;
    
  }
  
  void setSmallStepWeight(int in) {
  
    smallStepWeight = in;
    
  }
  
  void setBigStepWeight(int in) {
  
    bigStepWeight = in;
    
  }
  
  void setSmallStepStroke(color in) {
  
    smallStepStroke = in;
    
  }
  
  void setBigStepStroke(color in) {
  
    bigStepStroke = in;
    
  }
  
  void setTextStep(float in) {
  
    textStep = in;
    
  }
  
  void setBackgroundColor(color in) {
  
    backgroundColor = in;
    
  }
  
  boolean above0(float f) {
   
    if(abs(f) != f) {
    
      return false;
      
    }
    
    return true;
    
  }
  
}
