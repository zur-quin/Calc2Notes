// chapter_5.typ

#import "../template_notes.typ": *

// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(4)

// any functions and templating you want for just this chapter can go here

// content
= Review of 1225

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

#align(center)[ #image(
    "figures/chapter_5/motivation.svg",
    alt: "a picture of the region R below the curve f of x equals negative x squared plus 16 from x equals 0 to x equals 4",
  )
]

How might we estimate this area with rectangles?
#align(center)[ #image(
    "figures/chapter_5/motivation2.svg",
    alt: "a picture of the region R below the curve f of x equals negative x squared plus 16 from x equals 0 to x equals 4. On top of the region R there are 4 blue rectangles each with height matching the left corner of the rectangle to the curve. The top right corner of each rectangle lies outside the region R. The rectangles are labeled A sub 1, A sub 2, A sub 3, A and A sub 4",
  )
]

The area can be estimated by summing the areas of the rectangles #math.equation($R approx A_1+A_2+A_3+A_4$, alt: "R approximately equals a sub 1 plus a sub 2 plus a sub 3 plus a sub 4").

#remark-block[
  - We also aligned the left side of the rectangles to the curve, but we could have used any point between the left and right sides of the rectangles to get the height of the rectangles.
    - For example, right end point and midpoint are both popular choices.
  - We used rectangles insteads of another shape, because the area of a rectangle is easy to find. We only need width and height, and the height is just a single function evaluation.
    - For example, the area of #math.equation($A_1$, alt: "A sub 1") is #math.equation($A_1 = (1)(f(0)) = (1)(16) = 16$, alt: "A sub 1 equals 1 times f of 0 which is just 1 times 16 which is just 16").
    - Another shape you may encounter (outside this class) is the trapezoid, using the left AND right end points of the domain to get the 2 required heights for a trapezoid.
  - We used 4 rectangles, but any number of rectangles can be used.
    - Using more (smaller) rectangles improves the accuracy of our estimated area. TODO label figure and reference it here

  #align(center)[ #image(
      "figures/chapter_5/motivation3.svg",
      alt: "a picture of the region R below the curve f of x equals negative x squared plus 16 from x equals 0 to x equals 4. On top of the region R there are many thin blue rectangles each with height matching the left corner of the rectangle to the curve. The top right corner of each rectangle lies outside the region R.",
    )
  ]
  - In the above cases, the approximate areas have been overestimates of the actual area. In general, it is not possible to tell when we have an over or under estimate by looking at a picture. However, there are some cases we can always tell.
    - If the function is decreasing, then the right Riemann sums will underestimate and the left Riemann sums will overestimate.
    - If the function is increasing, then the right Riemann sums will overestimate and the left Riemann sums will underestimate.
    - If the function changes between increasing and decreasing, then we cannot guarantee one way without more information.
]
#exercise[
  1. Draw a few pictures of different increasing and decreasing functions and some left/right Reimann sums to get a feel for why they are always over/underestimates.
  2. Does concavity have anything to do with the approximations being over or under estimates of the area under the curve?
]

