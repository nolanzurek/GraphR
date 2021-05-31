# GraphR

A graph visualizer inspired by [manim](https://github.com/3b1b/manim). Uses [mxparser](https://github.com/mariuszgromada/MathParser.org-mXparser) for function parsing.

![example with integral, riemann sum, and automatically detected vertical aysmptotes](https://user-images.githubusercontent.com/42624568/115458287-c5e91600-a1e2-11eb-845d-60f1d342784d.png)

## Features

- Graphs up to 6 explicit functions (an arbitrary number I picked because I didn't expect more functions to be needed)
- Adjustable color and thickness for function lines
- Adjustable window, step, and gridline parameters
- Various calculus-based visuaizations, including tangent lines, riemann sums, and integrals
- Automatic asymtote, intercept, and extrenum rendering (can be toggled on/off or added manually)


## Features to be added

- Unlimited number of functions
  - Object-based functions instead of addFunction method
- Parametric function graphing
- Polar graphing
- Vector field visualization
- Better aymptote and extrenum detection, efficient intersection detection
- Various animations (!)
  - Interpolation between two functions (linear and cosine)
  - "Draw-on" effect for graphs
  - "Draw-on" effect for all other elements (gridlines, asymptotes, tangent lines, etc)

## Usage

GraphR is a Processing class, so it must be present in the processing sketch you want to use. This is most commonly done by having a main GraphR driver class that contains the draw function, inside which is a constructor for a GraphR object. Adding and changing functions (and all the other visualizations) are done using methods.

As Functions are objects (from mxparser), they must be declared to be passed as parameters.

### Methods
(input variables are self-explanatory)

#### Core methods

`void drawGraph(Function... functions)`
Constructor (window defaults to -10 < x < 10 and -10 < y 10)

`void drawGraph(float xMinIn, float xMaxIn, float yMinIn, float yMaxIn)`
Constructor (draws coordinate grid with specified window, but no functions)

`void drawGraph(float xMinIn, float xMaxIn, float yMinIn, float yMaxIn, Function functions)`
Constructor

`void setRange(float xMin, float xMax, float yMin, float yMax, float bigStep, float smallStep)`
Sets the appearence of the window (`bigStep` sets the spacing of major gridlines and `smallStep` sets the spacing of minor gridlines)
  
`void riemann(int functionNum, int mode, float lowerBound, float higherBound, int partitions)`
Draws a riemann sum on function `functionNum` (starts at 1 in the order they were added) between `lowerBound` and `higherBound` with `partitions` partitions. If mode is set to
- 1: Left riemann sum
- 2: right riemann sum
- 3: middle riemann sum
- Anything else: doesn't draw the sum at all

`void integral(int functionNum, float lowerBound, float higherBound)`
Fills in the area under the graph on function `functionNum` between `lowerBound` and `higherBound`

`void tangent(int functionNum, float xPoint)`
Draws a line tangent to function `functionNum` at point `xPoint`

`void drawVAsymptotes(int functionNumber, float... in)`
`void drawVAsymptotes(float... in)`
`void drawHAsymptotes(int functionNumber, float... in)`
`void drawHAsymptotes(float... in)`
Manually draws horizontal and vertical asymptotes as specified. If a function number is provided, the asymptote will become "tied" to that function and adopt its color. `in` represents the x-value of the asymptote for vertical asymptotes and the y-value for horizontal asymptotes

#### Setters / Mutators

Most (eventually all) visual parameters can be changed using a setter method. 

Methods starting with `setGraph`, `setRiemann`, `setIntegral`, `setTangent`, `setAymptote`, and `setFunctionPoints` take two parameters: the function it is to be applied to (type `Function`) and the value it is to change. If the method ends with `stroke` or `fill`, that value will be of type `color`; elsewise, the value will be of type `int`.

The three exceptions to the last rule are the methods `setVAsymptote`, `setHAsymptote`, and `setFunctionPoints`, which toggle the appearence of vertical asymptotes, horizontal asymptotes, and extrema / 0 points on the function passed as their first parameter; their second value will be of type `boolean`

Here is a list of all the setter methods so far:
```
void setGraphStroke(int functionNum, color colorIn)
void setGraphStrokeWeight(int functionNum, int strokeWeightIn)
void setRiemannFill(int functionNum, color colorIn)
void setRiemannStroke(int functionNum, color colorIn)
void setRiemannStrokeWeight(int functionNum, int strokeWeightIn)
void setRiemannPoints(int functionNum, boolean points)
void setRiemannPointStroke(int functionNum, color pointColor)
void setRiemannPointWeight(int functionNum, int riemannWeight)
void setIntegralFill(int functionNum, color colorIn)
void setTangentStroke(int functionNum, int strokeIn)
void setTangentWeight(int functionNum, int strokeWeightIn)
void setTangentDash(int functionNum, boolean dashStrokeIn)
void setAsymptoteStroke(int functionNum, color strokeIn)
void setAsymptoteWeight(int functionNum, int strokeWeightIn)
void setVAsymptote(int functionNum, boolean boolIn)
void setHAsymptote(int functionNum, boolean boolIn)
void setFunctionPoints(int functionNum, boolean boolIn)
void setFunctionPointsStroke(int functionNum, color strokeIn)
void setFunctionPointsWeight(int functionNum, int weightIn)
void setShowGridlines(boolean boolIn)
void setTextSize(int textSizeIn)
void setTextStroke(color colorIn)
void setTextDisplayDecimals(int in)
void setXMin(float in)
void setXMax(float in)
void setYMin(float in)
void setYmax(float in)
void setBigStep(float in)
void setSmallStep(float in)
void setSmallStepWeight(int in)
void setBigStepWeight(int in)
void setSmallStepStroke(color in)
void setBigStepStroke(color in)
void setTextStep(float in)
void setBackgroundColor(color in)
```
