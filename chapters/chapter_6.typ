// chapter_5.typ

#import "../template_notes.typ": *

// set up heading numbering
#set heading(numbering: "1.")

// any functions and templating you want for just this chapter can go here

// content
= A Few Integral Applications

== Area Between Curves

#emph-block[
  6.1 Learning Objectives
  - I can extend the idea of area under a curve to area between curves.
]

Suppose we wish to find the area between the curves #math.equation($y=-x^2+4x$, alt: "y equals negative x squared plus 4 x") and #math.equation($y=-x+4$, alt: "y equals negative x plus 4") on #math.equation($[1,4]$, alt: "the closed interval from 1 to 4").

How can we approximate this area?

#align(center)[ #image(
    "figures/chapter_6/motivation.svg",
    alt: "plot showing the shaded region between y equals negative x squared plus 4 x and y equals negative x plus 4 between x equals 1 and 4",
  )
]

To approximate this area, we can draw rectangles between the curves, with bottom edge lined up with the lower curve, and top edge lined up with the upper curve. This is effectively the same as estimating the area under each curve, and taking the difference between them (with the same number of rectangles). Note in the following plot, the first blue rectangle is the same height as the dashed one (because the functions intersect at the left side of this sub-interval), so it is not diplayed.

#align(center)[ #image(
    "figures/chapter_6/motivation2.svg",
    alt: "plot showing the shaded region between y equals negative x squared plus 4 x and y equals negative x plus 4 between x equals 1 and 4 approximated by 6 sub-intervals. if you are actually using the alt text, this is your reminder to email me for more clarity.",
  )
]

We can approximate the area under both curves individually. Then, since the area under the "lower" curve is under both curves, we can subtract it away to get the area that is left.

#definition("Area Between Curves")[
  Let #acc("R") denote the region between continuous functions #math.equation($y=f(x)$, alt: "y equals f of x") and #math.equation($y=g(x)$, alt: "y equals g of x") and between the vertical lines #math.equation($x=a$, alt: "x equals a") and #math.equation($x=b$, alt: "x equals b"), given that #math.equation($f(x)gt.eq g(x)$, alt: "f of x is greater than g of x ") on #math.equation($[a,b]$, alt: " the closed interval from a to b").
  The area of #acc("R") is defined by
  #math.equation(
    $
      A & = (lim_(n arrow infinity) sum_(i = 1)^n f(x^*_i) Delta x) - (lim_(n arrow infinity) sum_(i=1)^n g(x^*_i) Delta x) \
        & = lim_(n arrow infinity) sum_(i = 1)^n (f(x^*_i)-g(x^*_i)) Delta x.
    $,
    alt: "a equals the difference in the limit as n goes to infinity of the sum from i equals 1 to n of f of x star sub i times delta x minus the limit as n goes to infinity of the sum as i goes from 1 to n of g of x star i times delta x. All of this can be simplified to equal the limit as n goes to infinity of the sum from i equals 1 to n of just the difference between f of x star i and g of x star i then times delta x.",
    block: true,
  )
  where we divide #acc("R") into #acc("n") strips of equal width, #math.equation($Delta x = (b-a)/n$, alt: " delta x equals b minus a over n") and height #math.equation($f(x^*_i)-g(x^*_i)$, alt: "f of x star sub i minus g of x star sub i"). Thus, written as a definite integral,
  #math.equation(
    $
      A = integral_a^b (f(x)-g(x)) dif x.
    $,
    alt: "integral from a to b of f of x minus g of x, d x.",
  )
]

#note-block[
  It isn't really necessary to define the area between curves in terms of Reimann sums. So long as you can reason out why the area between curves is the integral of their difference, you are good to go. You do also need to know the limit of Reimann sums definition of the integral, so it is good practice to go over it again here in a slightly more complicated format. Discuss in office hours if you have questions about this formulation.
]

#exercise[
  Find the area between the curves #math.equation($y=-x^2+4x$, alt: "y equals negative x squared plus 4 x") and #math.equation($y=-x+4$, alt: "y equals negative x plus 4") on #math.equation($[1,4]$, alt: "the closed interval from 1 to 4").
]

#my-solution-block[
  - It is good to sketch the region in these cases, and find any intersection points. Remember that we only get the area between curves if the upper function is, well, the upper function (we require #math.equation($f(x)gt.eq g(x)$, alt: "f of x is greater than g of x ") on #math.equation($[a,b]$, alt: " the closed interval from a to b") in the area between curves definition). If the functions changed which one was greater than the other over our interval, we would just break up the interval and compute a few integrals.

  The region #acc("R") was graphed before but is reproduced here for completion:
  #align(center)[ #image(
      "figures/chapter_6/motivation.svg",
      alt: "plot showing the shaded region between y equals negative x squared plus 4 x and y equals negative x plus 4 between x equals 1 and 4",
      width: 40%,
    )
  ]
  Note, on #math.equation($[1,4]$, alt: "the closed interval from 1 to 4") we always have #math.equation($-x^2+4x gt.eq -x+4$, alt: "negative x squared plus 4 x is greater or equal to negative x plus 4"). Then, the area, #acc("A"), between curves is
  #math.equation(
    $
      A & = integral_1^4 (-x^2+4x)-(-x+4) dif x \
        & = integral_1^4 -x^2 + 5x - 4 dif x \
        & = [-1/3 x^3 + 5/2 x^2 -4x ]_1^4 \
        & = -1/3 (4)^3 + 5/2 (4)^2 -4(4) - (-1/3 (1)^3 + 5/2 (1)^2 -4(1) ) \
        & = 19/2
    $,
    alt: "A equals the integral from 1 to 4 of negative x squared plus 4 x minus the sum of negative x and 4, dx. Then on the next line this becomes the integral from 1 to 4 of negative x squared plus 5 x minus 4, d x. then this becomes negative one third x cubed plus 5 halves x squared minus 4 x all evaluated from 1 to 4, which is 19 over 2 (after a little work)",
    block: true,
  )

]

