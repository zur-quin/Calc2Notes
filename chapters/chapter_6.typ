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

#note-block[
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
  alt: "todo",
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
    width: 70%,
  ),
  image(
    "figures/chapter_6/genericsolid.svg",
    alt: "a curve in the x y plane that we form a solid from by forming square shaped slices (sliced perpendicular to the x axis) with side length equal to the function value at each x",
    width: 70%,
  ),
))

Suppose that we partition #math.equation($[a,b]$, alt: " the closed interval from a to b") into subintervals
#math.equation(
  $a=x_0 < x_1 < x_2 < x_3< ... < x_n = b$,
  alt: "a equals x 0 is less than x 1 is less than x 2 is less than x 3 and so on until x sub n is b",
  block: true,
)
where each subinterval has width #math.equation($Delta x$, alt: "delta x"). What is the volume of one slice of our solid? How would we use this to calculate the voluem of the entire solid?





#emph-block[
  6.2 Section Summary:
]

== Volumes by Cylindrical Shells
#emph-block[
  6.3 Learning Objectives:
]

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