#example[
  Suppse you want to find the _signed_ area of the region #acc("R") that lies between the #acc("x")-axis, the graph of #math.equation($f(x)=ln(x)$, alt: "f of x equals natural log of x"), and between the vertical lines #math.equation($x=0.5$, alt: "x equals 0 point 5") and #math.equation($x=4.5$, alt: "x equals 4 point 5"). The exact signed area would look something like this.
  #align(center)[ #image(
      "figures/chapter_5/ex521.svg",
      alt: "a picture of the region R below the curve f of x equals natural log of x from x equals 0 point 5 to x equals 4 point 5. The shaded part on the left of x equals 1 is under the x axis and is labeled negative area. The shaded part on the right of x = 1 is labeled positive area.",
    )
  ]


  Approximate the signed area (as described above) to two decimal places with 4 rectangles using:
  1. Left-hand Riemann sum
  2. Right-hand Reimann sum
  3. Mid-point Riemann sum

]
#my-solution-block[
  1. The left hand Reimann sum looks like the below image. Note, the area of the first rectangle is negative, because it is below the #acc("x")-axis.
  #align(center)[ #image(
      "figures/chapter_5/ex521-left.svg",
      alt: "a picture of the region R below the curve f of x equals natural log of x from x equals 0 point 5 to x equals 4 point 5. On top of the region R there are 4 blue rectangles each with height matching the left corner of the rectangle to the curve. The rectangles are labeled with the function values on the left side of the rectangles, -0.69325 0.40544, 0.91634, 1.2575 respectively.",
    )
  ]
  Thus,

  #math.equation(
    $
      L_4 & = A_1 + A_2 + A_3 + A_4 \
          & = (1)(ln(0.5)) + (1)(ln(1.5)) + (1)(ln(2.5)) + (1)(ln(3.5)) \
          & = underbrace(1, Delta x)(ln(0.5) + ln(1.5) + ln(2.5) + ln(3.5)) \
          & approx 1.88
    $,
    alt: "a few lines work for finding the left reimann sum with 4 rectangles. Specifically: L sub 4 is equal to the sum of A sub 1 plus A sub 2 plus A sub 3 plus A sub 4. Then the next line fills in the base times height for each area, 1 times natural log of 0 point 5 plus 1 times natural log of 1 point 5 plus 1 times natural log of 2 point 5 plus 1 times natural log of 3 point 5. the next line factors the width, delta x, out so we have 1 times the sum of a sub 1 plus A sub 2 plus A sub 3 plus A sub 4. Lastly we get this is approximately equal to one point eight eight",
  )

  2. The right hand Reimann sum looks like the below image. Note, the area of the first rectangle is *no longer negative*, because it is now above the #acc("x")-axis.
  #align(center)[ #image(
      "figures/chapter_5/ex521-right.svg",
      alt: "a picture of the region R below the curve f of x equals natural log of x from x equals 0 point 5 to x equals 4 point 5. On top of the region R there are 4 blue rectangles each with height matching the right corner of the rectangle to the curve. The rectangles are labeled with the function values on the right side of the rectangles, 0.40544, 0.91634, 1.2575, 1.50415 respectively.",
    )
  ]
  Thus,

  #math.equation(
    $
      R_4 & = (1)(ln(1.5)) + (1)(ln(2.5)) + (1)(ln(3.5)) + (1)(ln(4.5) \
          & = underbrace(1, Delta x)(ln(1.5) + ln(2.5) + ln(3.5) + ln(4.5)) \
          & approx 4.08
    $,
    alt: "a few lines work for finding the right reimann sum with 4 rectangles. Specifically: R sub 4 is equal to the sum of the width times height given by 1 times natural og of 1 point 5 plus 1 times natural log of 2 point 5 plus 1 times natural log of 3 point 5 plus 1 times natural log of 4 point 5. Lastly we get this is approximately equal to 4 point 0 8",
  )

  3. The mid-point Reimann sum looks like the below image. Note, the first rectangle has height 0 since #math.equation($ln(1)=0$, alt: "natural log of 1 is 0", block: false).
  #align(center)[ #image(
      "figures/chapter_5/ex521-mid.svg",
      alt: "a picture of the region R below the curve f of x equals natural log of x from x equals 0 point 5 to x equals 4 point 5. On top of the region R there are 4 blue rectangles each with height matching the mid point left and right of the rectangle to the curve. The rectangles are labeled with the function values on the right side of the rectangles, 0, 0.69308, 1.09863, 1.38637 respectively. Note the first rectangle has height 0 and almost makes it look like we are only using 3 rectangles.",
    )
  ]
  Thus,

  #math.equation(
    $
      M_4 & = (1)(ln(1)) + (1)(ln(2)) + (1)(ln(3)) + (1)(ln(4) \
          & approx 3.18
    $,
    alt: "a few lines work for finding the mid point reimann sum with 4 rectangles. Specifically: M sub 4 is equal to the sum of the width times height given by 1 times natural og of 1 plus 1 times natural log of 2 plus 1 times natural log of 3 plus 1 times natural log of 4. Lastly we get this is approximately equal to 3 point 1 8",
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

// skip 5.3 and 5.4
#context counter(heading).step(level: 2)
#context counter(heading).step(level: 2)

== The Substitution Rule
Recall that we linked the definite integral and area under a curve to the concept of the antiderivative. We did this using the fundamental theorem of Calculus.

#emph-block[
  5.5 Learning Objectives:
  - I can use a substitution to undo the chain rule when antidifferentiating.
  - I can change the bounds of a definite integral when I make a substitution.
  - I can try a few different things for my substitution before giving up.
]