#exercise[
  1. Compute the are between the curves #math.equation($y=-x^2+4x$, alt: "y equals negative x squared plus 4 x") and #math.equation($y=-x+4$, alt: "y equals negative x plus 4") on #math.equation($[0,2]$, alt: "the closed interval from 0 to 2"). _Note: you will need to compute this using 2 definite integrals, make sure to check that the upper function is the first one in your difference._
  2. Convince yourself that the area between curves definition works even when #math.equation($g(x)lt.eq 0$, alt: "g of x is less than or equal to 0"). You should be finding the _unsigned_ area when you do this, what does that tell you about the sign of your answer to a problem asking for the area between curves?
]

Instead of taking vertical rectangles to approximate the area between curves, we might look at horizontal rectangles to find area between curves. This is especially useful in cases where we have more of a "right" and "left" curve instead of an "upper" and "lower" curve, as in the following example.

#example[
  Set up and evaluate an integral to find the area enclosed by #math.equation($x=y^4$, alt: "x equals y to the fourth power") and #math.equation($y^2=2-x$, alt: " y squared equals 2 minus x").
]

#warning-block[
  It is expected that you know how to graph basic functions and similar relations like the ones above, although you may not have been formally trained in a class on these specifically. Please come discuss this in office hours if the hint to "turn your head sideways and think about swapping #acc("x") and #acc("y")" does not help you. It is perfectly reasonably to be a little stuck on this when you first see it, and that is what office hours are there for!
]

#my-solution-block[
  First, we sketch the region to get an idea of what it looks like.
  #align(center)[ #image(
      "figures/chapter_6/ex2.svg",
      alt: "plot to show the shaded region between x equals y to the fourth power and y squared equals 2 minus x. The image shows a parabola opening to the right with vertex at the origin, it is labeled x equals y to the fourth. then another parabola opening to the left with vertex at two, zero is labeled y squared equals 2 minus x. The curves form an asymmetric round ish region between the parabolas from x equals 0 to 2 and it is shaded blue. The parabolas intersect at 1 1 and 1 negative 1. ",
    )
  ]
  We see we have more of a right curve (#math.equation($y^2=2-x$, alt: "y squared equals 2 minus x")) and left curve (#math.equation($x=y^4$, alt: "x equals y to the fourth")). In terms of #acc("x") values, we have #math.equation($x=y^4$, alt: "x equals y to the fourth") and #math.equation($x=2-y^2$, alt: "x equals 2 minus y squared").

  We start by finding where the functions intersect
  #math.equation(
    $
                 y^4 & = 2-y^2 \
           y^4+y^2-2 & = 0 \
      (y^2+2)(y^2-1) & = 0 \
    $,
    alt: "at y to the fourth equals 2 minus y squared. Then the next line gives y to the fourth plus y squared minus 2 equals zero. Then factoring we have y squared plus 2 times y squared minus 1 equals zero",
    block: true,
  )
  since #math.equation($y^2+2$, alt: "y squared plus 2") is never 0, we know they intersect when #math.equation($y^2-1=0$, alt: "y squared minus 1 is zero"). To find the area between them, we can think about turning our head sideways and doing an integral in #acc("y"), where instead of "upper function minus lower function" in the integral, we do "right function minus left function" (since #math.equation($2-y^2 lt.eq y^4$, alt: "2 minus y squared is less than or equal to y to the fourth") for #acc("y") on #math.equation($[-1,1]$, alt: "the closed interval from -1 to 1") our method still applies). Thinking of this as an integral in #acc("y") we have
  #math.equation(
    $
      integral_(-1)^1(2-y^2)-y^4 dif y & = [2y-1/3 y^3 -1/5 y^5 ]_(-1)^1 \
                                       & = 2-1/3-1/5-(-2+1/3+1/5) \
                                       & = 44/15
    $,
    alt: "the integral from minus 1 to 1 of 2 minus y squared minus y to the fourth equals 2 y to minus one third y cubed minus one fifth y to the fifth all evaluated from minus 1 to 1. Which is two minus one third minus one fifth minus the quantity negative 2 plus one third plus one fifth. This equals forty-four fifteenths",
    block: true,
  )
]

#example[
  Set up an integral to find the area enclosed between #math.equation($f(x)=cos(x)$, alt: "f of x equals cosine of x") and #math.equation($g(x)=sin(x)$, alt: "g of x equals sine of x") on #math.equation($[0,2pi]$, alt: "the closed interval from zero to 2 pi").
]

