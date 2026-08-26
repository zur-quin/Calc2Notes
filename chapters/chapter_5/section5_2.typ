// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template
// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(5)

#context {
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [#counter(heading).update(4)
      = Review of 1225
      #set document(title: "Section 5.2")]
  }
}

// #showybox(
//   frame: (
//     border-color: red.darken(50%),
//     title-color: red.lighten(60%),
//     body-color: red.lighten(80%),
//   ),
//   title-style: (
//     color: black,
//     weight: "regular",
//     align: center,
//   ),
//   shadow: (
//     offset: 3pt,
//   ),
//   title: "Red-ish showybox with separated sections!",
//   lorem(20),
//   lorem(12),
// )

// skip 5.1 with below line
#context counter(heading).step(level: 2)

== The Definite Integral
In this section, we will primarily review Riemann sums. This is because Riemann sums are used to derive many of the techniques used in the upcoming sections.

#emph-block[
  5.2 Learning Objectives:
  - I can approximate the (signed/unsigned) area under a curve using different types of Reimann sums.
  - I can use more rectangles/sub-intervals to get a more accurate approximation.
  - I know the definition of a definite integral in terms of the limit or Reimann sums.
  - I can rewrite a limit of Reimann sums as a definite integral, and back.
]

=== Motivation
Suppose we wanted to calculate the area of a shaded region #acc("R") that lies above the #acc("x")-axis, below the graph of #math.equation($f(x) = -x^2 + 16$, alt: "f of x equals negative x squared plus 16", block: false), and between the vertical lines #math.equation($x = 0$, alt: "x equals 0", block: false) and #math.equation($x = 4$, alt: "x equals 4", block: false).

#figure(image(
  "figures/motivation.svg",
  alt: "a picture of the region R below the curve f of x equals negative x squared plus 16 from x equals 0 to x equals 4",
))

How might we estimate this area with rectangles?
#figure(image(
  "figures/motivation2.svg",
  alt: "a picture of the region R below the curve f of x equals negative x squared plus 16 from x equals 0 to x equals 4. On top of the region R there are 4 blue rectangles each with height matching the left corner of the rectangle to the curve. The top right corner of each rectangle lies outside the region R. The rectangles are labeled A sub 1, A sub 2, A sub 3, A and A sub 4",
))

The area can be estimated by summing the areas of the rectangles #math.equation($R approx A_1+A_2+A_3+A_4$, alt: "R approximately equals a sub 1 plus a sub 2 plus a sub 3 plus a sub 4").

#remark-block[
  - We also aligned the left side of the rectangles to the curve, but we could have used any point between the left and right sides of the rectangles to get the height of the rectangles.
    - For example, right end point and midpoint are both popular choices.
  - We used rectangles instead of another shape, because the area of a rectangle is easy to find. We only need width and height, and the height is just a single function evaluation.
    - For example, the area of #math.equation($A_1$, alt: "A sub 1") is #math.equation($A_1 = (1)(f(0)) = (1)(16) = 16$, alt: "A sub 1 equals 1 times f of 0 which is just 1 times 16 which is just 16.").
    - Another shape you may encounter (outside this class) is the trapezoid, using the left AND right end points of the domain to get the 2 required heights for a trapezoid.
  - We used 4 rectangles, but any number of rectangles can be used.
    - Using more (smaller) rectangles improves the accuracy of our estimated area. See figure below.

  #figure(image(
    "figures/motivation3.svg",
    alt: "a picture of the region R below the curve f of x equals negative x squared plus 16 from x equals 0 to x equals 4. On top of the region R there are many thin blue rectangles each with height matching the left corner of the rectangle to the curve. The top right corner of each rectangle lies outside the region R.",
  ))
  - In the above cases, the approximate areas have been overestimates of the actual area. In general, it is not possible to tell when we have an over or underestimate by looking at a picture. However, there are some cases we can always tell.
    - If the function is decreasing, then the right Riemann sums will underestimate and the left Riemann sums will overestimate.
    - If the function is increasing, then the right Riemann sums will overestimate and the left Riemann sums will underestimate.
    - If the function changes between increasing and decreasing, then we cannot guarantee one way without more information.
]
#exercise[
  1. Draw a few pictures of different increasing and decreasing functions and some left/right Reimann sums to get a feel for why they are always over/underestimates.
  2. Does concavity have anything to do with the approximations being over or underestimates of the area under the curve?
]