#theorem[The Fundamental Theorem of Calculus, Pt I][
  Let #acc("f") be a function defined on the interval #math.equation($[a,b]$, alt: "a to b inclusive"). Let #math.equation($F$, alt: "capital f") be the function defined, for all #acc("x") in #math.equation($[a,b]$, alt: "the closed interval from a to b"), by
  #math.equation(
    $
      F(x) = integral_a^x f(t) dif t.
    $,
    alt: " capital f of x equals the integral from a to x of lowercase f of t d t",
  )
  Then #math.equation($F$, alt: "capital f") is continuous on #math.equation($[a,b]$, alt: "the closed interval from a to b") and differentiable on #math.equation($(a,b)$, alt: "the open interval from a to b") and #math.equation($F'(x) = f(x)$, alt: "the derivative of capital f of x is lowercase f of x") for all #acc("x") in #math.equation($(a,b)$, alt: "the open interval from a to b") so #math.equation($F$, alt: "capital f") is an antiderivative of #math.equation($f$, alt: "lowercase f").
]

#corollary[The Fundamental Theorem of Calculus, Pt II][
  If #acc("f") is a continuous function defined on #math.equation($[a,b]$, alt: "the closed interval from a to b") and #math.equation($F$, alt: "capital f") is an antiderivative of #acc("f") in #math.equation($[a,b]$, alt: "the closed interval from a to b") then
  #math.equation(
    $integral_a^b f(t) dif t = F(b) - F(a).$,
    alt: " the definite integral from a to b of f of t d t is equal to captial f of b minus capital f of a",
    block: true,
  )
]

This allows us to start evaluating definite integrals without sorrying about limits of sums. Instead, to find the area under a curve, we just need an antiderivative of it.

#exercise[
  Find an antiderivative for the following functions. Check your work by taking the derivative of your answer.
  1. #math.equation($f(x) = x^3 - 2x + 1$, alt: "f of x equals x cubed minus 2 x plus 1")
  2. #math.equation($g(x) = (x+1)^10$, alt: "g of x equals x plus 1 all to the power of ten")
]

This is fine for simple functions that we can recognize that we are looking at the derivative of something. As functions get more complicated, we need more clever techniques for antideriving/integrating.

#theorem[The Substitution Rule (for Indefinite Integrals)][
  If #math.equation($u=g(x)$, alt: "u equals g of x") is a differentiable function whose range is an interval #acc("I"), and #acc("f") is continuous on #acc("I"), then
  #math.equation(
    $integral f(g(x)) g'(x) dif x = integral f(u) dif u.$,
    alt: "the integral of f of g of x times g prime of x, d x is equal to the integral of f of u, d u.",
    block: true,
  )
  Note: The Substitution Rule is the "inverse" of the Chain Rule (for derivatives).
]

#remark-block[
  There are two main things we look for when deciding to use a substitution, although there may be other less common applications.
  - First, we use a substitution when we see funciton composition, or a function plugged into another function.
  - Another use case is if the derivative (up to scaling by a constant) of part of the integrand also appears in the integrand.
]

#tip-block[
  To integrate #math.equation($integral f(g(x)) g'(x) dif x$, alt: "the integral of f of g of x times g prime of x, d x ."):
  1. Substitute #math.equation($u=g(x)$, alt: "u equals g of x") and #math.equation($dif u=g'(x)dif x$, alt: "d u equals g prime of x d x")
  2. Integrate with respect to #acc("u").
  3. Replace #acc("u") with #math.equation($g(x)$, alt: "g of x") in the result.
]