#my-solution-block[
  Sketching the graphs on #math.equation($[0,2pi]$, alt: "the closed interval from zero to 2 pi") and using our knowledge of the unit circle, we know that the functions intersect at #math.equation($x=pi/4, (5pi)/4$, alt: "x equals pi over 4 and 5 pi over 4"). For #math.equation($[0,pi/4]$, alt: "the closed interval from 0 to pi over 4"), #math.equation($f(x) gt.eq g(x)$, alt: "f of x is greater than or equal to g of x") and then on #math.equation($[pi/4,(5pi)/4]$, alt: "the closed interval from pi over 4 to 5 pi over 4"), #math.equation($g(x)gt.eq f(x)$, alt: "g of x is greater than or equal to f of x"), then at last on #math.equation($[(5pi)/4,2pi]$, alt: "the closed interval from 5 pi over 4 to 2 pi"), #math.equation($f(x) gt.eq g(x)$, alt: "f of x is greater than or equal to g of x") once again. So, the area between the curves, #acc("A"), is given by
  #math.equation(
    $
      A = integral_0^(pi/4) (cos(x)-sin(x)) dif x + integral_(pi/4)^((5pi)/4) (sin(x)-cos(x)) dif x + integral_((5pi)/4)^(2 pi) (cos(x)-sin(x)) dif x
    $,
    alt: "a",
    block: true,
  )
]

#tip-block[
  To find the area between 2 curves do the following
  1. Identify the domain, so you have a good idea of what the region is.
  2. Find where the curves intersect: set the equations of the curves equal to each other, and make sure to consider any domain restrictions.
  3. Determine the subintervals over which you need to calculate the area: does the "upper curve" switch over the interval?
  4. Determine whether #math.equation($f(x) gt.eq g(x)$, alt: "f of x is greater than or equal to g of x") or #math.equation($g(x)gt.eq f(x)$, alt: "g of x is greater than or equal to f of x") on each sub-interval.
  5. Set up the integrals for each sub-interval with the greater function minus the smaller function ("upper minus lower" or "right minus left") and evaluate.
  6. Check: We are looking for _unsigned_ area when we ask for the area between the curves, you should always get a positive number!
]

#exercise[
  Set up an integral to find the area of the triangular region enclosed by the points #math.equation($(0,0), (2,2), (5,0)$, alt: " zero zero then two two then five zero") with respect to both #acc("x") and #acc("y").
]

#emph-block[
  6.1 Section Summary:
  - We learned how to find the area between curves, either in the #acc("x") or #acc("y") direction.
]

== Volumes by Cross-Sections, Disks, and Washers
#emph-block[
  6.2 Learning Objectives:
  - I can think of _cross-sectional area_ when calculating the volume of certain shapes using definite integrals.
  - I can use disk or washer method to find the volume of a _solid of revolution_. I can recognize that these methods are related to finding the area between curves.
]

Recall how we find the volume of a cylinder. #math.equation($V=pi r^2 h$, alt: "v equals pi r squared times h"). We essentially get the volume by taking the area of the base, #math.equation($pi r^2$, alt: "pi r squared") and sweeping it along the entire height #acc("h").

#align(center, image(
  "figures/chapter_6/cylinder.svg",
  alt: "a cylinder is outlined with a circular cross-section in the middle labeled with radius, r, and area pi times r squared. To the right the height of the cylinder is labeled h.",
  width: 40%,
))

=== Slicing by Parallel Planes

#definition[
  We define a _cross-section_ of a solid #acc("S") as the plane region formed by intersecting #acc("S") with a plane.
]

We can build a (3 dimensional) solid #acc("S") by taking the same type of cross-section (e.g. squares) for each value of #acc("x"), based on some region in the Cartesian plane.
#align(center, grid(
  columns: 2,
  // 2 means 2 auto-sized columns
  gutter: 2mm,
  image(
    "figures/chapter_6/genericslices.svg",
    alt: "a curve in the x y plane that we form a solid from by forming square shaped slices (sliced perpendicular to the x axis) with side length equal to the function value at each x",
    width: 100%,
  ),
  image(
    "figures/chapter_6/genericsolid.svg",
    alt: "a curve in the x y plane that we form a solid from by forming square shaped slices (sliced perpendicular to the x axis) with side length equal to the function value at each x",
    width: 100%,
  ),
))

Suppose that we partition #math.equation($[a,b]$, alt: " the closed interval from a to b") into subintervals
#math.equation(
  $a=x_0 < x_1 < x_2 < x_3< ... < x_n = b$,
  alt: "a equals x 0 is less than x 1 is less than x 2 is less than x 3 and so on until x sub n is b",
  block: true,
)
where each subinterval has width #math.equation($Delta x$, alt: "delta x"). What is the volume of one slice of our solid? How would we use this to calculate the voluem of the entire solid?

To approximate the volume, we can think of a cross-section with width #math.equation($Delta x$, alt: "delta x"), then its volume is #math.equation($V=("Area of section")Delta x$, alt: "v equals the area of the section times delta x"). Here the area of the cross-section is the area of a square with side length equal to the function value, #math.equation($y=f(x)$, alt: "y equals f of x").

#align(center, image(
  "figures/chapter_6/genericcrosssection.svg",
  alt: "3 d plot of a generic solid s ticks on the x axis at a equals x 0, x 1, x 2, x 3, and so on until x n which is b a thick cross section between x 2 and x 3 shows the volume of the rectangular prism shaped slice used to approximate the volume of the solid",
  width: 70%,
))