#example[
  Suppose you want to find the _signed_ area of the region #acc("R") that lies between the #acc("x")-axis, the graph of #math.equation($f(x)=ln(x)$, alt: "f of x equals natural log of x"), and between the vertical lines #math.equation($x=0.5$, alt: "x equals 0 point 5") and #math.equation($x=4.5$, alt: "x equals 4 point 5"). The exact signed area would look something like this.
  #figure(image(
    "figures/ex521.svg",
    alt: "a picture of the region R below the curve f of x equals natural log of x from x equals 0 point 5 to x equals 4 point 5. The shaded part on the left of x equals 1 is under the x-axis and is labeled negative area. The shaded part on the right of x = 1 is labeled positive area.",
  ))


  Approximate the signed area (as described above) to two decimal places with 4 rectangles using:
  1. Left-hand Riemann sum
  2. Right-hand Reimann sum
  3. Mid-point Riemann sum

]
#my-solution-block[
  1. The left hand Reimann sum looks like the below image. Note, the area of the first rectangle is negative, because it is below the #acc("x")-axis.
  #figure(image(
    "figures/ex521-left.svg",
    alt: "a picture of the region R below the curve f of x equals natural log of x from x equals 0 point 5 to x equals 4 point 5. On top of the region R there are 4 blue rectangles each with height matching the left corner of the rectangle to the curve. The rectangles are labeled with the function values on the left side of the rectangles, -0.69325 0.40544, 0.91634, 1.2575 respectively.",
  ))
  Thus,

  #math.equation(
    $
      L_4 & = A_1 + A_2 + A_3 + A_4 \
          & = (1)(ln(0.5)) + (1)(ln(1.5)) + (1)(ln(2.5)) + (1)(ln(3.5)) \
          & = underbrace(1, Delta x)(ln(0.5) + ln(1.5) + ln(2.5) + ln(3.5)) \
          & approx 1.88
    $,
    alt: "a few lines work for finding the left Reimann sum with 4 rectangles. Specifically: L sub 4 is equal to the sum of A sub 1 plus A sub 2 plus A sub 3 plus A sub 4. Then the next line fills in the base times height for each area, 1 times natural log of 0 point 5 plus 1 times natural log of 1 point 5 plus 1 times natural log of 2 point 5 plus 1 times natural log of 3 point 5. the next line factors the width, delta x, out so we have 1 times the sum of a sub 1 plus A sub 2 plus A sub 3 plus A sub 4. Lastly we get this is approximately equal to one and eighty-eight hundredths.",
  )

  2. The right hand Reimann sum looks like the below image. Note, the area of the first rectangle is *no longer negative*, because it is now above the #acc("x")-axis.
  #figure(image(
    "figures/ex521-right.svg",
    alt: "a picture of the region R below the curve f of x equals natural log of x from x equals 0 point 5 to x equals 4 point 5. On top of the region R there are 4 blue rectangles each with height matching the right corner of the rectangle to the curve. The rectangles are labeled with the function values on the right side of the rectangles, 0.40544, 0.91634, 1.2575, 1.50415 respectively.",
  ))
  Thus,

  #math.equation(
    $
      R_4 & = (1)(ln(1.5)) + (1)(ln(2.5)) + (1)(ln(3.5)) + (1)(ln(4.5) \
          & = underbrace(1, Delta x)(ln(1.5) + ln(2.5) + ln(3.5) + ln(4.5)) \
          & approx 4.08
    $,
    alt: "a few lines work for finding the right Reimann sum with 4 rectangles. Specifically: R sub 4 is equal to the sum of the width times height given by 1 times natural log of 1 point 5 plus 1 times natural log of 2 point 5 plus 1 times natural log of 3 point 5 plus 1 times natural log of 4 point 5. Lastly we get this is approximately equal to 4 point 0 8",
  )

  3. The mid-point Reimann sum looks like the below image. Note, the first rectangle has height 0 since #math.equation($ln(1)=0$, alt: "natural log of 1 is 0", block: false).
  #figure(image(
    "figures/ex521-mid.svg",
    alt: "a picture of the region R below the curve f of x equals natural log of x from x equals 0 point 5 to x equals 4 point 5. On top of the region R there are 4 blue rectangles each with height matching the mid-point left and right of the rectangle to the curve. The rectangles are labeled with the function values on the right side of the rectangles, 0, 0.69308, 1.09863, 1.38637 respectively. Note the first rectangle has height 0 and almost makes it look like we are only using 3 rectangles.",
  ))
  Thus,

  #math.equation(
    $
      M_4 & = (1)(ln(1)) + (1)(ln(2)) + (1)(ln(3)) + (1)(ln(4) \
          & approx 3.18
    $,
    alt: "a few lines work for finding the mid-point Reimann sum with 4 rectangles. Specifically: M sub 4 is equal to the sum of the width times height given by 1 times natural log of 1 plus 1 times natural log of 2 plus 1 times natural log of 3 plus 1 times natural log of 4. Lastly we get this is approximately equal to 3 point 1 8",
  )
]