#example[
  Find #math.equation($integral (2x+1)/(x^2+x+3) dif x$, alt: "2 x plus 1 all over x squared plus x plus 3, d x", block: true)
]

#my-solution-block[
  We notice that #math.equation($dv(, x)(x^2 + x + 3) = 2x+1$, alt: "the derivative of x squared plus x plus 3 is 2 x plus 1"). This is our indication to try a substitution:
  #math.equation(
    $
       "Let" u & = x^2+x+3 \
      dv(u, x) & = 2x+1 \
         dif u & = 2x+1 dif x
    $,
    alt: "u equal x squared plus x plus 3. next line then d u d x equals 2 x plus 1. the next line then d u equals 2 x plus 1 d x",
    block: true,
  )
  Substituting in #acc("u") and #math.equation($2x+1 dif x$, alt: "d u equals 2 x plus 1 d x") (note we could solve this for #math.equation($dif x$, alt: "d x") and plug that in instead) we get
  #math.equation(
    $
      integral (2x+1)/(x^2+x+3) dif x & = integral 1/u dif u \
                                      & = ln|u| + C \
                                      & = ln|x^2+x+3| + C
    $,
    alt: "2 x plus 1 all over x squared plus x plus 3, d x is equivalent to the integral of 1 over u d u. The next line says this equals the natural log of absolute value u plus c. The next line says this equals the natural log of the absolute value of x squared plus x plus 3 and plus c at the end",
    block: true,
  )
]

So far we have only discussed indefinite integrals, those without bound. For definite integrals we have to be careful about the bounds when we make the substitution, since the bounds are in terms of the original variable, not our substituted variable.

#theorem[The Substitution Rule (for Definite Integrals)][
  If #math.equation($g'$, alt: "g prime") is continuous on #math.equation($[a,b]$, alt: "the closed interval from a to b") and #acc("f") is continuous on the range of #math.equation($u=g(x)$, alt: "u equals g of x"), then
  #math.equation(
    $
      integral_a^b f(g(x)) g'(x) dif x = integral_g(a)^g(b) f(u) dif u
    $,
    alt: "the integral from a to b of f of g of x times g prime of x, d x is equal to the integral from g of a to g of b of f of u, d u",
    block: true,
  )
]

#warning-block[
  When computing a definite integral with a substitution, you have two options: switch the bounds of integration to be with respect to u *or* switch the variable of integration back to #acc("x") after finding the antiderivative and use the original bounds. Note, if you do not switch the bounds, you cannot write the old bounds in terms of #acc("x") in your work on steps where you are talking about #acc("u").

  Both methods will be demonstrated in this section (and probably throughout these notes), you are free to choose your favorite method, use either, etc.
]

#example[
  Evaluate #math.equation($display(integral_1^e (ln(x))^2/(2x) dif x).$, alt: "the integral from 1 to e of the square of the natural log of x all over 2 times x, d x.")
]

#my-solution-block[
  We see a function composition, #math.equation($ln(x)$, alt: "natural log of x") looks like it has been plugged into something else. We pick that as #acc("u").
  #math.equation(
    $
      "Let" u & = ln(x) \
        dif u & = 1/x dif x. \
    $,
    alt: "let u equal natural log of x then d u equals 1 over x d x.",
    block: true,
  )
  We also need to change the bounds of integration
  #math.equation(
    $
      u(e) & = ln(e) = 1 \
      u(1) & = ln(1) = 0 \
    $,
    alt: "u evaluated at x equals e is natural log of e is 1 and u evaluated at x equals 1 is natural log of 1 is 0",
    block: true,
  )
  The integral then is
  #math.equation(
    $
      integral_1^e (ln(x))^2/(2x) dif x & = integral_0^1 u^2/2 dif u \
                                        & = [1/6 u^3]_0^1 \
                                        & = 1/6
    $,
    alt: "the integral from 1 to e of the square of the natural log of x all over 2 times x, d x equals the integral from 0 to 1 of u squared over 2 ,d u. this is then 1 sixth times u cubed evaluated from 0 to 1 which is one sixth",
    block: true,
  )
]