As the width of the sub-intervals goes to zero and we add more rectangular prisms together, we get a better approximation of the volume. Once again, the limit of this sum ends up being a definite integral.

#definition[
  If the cross-section of a solid #acc("S") at each point #acc("x") in #math.equation($[a,b]$, alt: "the closed interval from a to b") is a region #math.equation($S(x)$, alt: "s of x") of area #math.equation($A(x)$, alt: "a of x"), where #math.equation($A(x)$, alt: "a of x") is a continuous function of #acc("x"), then
  #math.equation(
    $
      V = integral_a^b A(x) dif x.
    $,
    alt: "volume V equals the integral from a to b of a of x, d x.",
    block: true,
  )
]

#tip-block[
  To calculate the volume of a solid
  1. Sketch a picture of the region and a typical cross-section.
    - Don't overcomplicate the cross-section, it should just be a prism with straight sides and top/bottom (or left/right sides) the same shape with area #math.equation($A(x)$, alt: "a of x") (the area changes for each cross-section but is the same on the 2 faces of the single cross-section). It is never a part of a cone or pyramid or sphere,,,
  2. Find a formula for #math.equation($A(x)$, alt: "a of x").
  3. Find the limits of integration.
  - Think about stretching the face with area #math.equation($A(x)$, alt: "a of x") from one end of the shape to the other, where do you start/stop this process?
  4. Integrate to find the volume, mind your units if applicable.
]

#note-block[
  Typical cross-sectional area formulae:
  - Square: for a square with side length #acc("s"), the area is #math.equation($A=s^2$, alt: "a equals s squared").
  - Triangle: for a triangle with base #acc("b") and height #acc("h"), the area is #math.equation($A=1/2 b h$, alt: "a equals one half b times h").
  - Circle: for a circle with radius #acc("r"), the area is #math.equation($A=pi r^2$, alt: "a equals pi r squared").
  - Semicircle: for a circle with radius #acc("r"), the area is #math.equation($A=1/2 pi r^2$, alt: "a equals one half pi r squared").
]

#example[
  A cone with height 5 cm has a circular base with radius 5 cm. Set up a definite integral and evaluate it to find the volume of the cone.
]
#my-solution-block[
  A sketch of the volume, showing cross-sections, might look like:
  #align(center, image(
    "figures/chapter_6/coneslices.svg",
    alt: "concentric circular slices of the region described in the problem above. The top of the circles lines up with y equals negative x plus 5, the bottom of the circles line up with y equals x minus 5. The slices extend from large circles at x equals 0 towards the viewer at x equals 5.",
    width: 50%,
  ))

  We can think of slices of the cone being circles, with radius equal to the #acc("y") value in #math.equation($y=-x+5$, alt: "y equals negative x plus 5"). This comes from the edge of the cone making the line #math.equation($y=-x+5$, alt: "y equals negative x plus 5") in the #acc("x")-#acc("y") plane.

  Then the area of one slice is #math.equation($A(x)=pi (-x+5)^2$, alt: "a of x is pi times the square of negative x plus 5"). The slices range from #math.equation($x=0$, alt: "x equals 0") to #math.equation($x=5$, alt: "x equals 5").

  The definite integral we need to evaluate is
  #math.equation(
    $
      V & = integral_0^5 pi (-x+5)^2 dif x \
        & = pi integral_0^5 x^2-10x+25 dif x \
        & = pi[1/3 x^3 - 5 x^2 + 25 x]_0^5 \
        & = pi[1/3 (5)^3 - 5 (5)^2 + 25(5)] \
        & = 125/3 pi
    $,
    alt: "v equals the integral from 0 to 5 of pi times negative x plus 5 all squared, d x. this is the same as the integral from 0 to 5 of x quared minus 10 x plus twenty-five, d x. this becomes pi times the quantity one third x cubed minus 5 x squared plus twenty five x all evaluated from 0 to 5. this then becomes pi times the quantity one third times 5 cubed minus 5 times 5 squared plus twenty five times x. which is one hundred twenty-five thirds times pi",
    block: true,
  )

  We are told the distances are measured in centimeters, so the final answer is the volume is #math.equation($(125 pi)/3$, alt: "one hundred twenty-five pi thirds") centimeters cubed.

  There are 2 checks we can do at the end of the problem. First, our solution is positive, which we expect because volume is positive. Second, this is a cone and we do know the volume formula for a cone:
  #math.equation($V = 1/3 pi r^2 h = 1/3 pi (5)^2 (5) = 125/3 pi.$, alt: "v equals one third pi times r squared times h, this becomes one hundred twenty-five thirds times pi.", block: true)This is the same thing we got from integrating, so our answer is correct!
]

#exercise[
  Derive the formula for the volume of a cone using similar techniques as above. _Hint: the line connecting the points_ #math.equation($(0,r)$, alt: "zero comma r") _and_ #math.equation($(h,0)$, alt: "h comma 0") _will be useful._
]