#remark-block[
  - The actual signed area is 3.11 rounded to 2 decimal places.
  - This does not give the (unsigned) area (ignoring the fact that some parts are negative).
  - We can find the unsigned area (counting all area as positive) by using #math.equation($-f(x)$, alt: "negative f of x") for the rectangle height for the points where #math.equation($f(x)$, alt: "f of x") is negative.
  - As before, using more rectangles can give us a more accurate estimate of the areas (signed and unsigned). _Let's push this idea to the limit..._
]

#definition[
  Let #acc("f") be a function defined on the interval #math.equation($[a,b]$, alt: "a to b inclusive"). We can divide the interval #math.equation($[a,b]$, alt: "a to b inclusive") into #acc("n") sub-intervals of equal width #math.equation($Delta x = (b-a)/n$, alt: "delta x equals b minus a all over n"). Let #math.equation($x_0=a,x_1,x_2,...,x_(n-1),x_n=b$, alt: "x sub 0 equals a, then x 1 then x2 on and on until x sub n-1 then x sub n is b") be the endpoints of these sub-intervals. Let #math.equation($x^*_1, x^*_2,..., x^*_n$, alt: "x star sub 1 then x star sub 2 on and on until x star sub n") be any sample points in these sub-intervals such that #math.equation($x^*_i$, alt: "x star sub i") is in the sub-interval #math.equation($[x_(i-1),x_i]$, alt: "x sub i minus 1 to x sub i, inclusive"). Then the *definite integral of #acc("f") from #acc("a") to #acc("b")* is defined as
  #math.equation(
    $
      integral_a^b f(x) dif x = lim_(n arrow infinity) sum_(i=1)^n f(x^*_i) Delta x
    $,
    alt: "the integral from a to b of f of x dx is defined as the limit as n goes to infinity of the sum from i equals 1 to n of f evaluated at x star sub i then times delta x",
    block: true,
  )
]
#remark-block[
  - The definite integral #math.equation($integral_a^b f(x) dif x$, alt: "the integral from a to b of f of x dx ") represents the *exact _signed_ area* under the curve #math.equation($y=f(x)$, alt: "y equals f of x") between #acc("a") and #acc("b").
  - The integral symbol is a stretched "S" shape with the *lower* and *upper bound* above and below the symbol respectively ("S" is for sum). The #math.equation($dif x$, alt: "d x") at the end closes the integral but also indicates that we are integrating with respect to #acc("x").
    - Eventually we will have other variables or multiple variables we are integrating over, so this is important for clarity.
    - The variable we are integrating over says where the "base" of the rectangles will be.
  - As we saw in the previous examples, as we use more rectangles to approximate the area, we get closer to the exact signed area we are looking for. In the definition of the definite integral, #acc("n") is the number of rectangles, and when we take the limit as #acc("n") goes to infinity we are sub dividing into more and more rectangles to approximate the area. Eventually the rectangles approach "infinitesimally thin rectangles," that add to the exact area we are looking for.
  - We have been talking about left-hand, right-hand, and mid-point Reimann sums, but we could also use a point 10% of the way into the sub-interval, or 30% into the sub-interval, or anywhere inside each sub-interval. We write this using #math.equation($x^*_i$, alt: "x star sub i") to indicate a generic choice of left/right/mid-point sample point in the #acc("i")-th rectangle. The #acc("i") here is the most important part, since it means this point depends on which rectangle we are in. The star is also important, since without it the definition would imply it dentoes the end-points of the sub-intervals.
    - You could theoretically use a different point for each rectangle, but we won't. Keep it simple and consistent. Use all left end points or all right end points etc depending on your choice for a problem.
  - You should become comfortable translating between a definite integral and a limit of Reimann sums and back again. An example is below, come to office hours to discuss how starting at a Reimann sum does not lead to 1 correct definite integral, but many possible ones.
]

#example[
  Write #math.equation($ integral_1^3 root(3, x^2+2) dif x $, alt: "the integral from 1 to 3 of the cube root of x squared plus 2 d x", block: true) as a limit of Reimann sums.
]

