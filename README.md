# GraphR

A graph visualizer inspired by [manim](https://github.com/3b1b/manim). Uses [mxparser](https://github.com/mariuszgromada/MathParser.org-mXparser) for function parsing.

![example with integral and riemann sum](https://user-images.githubusercontent.com/42624568/115448741-4bff5f80-a1d7-11eb-8de2-dea5b0bf3cfa.png)

## Features

- Graphs up to 6 explicit functions (an arbitrary number I picked because I didn't expect more functions to be needed)
- Adjustable color and thickness for function lines
- Adjustable window, step, and gridline parameters
- Various calculus-based visuaizations, including tangent lines, riemann sums, and integrals
- Automatic asymtote and extrenum rendering (can be toggled on/off or added manually)


## Features to be added

- Unlimited number of functions
  - Object-based functions instead of addFunction method
- Parametric function graphing
- Better aymptote and extrenum detection, intersection detection
- Various animations (!)
  - Interpolation between two functions (linear and cosine)
  - "Draw-on" effect for graphs
  - "Draw-on" effect for all other elements (gridlines, asymptotes, tangent lines, etc)

## Usage

GraphR is a Processing class, so it must be present in the processing sketch you want to use. This is most commonly done by having a main GraphR driver class that contains the draw function, inside which is a constructor for a GraphR object. Adding and changing functions (and all the other visualizations) are done using methods.

As Functions are objects (from mxparser), they must be declared to be passed as parameters.

### Methods
(input variables are self-explanatory)

`void drawGraph(Function... functions)`
Constructor (window defaults to -10 < x < 10 and -10 < y 10)

`void drawGraph(float xMinIn, float xMaxIn, float yMinIn, float yMaxIn)`
Constructor (draws coordinate grid with specified window, but no functions)

`void drawGraph(float xMinIn, float xMaxIn, float yMinIn, float yMaxIn, Function functions)`
Constructor

`void setRange(float xMin, float xMax, float yMin, float yMax, float bigStep, float smallStep)`
Sets the appearence of the window (`bigStep` sets the spacing of major gridlines and `smallStep` sets the spacing of minor gridlines)
  
`void riemann(int functionNum, int mode, float lowerBound, float higherBound, int partitions)`
Draws a riemann sum on function `functionNum` (starts at 1 in the order they were added) between `lowerBound` and `higherBound` with `partitions` partitions
If mode is set to
- 1: Left riemann sum
- 2: right riemann sum
- 3: middle riemann sum
- Anything else: doesn't draw the sum at all

`void integral(int functionNum, float lowerBound, float higherBound)`
Fills in the area under the graph on function `functionNum` between `lowerBound` and `higherBound`

`void tangent(int functionNum, float xPoint)`
Draws a line tangent to function `functionNum` at point `xPoint`