#example[
  Set up an integral to find the volume of the given solid. The base of the solid is the region bounded by #math.equation($x=0, x=4, "and" y=x^2$, alt: "x equals 0, x equals 4, and y equals x squared"). The cross-sections are perpendicular to the #acc("x")-axis and are squares.

  Set up an integral to find the volume of the given solid with the same base and square cross-sections, but the cross-sections are perpendicular to the #acc("y")-axis.

]

#my-solution-block[
  Sketch the region first, then
  #align(center, image(
    "figures/chapter_6/example2slices.svg",
    alt: "slices of a solid where the base is bounded by x equals 0, x equals 4, and y equals x squared. The slices are perpendicular to the x axis and are square shaped, the side length of a square slice at an x is x squared. The slices stack horizontally up to x equals 4.",
  ))
  Where we see the side length of the square cross-sections is #math.equation($x^2$, alt: "x squared"), and the slices fill the space from #math.equation($x=0" to "x=4$, alt: "x equals 0 to x equals 4") so the definite integral we need to evaluate for the volume is
  #math.equation(
    $
      V = integral_0^4 (x^2)^2 dif x = integral_0^4 x^4 dif x.
    $,
    alt: "integral from 0 to 4 of the square of x squared, d x which is the integral from 0 to 4 of x to the fourth, d x.",
    block: true,
  )

  For the second part of the problem, we are now looking at the region below:
  #align(center, image(
    "figures/chapter_6/example2bslices.svg",
    alt: "slices of a solid where the base is bounded by x equals 0, x equals 4, and y equals x squared. The slices are perpendicular to the y axis now and are square shaped. The slices stack vertically up to y equals 16.",
  ))
  Notice that the slices now go from bottom to top, when the cross-sections are perpendicular to #acc("y")-axis, we want to use an integral in #acc("y"). This region has square cross-sections where we can think about "right curve minus left curve" to find the side length of those squares:

  #align(center, image(
    "figures/chapter_6/example622b.svg",
    alt: "a plot of the base of the shape described above. The curve y equals x squared is labeled with x equals the square root of y, and the vertical line x equals 4 is labeled too. Between these is shaded in. A horizontal line midway up the shape highlights that the side lengths of the cross-sections for this problem have length s equals 4 minus the square root of y",
    width: 50%,
  ))

  Here the square side stretches between #math.equation($x=sqrt(y)$, alt: "x equals square root of y") and the vertical line #math.equation($x=4$, alt: "x equals 4"). So, the side length is #math.equation($s=4-sqrt(y).$, alt: "s equals 4 minus the square root of y.") This solid is formed up of slices from #math.equation($y=0 "to" y = 16$, alt: "y equals 0 to y equals 16"). Then the integral we solve for the volume is
  #math.equation(
    $V= integral_0^(16) (4-sqrt(y))^2 dif x.$,
    alt: "v equals the integral from 0 to 16 of 4 minus square root of y squared, d x.",
    block: true,
  )
]

#exercise[
  Predict if you think the volumes of the two solids above will be the same or different. Then, evaluate each integral and compare. Were you correct or incorrect in your prediction? If you were incorrect, that is okay, but try to identify why/what went wrong.
]

#remark-block[
  In these problems, the variable of integration is determined based on whether the cross-sections are perpendicular to the #acc("x")-axis or #acc("y")-axis.
  - Slices perpendicular to the #acc("x")-axis (where slices stack from one #acc("x") value to another) mean the variable of integration is #acc("x").
  - Slices perpendicular to the #acc("y")-axis (where slices stack from one #acc("y") value to another) mean the variable of integration is #acc("y").
]

#property[Cavalieri's Principle][
  Solids with equal _height_ and identical _cross-sectional area_ at each height have the same volume.
]

#remark-block[
  These 2 cylinder-like solids have the same volume by Cavalieri's Principle
  #align(center, image(
    "figures/chapter_6/cavalierisprincip.svg",
    alt: "a cylinder is outlined with a circular cross-section in the middle labeled with radius, r, and area pi times r squared. To the right the height of the cylinder is labeled h. To the right of this entire drawing is another similar drawing, however from bottom to top the almost-cylinder goes up and to the left and then when it reaches the shaded cross-section it goes back up and to the right. It looks like a pipe with a 120 degree bend in it. The straight distance from the top to bottom face of this bent cylinder is also h and the cross-sectional area is also pi r squared.",
  ))
]

#exercise[
  Set up an integral to find the volume of the given solid. The base of the solid is the region bounded by the graphs of #math.equation($y=sqrt(x)" and "y=x/2$, alt: "y equals the square root of x and y equals x over 2"). The cross-sections perpendicular to the #acc("x")-axis are equilateral triangles.
]

=== Solids of Revolution: The Disk method

#definition[
  A _solid of revolution_ is the solid generated by rotating (or revolving) a plane region about an axis in its plane.
]

Consider the function #math.equation($y=sqrt(x)$, alt: "y equals square root of x") on #math.equation($[0,4]$, alt: "the closed interval from 0 to 4"). Imagine rotating it all the way around the #acc("x")-axis to form a solid:

#align(center, grid(
  columns: 2,
  // 2 means 2 auto-sized columns
  gutter: 2mm,
  image(
    "figures/chapter_6/introtorevs.svg",
    alt: "graph of y equals square root of x from 0 to 4, the region between the function and the x-axis is shaded",
    width: 95%,
  ),
  image(
    "figures/chapter_6/introtorevs2.svg",
    alt: "graph of y equals square root of x from 0 to 4, the region between the function and the x-axis is shaded",
    width: 95%,
  ),
))