#my-solution-block[
  We are not told to use a left or right Reimann sum specifically, so we can choose either. We will do a right-hand Reimann sum here (Practice on your own: the left one). The *bounds* on the integral give us *#math.equation($a=1$, alt: "a equals 1")* and *#math.equation($b=3.$, alt: "b equals 3")* We can also clearly see the function is #math.equation($f(x)=root(3, x^2+2).$, alt: "f of x equals the cube root of x squared plus 2 ", block: true) The next thing to do is to write the width of the rectangles in terms of #acc("n"): #math.equation($Delta x = (b-a)/n = 2/n.$, alt: "Delta x is b minus a all over n which is 2 over n", block: true) Lastly, we need a way to represent the right-end points of the rectangles in terms of #acc("i") and #acc("n"), and we will try to find a pattern for this. The *left* side of the first rectangle is at 1, and the next is #math.equation($Delta x$, alt: "Delta x") to the right of it, the next is another #math.equation($Delta x$, alt: "Delta x") to the right, and so on. The *right* sides of the rectangles skip 1 and start at #math.equation($1+Delta x$, alt: "1 plus delta x"), then add another #math.equation($Delta x$, alt: "Delta x") every step. Repeated addition is multiplication so
  #math.equation($x^*_i = 1 + (2i)/n.$, alt: "x star sub i equals 1 plus the quantity 2 i over n", block: true)
  All that's left is to put it altogether
  #math.equation(
    $
      integral_1^3 root(3, x^2+2) dif x = lim_(n arrow infinity) sum_(i = 1)^n root(3, (1 + (2i)/n)^2+2) (2/n).
    $,
    alt: "the integral from 1 to 3 of the cube root of x squared plus 2 d x is equal to the limit as n goes to infinity of the sum from i equals 1 to n of the product of cube root of the sum of x squared plus 2 and 2/n",
    block: true,
  )
]

#example[
  Interpret #math.equation($lim_(n arrow infinity) sum_(i=1)^n (2(3+(3i)/n))/(1+(3+(3i)/n )^2 ) (3/n)$, alt: "the limit as n goes to infinity of the sum from i equals 1 to n of 2 times the sum of 3 and 3i over n all over the sum of 1 and 3 plus 3 i over n squared then everything in the sum notation times 3 over n. If you're using alt text and this is confusing please email me.", block: true)
  as a definite integral.
]

#my-solution-block[
  For #math.equation($Delta x$, alt: "delta x") we are looking for a number over #acc("n") to show up, sometimes multiplied by #acc("i"). We see a #math.equation($3/n$, alt: "three over n") in a few places that fits this bill, so we will say #math.equation($Delta x = 3/n$, alt: "delta x equals 3 over n"). Then, we try to identify #math.equation($x^*_i$, alt: "x star sub i"), the sample points. These have #math.equation($Delta x i$, alt: "delta x times i") in them, we can pick just the #math.equation($(3i)/n$, alt: "3 i over n") or the #math.equation($3 + (3i)/n$, alt: "3 plus 3 i over n"). Either way we can get *a* correct answer. Let's pick #math.equation($x^*_i=3 + (3i)/n$, alt: "x star sub i equals 3 plus 3 i over n"), then *in this case* we must have #math.equation($f(x^*_i) = (2x^*_i)/(1+(x^*_i)^2)$, alt: "f of x star sub i equals 2 times x star sub i all over 1 plus x star sub i squared", block: true) (by replacing the #math.equation($3 + (3i)/n$, alt: "3 plus 3 i over n") with #math.equation($x^*_i$, alt: "x star sub i")). Lastly, all the sample points #math.equation($x^*_i$, alt: "x star sub i") "start" at 3 plus something: so #math.equation($a=3$, alt: "a equals 3"). Then since #math.equation($Delta x = 3/n$, alt: "delta x equals 3 over n") we know the width of the interval is 3 (see numerator), so #math.equation($b=6$, alt: "b equals 6"). Putting that all together
  #math.equation(
    $lim_(n arrow infinity) sum_(i=1)^n (2(3+(3i)/n))/(1+(3+(3i)/n )^2 ) (3/n) = integral_3^6 (2x)/(1+x^2)dif x.$,
    alt: "the limit as n goes to infinity of the sum from i equals 1 to n of 2 times the sum of 3 and 3i over n all over the sum of 1 and 3 plus 3 i over n squared then everything in the sum notation times 3 over n equals the integral from 3 to 6 of 2x over the sum of 1 and x squared d x",
    block: true,
  )
]
#exercise[
  Redo the above problem but using #math.equation($Delta x = (3i)/n$, alt: "Delta x equals 3 i over n"). Notice how this changes the function and the bounds of the integral. To check your answer plug in both integrals into an integral calculator (#link("https://www.integral-calculator.com/") or a TI 84 or more should do it). You know you are correct if you get the same number for both!
]


