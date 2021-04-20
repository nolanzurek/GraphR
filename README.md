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

### Methods

**void drawGraph(Function... functions)**
  Constructor (window defaults to -10 < x < 10 and -10 < y 10)

**void drawGraph(float xMinIn, float xMaxIn, float yMinIn, float yMaxIn)**
  Constructor (draws coordinate grid with specified window, but no functions)

**void drawGraph(float xMinIn, float xMaxIn, float yMinIn, float yMaxIn, Function functions)**
  Constructor