Notice in the method above, since we changed the bounds of the integral to be in terms of #acc("u"), we did not need to plug in #math.equation($u=ln(x)$, alt: "u equals natural log of x") again. Changing the bounds tends to be faster in most examples, and if you don't change the bounds you have to be much more careful with notation.

#note-block[
  An optional bit of notation for clarity on bounds may be useful. To remember you have to change the bounds of integration when doing a substitution you can write the variable name in the lower bound. For example,
  #math.equation(
    $
      integral_(x=1)^e (ln(x))^2/(2x) dif x & = integral_(u=0)^1 u^2/2 dif u.
    $,
    alt: "the integral from x equals 1 to e of the square of the natural log of x all over 2 times x, d x equals the integral from u equals 0 to 1 of u squared over 2 ,d u.",
    block: true,
  )
  This kind of extra notation for clarity can act as training wheels as you get used to the substitution step of changing bounds, but also this notation becomes _very_ useful in multivariable calculus.
]

Here are some less obvious substitution problems.

#example[
  Evaluate #math.equation($display(integral_0^(pi/16) tan(4x) dif x.)$, alt: "the integral from 0 to pi over 16 of tangent of 4 x, d x.")
]
#my-solution-block[
  It seems that #math.equation($4x$, alt: "4x") has been plugged into the tangent function. However, using this as our #acc("u") would not change the fact that we don't have a known antiderivative for #math.equation($tan(u)$, alt: "tangent of u"). To see the substitution, sometimes we need to rewrite problems
  #math.equation(
    $
      integral_0^(pi/16) tan(4x) dif x & = integral_0^(pi/16) sin(4x)/cos(4x) dif x
    $,
    alt: "the integral from 0 to pi over 16 of tangent of 4 x, d x equals the integral from 0 to pi over 16 of sine of 4 x over cosine of 4 x, d x",
    block: true,
  )
  Now we can see a function and (a constant multiple of) its derivative: #math.equation($dv(, x)cos(4x)=-4sin(4x)$, alt: "the derivative with respect to x of cosine of 4 x is negative 4 times sine of 4 x"). This becomes our candidate for #acc("u")
  #math.equation(
    $
           "Let" u & = cos(4x) \
      "then" dif u & = -4 sin(4x) dif x \
        -1/4 dif u & = sin(4x) dif x
    $,
    alt: "let u equal cosine of 4 x. then d u equals negative 4 times sine of 4 x, d x. then negative 1 fourth d u is equal to sine of 4 x, d x",
    block: true,
  )
  (notice we can solve for #math.equation($dif x$, alt: "d x") and plug that in, but after we sub #acc("u") we can see we have the #math.equation($sin(4x) dif x$, alt: "sine of 4 x, d x") there anyway) and the bounds are changed to
  #math.equation(
    $
      u(pi/16) & = sqrt(2)/2 \
          u(0) & = 1
    $,
    alt: "u of pi over sixteen is square root of 2 over 2, and u of 0 is 1",
    block: true,
  )
  then
  #math.equation(
    $
      integral_0^(pi/16) sin(4x)/cos(4x) dif x & = integral_1^(sqrt(2)/2) -1/4 1/u dif u. \
    $,
    alt: "the integral from 0 to pi over 16 of sine of 4 x over cosine of 4 x, d x becomes the integral from 1 to square root of 2 over 2 of negative one fourth times 1 over u, d u.",
    block: true,
  )
  The antiderivative of #math.equation($1/u$, alt: "1 over u") is #math.equation($ln(u)$, alt: "natural log of u"). So,
  #math.equation(
    $
      integral_0^(pi/16) sin(4x)/cos(4x) dif x & = [-1/4 ln|u|]_1^(sqrt(2)/2) \
                                               & = -1/4 ln(sqrt(2)/2)
    $,
    alt: "the integral from 0 to pi over 16 of sine of 4 x over cosine of 4 x, d x becomes negative one fourth times the natural log of the absolute value of u evaluated from 1 to root 2 over 2. which is negative one fourth times natural log of root 2 over 2",
    block: true,
  )
  (Optionally,) This could be further simplified by
  #math.equation(
    $-1/4 ln(sqrt(2)/2) = -1/4(ln(sqrt(2)-ln(2))) = -1/4(1/2 ln(2)-ln(2)) = -1/4(-1/2ln(2)) = ln(2)/8$,
    alt: "negative one fourth times natural log of root 2 over 2 is negative one fourth times the difference of l n of root 3 minus l n of 2 which becomes negative one fourth times half l n of 2 minus l n of 2 which is just negative 1 fourth times negative one half times l n 2 or just l n of 2 over 8.",
  )
]