#property("Properties of the Definite Integral")[
  Let #acc("f") and #acc("g") be continuous functions. Let #acc("c") be a constant.
  #set list(spacing: 1.5em)
  - #math.equation(
      $display(integral_b^a f(x) dif x = - integral_a^b f(x) dif x)$,
      alt: "the integral from b to a of f of x d x is the negative integral from a to b of f of x d x",
    )
  - #math.equation($display(integral_a^a f(x) dif x = 0)$, alt: "the integral from a to a of f of x d x is 0")
  - #math.equation(
      $display(integral_a^b c dif x= c(b-a))$,
      alt: "the integral from a to b of c d x is c times the difference of b minus a",
    )
  - #math.equation(
      $display(integral_a^b f(x) plus.minus g(x) dif x = integral_a^b f(x) dif x plus.minus integral_a^b g(x) dif x)$,
      alt: "the integral from a to b of f of x plus or minus g of x d x is the integral from a to b of f of x d x plus or minus the integral from a to b of g of x d x",
    )
  - #math.equation(
      $display(integral_a^b c f(x) dif x = c integral_a^b f(x) dif x)$,
      alt: "the integral from a to b of c times f of x d x is c times the integral from a to b of f of x d x",
    )
  - #math.equation(
      $display(integral_a^b f(x) dif x + integral_b^c f(x) dif x = integral_a^c f(x) dif x)$,
      alt: "the integral from a to b of f of x d x plus the integral from b to c of f of x d x is the integral from a to c of f of x d x",
    )
  - If #math.equation($f(x) gt.eq 0$, alt: "f of x is greater than or equal to 0") for all #math.equation($a lt.eq x lt.eq b$, alt: "x between a and b, inclusive"), then #math.equation($display(integral_a^b f(x) dif x gt.eq 0)$, alt: "the integral from a to b of f of x d x is greater than or equal to 0.")
  - If #math.equation($f(x) gt.eq g(x)$, alt: "f of x is greater than or equal to g of x") for all #math.equation($a lt.eq x lt.eq b$, alt: "x between a and b, inclusive"), then #math.equation($display(integral_a^b f(x) dif x gt.eq integral_a^b g(x)dif)x$, alt: "the integral from a to b of f of x d x is greater than or equal to the integral from a to b of g of x d x")
  - If #math.equation($m lt.eq f(x) lt.eq M$, alt: "f(x) is between little m and capital M, inclusive") for all #math.equation($a lt.eq x lt.eq b$, alt: "x between a and b, inclusive"), then  #math.equation($display(m(b-a) lt.eq integral_a^b f(x) dif x lt.eq M(b-a))$, alt: "the integral from a to b of f of x d x is between little m times the quantity b-a and capital M times the quantity b-a")
]

#exercise[
  1. Rewrite in your own words what each property above is saying/does. You may have to think about some of these a while, and you may discuss in office hours.
  2. Justify/Prove the third property using a sketch and a few words. (#math.equation(
      $integral_a^b c dif x= c(b-a)$,
      alt: "the integral from a to b of c d x is c times the difference of b minus a",
    ))
  3. Justify to yourself why the penultimate property is true. (If #math.equation($f(x) gt.eq g(x)$, alt: "f of x is greater than or equal to g of x") for all #math.equation($a lt.eq x lt.eq b$, alt: "x between a and b, inclusive"), then #math.equation($integral_a^b f(x) dif x gt.eq integral_a^b g(x)dif x$, alt: "the integral from a to b of f of x d x is greater than or equal to the integral from a to b of g of x d x"))
  4. Using the above properties prove the last property. (If #math.equation($m lt.eq f(x) lt.eq M$, alt: "f(x) is between little m and capital M, inclusive") for all #math.equation($a lt.eq x lt.eq b$, alt: "x between a and b, inclusive"), then  #math.equation($m(b-a) lt.eq integral_a^b f(x) dif x lt.eq M(b-a)$, alt: "the integral from a to b of f of x d x is between little m times the quantity b-a and capital M times the quantity b-a")) This should be done in 2 steps since there are 2 inequalities here. _This is not trivial, so spend a bit of time thinking and working on this. The process of doing this yourself should deepen your understanding of what is going on here, if you get stuck, bring your work to office hours to discuss._
]
#emph-block[
  5.2 Section Summary:
  - We discussed area beneath a curve, and discussed Reimann sums as ways to approximate the area.
  - We discussed the difference between signed and unsigned area.
  - We took the limit of Reimann sums to get the exact _signed_ area, this became our definition of the definite integral.
  - We practiced translating between Reimann sums and definite integrals.
  - We looked at several properties of integrals.
]