#note-block[If we wish to find the volume of this solid, we have only added one step to our process from before. After that we have the same type of problem as the ones with the cross-sections. We have to build the 2-D region we want to form the solid from.
  1. Sketch the function and its reflection about the axis you are told to revolve around. This with the domain give you the 2-D region we go from.
  2. Imagine circular cross-sections that are perpendicular to the same axis you just used.
  3. Continuing as before the cross-sections will _always_ be circular and have radius equal to the function value.
]

We can make this more specific below.
#theorem[Volume by Disks for Rotation about the #acc("x")-axis][
  To find the volume of a solid formed by rotating a function #math.equation($y=f(x)$, alt: "y equals f of x") on #math.equation($[a,b]$, alt: "the closed interval from a to b") about the #acc("x")-axis first note that the area of each cross-section is #math.equation($A(x) = pi (f(x))^2$, alt: "capital a of x is pi times f of x squared"), then the volume is
  #math.equation(
    $V=integral_a^b A(x) dif x = integral_a^b pi (f(x))^2 dif x.$,
    alt: "v equals the integral from a to b of capital a of x, d x which is just the integral from a to b of pi times the square of f of x, d x.",
    block: true,
  )
]

#exercise[
  Write a similar statement to the one above for rotating a function #math.equation($y=f(x)$, alt: "y equals f of x") for #acc("y") values in #math.equation($[a,b]$, alt: "the closed interval from a to b") about the #acc("y")-axis. _Hint: careful with the variables you use in the expression. The variable of integration should be the variable used in the integrand._
]

#example[
  Set up an integral to find the volume of the solid generated by revolving the region in the first quadrant bounded above by #math.equation($y=-2x^2+2$, alt: "y equals negative 2 x squared plus 2") around the #acc("x")-axis.

  Set up an integral to find the volume when revolving this same region around the #acc("y")-axis.
]

#my-solution-block[
  The solid looks like
  #align(center, image(
    "figures/chapter_6/firstdiskex.svg",
    alt: "view of y equals negative 2 x squared plus 2 and its reflection across the x axis from the side. At this angle we can see disks perpendicular to the x axis with radius lining up with the curves from x equals 0 to x equals 1.",
    width: 50%,
  ))

  However, this might be difficult to draw by hand. An alternative is to just draw the curve in 2-D, its reflection, and a single cross-section to help visualize the radius of the disks. This looks like
  // TODO: adjust ellipses to be dashed in the back in this figure
  #align(center, image(
    "figures/chapter_6/firstdiskexsketch.svg",
    alt: "view of y equals negative 2 x squared plus 2 and its reflection across the x axis. there is a single disk sketched around x equals 0 point 2 5 that has radius lining up with the curves.",
    width: 50%,
  ))

  Then, we need to find where the curve hits the #acc("x")-axis. Sometimes we can tell from the graph we draw, sometimes we have to solve for it
  #math.equation(
    $
           -2x^2+2 & = 0 \
         -2(x^2-1) & = 0 \
      -2(x+1)(x-1) & = 0 \
                 x & = 1,-1
    $,
    alt: "solving negative 2 x squared plus 2 equals 0 by factoring to negative 2 times x plus 1 times x minus 1 equals 0. so x is 1 or negative 1.",
    block: true,
  )
  Since we are looking in the first quadrant, #math.equation($x=1$, alt: "x equals 1") is where this intersection happens (This is one of the bounds for the integral later). The area of the circular cross-section is #math.equation($pi r^2 = pi (-2x^2+2)^2$, alt: "pi r squared or rather, pi times negative 2 x squared plus 2 squared"). Thus, the integral we need is
  #math.equation(
    $V = integral_0^1 pi (-2x^2+2)^2 dif x.$,
    alt: "v equals the integral from 0 to 1 of pi times negative 2 x squared plus 2 squared.",
  )
]

#exercise[Evaluate the integral above to find the volume of the solid.]
#exercise[Set up and solve an integral to find the volume when revolving this same region around the #acc("y")-axis.]

#theorem[Volume by Disks for Rotation about the #acc("y")-axis][
  To find the volume of a solid formed by rotating a function #math.equation($y=f(x)$, alt: "y equals f of x") (and solving for #math.equation($x=f^(-1)(y)$, alt: "x equals f inverse of y")) for #acc("x") in #math.equation($[a,b]$, alt: "the closed interval from a to b") and #acc("y") between #math.equation($f(a)$, alt: "f of a") and #math.equation($f(b)$, alt: "f of b") about the #acc("y")-axis first note that the area of each cross-section is #math.equation($A(y) = pi (f^(-1)(y))^2$, alt: "capital a of x is pi times f inverse of x squared"), then the volume is
  #math.equation(
    $V=integral_(f(a))^(f(b)) A(y) dif y = integral_(f(a))^(f(b)) pi (f^(-1)(y))^2 dif y.$,
    alt: "v equals the integral from a to b of capital a of x, d x which is just the integral from a to b of pi times the square of f of x, d x.",
    block: true,
  )
]
In other words,
#note-block[
  *Finding the Volume of a Solid of Revolution: Disk Method*
  1. Sketch both the region that is being rotated and the axis of revolution.
  2. Determine the variable of integration. Integration is performed with respect to the axis that is perpendicular to the slices.
  3. Determine the limits of integration. They must match the variable of integration!
  4. Derive a formula for the radius of the disk.
  5. Integrate. Remember units in your final answer when applicable.
]