#example[
  Find #math.equation($display(integral x^2 root(3, x+1) dif x)$, alt: "integral of x squared times cube root of quantity x plus 1, d x")
]
This is another common type of substitution problem that doesn't follow the usual patterns. You can recognize these types of problems by the product of a polynomial (in this case #math.equation($x^2$, alt: "x squared")) and another polynomial to some exponent (in this case #math.equation($root(3, x+1)$, alt: " cube root of x plus 1")).
#my-solution-block[
  Let #math.equation($u=x+1$, alt: "u equal x plus 1"). Then #math.equation($dif u = dif x$, alt: "d u equals d x"). Note, that we also need something to plug into the #math.equation($x^2$, alt: "x squared") term, so solving for #acc("x") we have #math.equation($x=u-1$, alt: "x equals u minus 1") so #math.equation($x^2=(u-1)^2$, alt: "x squared is quantity u minus 1 squared"). Then,
  #math.equation(
    $
      integral x^2 root(3, x+1) dif x & = integral (u-1)^2 root(3, u) dif u \
                                      & = integral (u^2-2u+1) root(3, u) dif u \
                                      & = integral (u^2 u^(1/3)-2u u^(1/3)+1u^(1/3)) dif u \
                                      & = integral u^(7/3) - 2 u^(4/3) + u^(1/3) dif u
    $,
    alt: "integral of x squared times cube root of quantity x plus 1, d x becomes the integral of u minus 1 squared, all times the cuberoot of u, d u. expanding we have the integral of u squared minus 2 u plus 1 all times the cube root of u, d u. then distributing we have integral of u squared times u to the one third minus 2 u times u to the one third plus 1 times u to the one third, du . simplifying we have the integral of u to the 7 thirds minus 2 u to the 4 thirds plus u to the 1 third, du",
    block: true,
  )
  Note: because we moved the polynomial with multiple terms to the integer exponent, we could manually expand and distribute. Now we only need to use power rule a few times. Integrating we get
  #math.equation(
    $
      integral u^(7/3) - 2 u^(4/3) + u^(1/3) dif u & = 3/10 u^(10/3) - 6/7 u^(7/3) + 3/4 u^(4/3) + C \
                                                   & = 3/10 (x+1)^(10/3) - 6/7 (x+1)^(7/3) + 3/4 (x+1)^(4/3) + C.
    $,
    alt: "the integral of u to the 7 thirds minus 2 u to the 4 thirds plus u to the 1 third, du equals 3 tenths times u to the ten thirds minus six sevenths times u to the seven thirds plus 3 fourths times u to the four thirds plus c. then this is 3 tenths times x plus 1 to the ten thirds minus six sevenths times x plus 1 to the seven thirds plus 3 fourths times x plus 1 to the four thirds plus c.",
    block: true,
  )
]

#emph-block[
  5.5 Section Summary:
  - We reviewed the fundamental theorem of calculus, linking the area under a curve to the antiderivative of the function.
  - We learned about one solution method for integrals: making a substitution.
  - We noticed how the bounds of the integral change when we make substitutions.
]
