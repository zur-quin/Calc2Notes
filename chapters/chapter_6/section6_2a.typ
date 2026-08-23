// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template

// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(6)
#set document(title: "Section 6.2")
#context counter(heading).step(level: 2)

// any functions and templating you want for just this chapter can go here

== Volumes by Cross-Sections, Disks, and Washers
#emph-block[
  6.2a Learning Objectives:
  - I can think of _cross-sectional area_ when calculating the volume of certain shapes using definite integrals.
]

Recall how we find the volume of a cylinder. #math.equation($V=pi r^2 h$, alt: "v equals pi r squared times h"). We essentially get the volume by taking the area of the base, #math.equation($pi r^2$, alt: "pi r squared") and sweeping it along the entire height #acc("h").

#figure(image(
  "figures/cylinder.svg",
  alt: "a cylinder is outlined with a circular cross-section in the middle labeled with radius, r, and area pi times r squared. To the right the height of the cylinder is labeled h.",
  width: 40%,
))

=== Slicing by Parallel Planes

#definition[
  We define a _cross-section_ of a solid #acc("S") as the plane region formed by intersecting #acc("S") with a plane.
]

We can build a (3 dimensional) solid #acc("S") by taking the same type of cross-section (e.g. squares) for each value of #acc("x"), based on some region in the Cartesian plane.

#figure()[
  #box(
    image(
      "figures/genericslices.svg",
      alt: "a curve in the x y plane that we form a solid from by forming square shaped slices (sliced perpendicular to the x axis) with side length equal to the function value at each x",
      width: 35%,
    ),
  )#h_html(10mm)
  #box(
    image(
      "figures/genericsolid.svg",
      alt: "a curve in the x y plane that we form a solid from by forming square shaped slices (sliced perpendicular to the x axis) with side length equal to the function value at each x",
      width: 35%,
    ),
  )
]

Suppose that we partition #math.equation($[a,b]$, alt: " the closed interval from a to b") into subintervals
#math.equation(
  $a=x_0 < x_1 < x_2 < x_3< ... < x_n = b$,
  alt: "a equals x 0 is less than x 1 is less than x 2 is less than x 3 and so on until x sub n is b",
  block: true,
)
where each subinterval has width #math.equation($Delta x$, alt: "delta x"). What is the volume of one slice of our solid? How would we use this to calculate the voluem of the entire solid?

To approximate the volume, we can think of a cross-section with width #math.equation($Delta x$, alt: "delta x"), then its volume is #math.equation($V=("Area of section")Delta x$, alt: "v equals the area of the section times delta x"). Here the area of the cross-section is the area of a square with side length equal to the function value, #math.equation($y=f(x)$, alt: "y equals f of x").

#figure(image(
  "figures/genericcrosssection.svg",
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
  #figure(image(
    "figures/coneslices.svg",
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
  #figure(image(
    "figures/example2slices.svg",
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
  #figure(image(
    "figures/example2bslices.svg",
    alt: "slices of a solid where the base is bounded by x equals 0, x equals 4, and y equals x squared. The slices are perpendicular to the y axis now and are square shaped. The slices stack vertically up to y equals 16.",
  ))
  Notice that the slices now go from bottom to top, when the cross-sections are perpendicular to #acc("y")-axis, we want to use an integral in #acc("y"). This region has square cross-sections where we can think about "right curve minus left curve" to find the side length of those squares:

  #figure(image(
    "figures/example622b.svg",
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
  #figure(image(
    "figures/cavalierisprincip.svg",
    alt: "a cylinder is outlined with a circular cross-section in the middle labeled with radius, r, and area pi times r squared. To the right the height of the cylinder is labeled h. To the right of this entire drawing is another similar drawing, however from bottom to top the almost-cylinder goes up and to the left and then when it reaches the shaded cross-section it goes back up and to the right. It looks like a pipe with a 120 degree bend in it. The straight distance from the top to bottom face of this bent cylinder is also h and the cross-sectional area is also pi r squared.",
  ))
]

#exercise[
  Set up an integral to find the volume of the given solid. The base of the solid is the region bounded by the graphs of #math.equation($y=sqrt(x)" and "y=x/2$, alt: "y equals the square root of x and y equals x over 2"). The cross-sections perpendicular to the #acc("x")-axis are equilateral triangles.
]


#emph-block[
  6.2a Section Summary:
  - We found the area of cross-sections and set up integrals to find the volume of solids.
]