=== Solids of Revolution: The Washer Method
Note that we can only use the disk method if the cross-sections of the solid of revolution are circles. This means that there is no space gap between the region and the axis of revolution. What if there is a gap between the region and the axis of revolution?

#example[
  Set up an integral to find the volume of the solid generated by revolving the region in the first quadrant bounded by #math.equation($y = x^2$, alt: "y equals x squared") and #math.equation($y = sqrt(x)$, alt: "y equals square root x") around the #acc("x")-axis.
]
#my-solution-block[
  // TODO: adjust ellipses to be dashed in the back in this figure
  #align(center + horizon, grid(
    columns: 2,
    // 2 means 2 auto-sized columns
    gutter: 2mm,
    image(
      "figures/chapter_6/firstwasherexsketch.svg",
      alt: "a sketch of the curves y equals x squared and y equals square root x from x equals 0 to 1. The reflections across the vertical axis are also shown, and a single cross-section around x equals one half is drawn. The cross-section is 2 concentric rings with radii little r and big R lining up with y equals x squared and y equals square root x respectively.",
      width: 90%,
    ),
    image(
      "figures/chapter_6/washercrosssection.svg",
      alt: "a sketch of 2 concentric circles. The smaller circle has radius little r and the larger circle has radius big R. The space between them is shaded blue, making a washer or flat donut shape.",
      width: 60%,
    ),
  ))
  We note the curves intersect at #coord("1", "1"). There are a few ways to think about this problem, but for now let's go back to thinking about the area of the cross-section and integrating that from 0 to 1 in #acc("x"). For the cross-sections, the area is a circle with radius #math.equation($R=sqrt(x)$, alt: "big r equals square root of x") minus the area of a smaller circle with area #math.equation($r=x^2$, alt: "little r equals x squared"). This region is sketched above in blue, and is known as a washer (as in the metal bit used with a nut and bolt that has the same shape). The area of the full region is the difference in areas between the 2 circles. That is, #math.equation($A(x)=pi R(x)^2 - pi r(x)^2$, alt: "a of x is pi times big R of x squared minus pi times little r of x squared.").
  Then, integrating along the axis perpendicular to the cross-sectional area, we see the volume is
  #math.equation(
    $
      V & = integral_0^1 A(x) dif x \
        & = integral_0^1 pi R(x)^2 - pi r(x)^2 dif x \
        & = pi integral_0^1 [(sqrt(x))^2-(x^2)^2] dif x \
        & = pi integral_0^1 x - x^4 dif x
    $,
    alt: "the volume is the integral from 0 to 1 of a of x, d x which is the integral from 0 to 1 of pi times big R of x squared minus pi times little r of x squared, d x. which is pi times the integral from 0 to 1 of the square root of x squared minus x squared squared. which is pi times the integral from 0 to 1 of x minus x to the fourth, d x.",
    block: true,
  )
]

#exercise[Evaluate the integral above.]

#theorem[Volume by Washers for Rotation about the #acc("x")-axis][
  For a solid of rotation formed by rotating a region around the #acc("x")-axis where you have the required bounds and radii in terms of #acc("x"), the volume is
  #math.equation(
    $V = integral_a^b A(x) dif x = pi integral_a^b [(R(x))^2 - (r(x))^2] dif x$,
    alt: "v equals is the integral from a to b of capital of x, d x. this is equal to pi times the integral from a to b of captial r of x squared minus little r of x squared, d x",
    block: true,
  )
]
#theorem[Volume by Washers for Rotation about the #acc("y")-axis][
  For a solid of rotation formed by rotating a region around the #acc("y")-axis where you have the required bounds and radii in terms of #acc("y"), the volume is
  #math.equation(
    $V = integral_a^b A(y) dif y = pi integral_a^b [(R(y))^2 - (r(y))^2] dif y$,
    alt: "v equals is the integral from a to b of capital of y, d y. this is equal to pi times the integral from a to b of captial r of y squared minus little r of y squared, d y",
    block: true,
  )
]

In other words,
#note-block[
  *Finding the Volume of a Solid of Revolution: Washer Method*
  1. Sketch both the region that is being rotated and the axis of revolution.
  2. Determine the variable of integration. Integration is performed with respect to the axis that is perpendicular to the slices.
  3. Determine the limits of integration. They must match the variable of integration!
  4. Derive a formula for the radii of the washer: #math.equation($R(x)" and "r(x)" (or "R(y)" and "r(y)" respectively)"$, alt: "captial r of x and little r of x, or captial r of y and little r of y respectively").
    - These are found by finding the distances of each curve from the axis of revolution. For more, see area between curves section.
  5. Integrate. Remember units in your final answer when applicable.
]

#example[
  Set up an integral to find the volume of the solid generated by revolving the region bounded by #math.equation($y=x^(2/3)$, alt: "y equals x to the two thirds power"), the #acc("x")-axis, and #math.equation($x=8$, alt: "x equals 8")
  #set enum(numbering: "a)")
  + around the #acc("x")-axis
  + around the #acc("y")-axis
  + around the line #math.equation($y=6$, alt: "y equals 6").
]
#my-solution-block[
  #set enum(numbering: "a)")
  + Sketching the region and an idea of the volume we make by rotating around the #acc("x")-axis we see the cross-sections are disks.
    #align(center, image("figures/chapter_6/washerex3x.svg", alt: "todo"))
    Thus, the volume can be found with the disk method: by thinking of the cross-sectional area as a bunch of circles perpendicular to the #acc("x")-axis, from #math.equation($x=0" to "x=8$, alt: " x equals 0 to x equals 8").
    #math.equation(
      $
        V & = pi integral_0^8 (R(x))^2 dif x \
          & = pi integral_0^8 (x^(2/3))^2 dif x \
          & = pi integral_0^8 x^(4/3) dif x
      $,
      alt: "todo",
      block: true,
    )
  + Sketching the region and an idea of the volume we make by rotating around the #acc("y")-axis we see the cross-sections are washers now.
    #align(center, image("figures/chapter_6/washerex3y.svg", alt: "todo"))
    Notice that we need to express the radii in terms of #acc("y") now, the large radius is always #math.equation($R(y)=8$, alt: "capital r of y equals 8") and the small radius is #math.equation($r(y)= y^(3/2)$, alt: "little r of y equals y to the three halves") which we got from solving the original equation for #acc("x"). Lastly, we note the solid fills space for #acc("y") in #closedint("0", "4"). Then the volume integral will be
    #math.equation(
      $
        V & = integral_0^4 pi[(R(y))^2 - (r(y))^2] dif y \
          & = integral_0^4 pi[(8)^2 - (y^(3/2))^2] dif y \
          & = pi integral_0^4 [64 - y^3] dif y \
      $,
      alt: "v equals the integral from 0 to 4 of pi times the quantity capital r of y squared minus little r of y squared, d y. Which is the integral from 0 to 4 of pi times the quantity 8 squared minus y to the power of three halves squared, d y. which is pi times the integral from 0 to 4 of 64 minus y cubed, dy.",
      block: true,
    )
  + Sketching the region and the horizontal line #math.equation($y=6$, alt: "y equals 6") we have
    #align(center, image("figures/chapter_6/washerex3y6.svg", alt: "todo"))
    // todo: shade the region we are rotating in these figures
    We first find the radii, or the distance from #math.equation($y=6$, alt: "y equals 6") to the edges of the region. Note #math.equation($R$, alt: "big R") is always 6, and #math.equation($r=6-x^(2/3)$, alt: "little r is 6 minus x to the two thirds"). Then the area of each washer as a function of #acc("x") is
    #math.equation(
      $
        A(x) & = pi R^2 - pi r^2 \
             & = pi [6^2 - (6-x^(2/3))^2]
      $,
      alt: "A of x is pi times the quantity big r squared minus little r squared. Then plugging in the rs this equals pi times the quantity 6 squared minus 6 minus x to the two thirds all squared",
      block: true,
    )
    The washers fill the space from #math.equation($x = 0" to "x=8$, alt: "x equals 0 to x equals 8"), so the integral we use is #math.equation(
      $ V= pi integral_0^8 [6^2 - (6-x^(2/3))^2] dif x $,
      alt: "v equals pi times the integral from 0 to 8 of 6 squared minus 6 minus x to the two thirds all squared, d x.",
      block: true,
    )
]

#emph-block[
  6.2 Section Summary:
  - We learned how to find the volumes of solids rotated about different horizontal and vertical lines.
  - We used the area of a cross-section to develop disk and washer method for finding volumes of the solids of rotation.
]

== Volumes by Cylindrical Shells
#emph-block[
  6.3 Learning Objectives:
  - I can use shell method to find the volume of solids of rotation.
  - I can identify scenarios when shell or washer method is required for a problem based on its geometry.
]

#exercise[
  Spend 5-10 minutes trying to set up the integral for using washer method for the following problem. Then stop and analyze why this is particularly difficult.

  Rotate the region enclosed by the #acc("x")-axis and the parabola #math.equation($y = 3x - x^2$, alt: "y equals 3 x minus x squared") around the line #math.equation($x = -1$, alt: "x equals negative 1").
]
#my-solution-block[
  Note the plot of this region below
  #align(center, image("figures/chapter_6/shellmotivation.svg", alt: "todo"))
  helps illustrate the difficulty. Simply put: We have no easy way of determining the radii, #math.equation($r" and "R$, alt: "little r and big r").
]

In the disk and washer method, the cross-sections taken were circular and perpendicular to the axis of rotation. We will introduce a new method, using a new shape for cross-sections, which are taken parallel to the axis of rotation.

Consider the following cookie cutters.
#align(center, image(
  "figures/chapter_6/cookiecutter.jpg",
  alt: "a set of metal circular cookie cutters of varying sizes, all stacked within one another.",
  width: 45%,
))

For the next method, we will think of finding the area of a concentric shells making up the shape, then integrating from the center of the shells to the edge to "add" up all the areas that go into the volume.



#emph-block[
  6.3 Section Summary:
]

== Work
#emph-block[
  6.4 Learning Objectives:
]

#emph-block[
  6.4 Section Summary:
]
