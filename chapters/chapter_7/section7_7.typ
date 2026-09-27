#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(6)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 7.7")
      = Integration Techniques
    ]
  }
}

#counter(heading).update(7)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
== Approximate Integration


// any functions and templating you want for just this chapter can go here

#emph-block[
  7.7 Learning Objectives
  - I understand how to use constant, linear, and quadratic functions to approximate integrals.
  - I understand the geometric interpretation of Simpson's Rule.
  - I understand how the type of approximation used affects the accuracy of our answer.
]

=== Motivation
The fundamental theorem of calculus guarantees that any continuous function has an antiderivative. And we have talked a *lot* about how to compute antiderivatives and integrals by hand. However, it turns out there are even more antiderivatives that we simply can't write in terms of functions we know even if they exist in theory. This isn't always just a case of "we haven't tried the right technique," it's just that there are some continuous functions that have antiderivatives, and those antiderivatives just aren't any nice named function we have. And these come up a lot! Unfortunately, integrals and antiderivatives have a lot of applications (some we have seen, some we will see soon, and more you may encounter in the wild) that are really important to all sorts of modeling, engineering, and other science applications.

Take for example
#auto-alt(
  $
    integral e^(x^2) dif x " and " integral sqrt(1+x^3) dif x.
  $,
)
We cannot write these antiderivatives in terms of functions we know. But, from the FTC, we know the antiderivatives exist because #auto-alt($integral_a^x d^(t^2) dif t$) and #auto-alt($integral_a^x sqrt(1+t^3) dif t$) have continuous integrands.

#note-block[
  The way I talk about this section may make you think it is less important. It is sort of a tricky thing to test on in a timed environment without a calculator. However, this is one of biggest sections to pay attention to and take away from this class if you are any kind of engineer, computer scientist, or other STEM major. There are full classes based on just the topics in this section, and it is an incredibly important field. Being able to approximate integrals quickly and efficiently is very important.
]

=== Recall Left/Right Riemann Sums
Forget any limits for now, we will eventually just use large enough #auto-alt($n$) for our approximations. Then, to approximate integrals we have seen left and right endpoint approximations:
#definition[Left Endpoint Approximation][
  We approximate the integral by dividing the interval #closedint("a", "b") into #auto-alt($n$) equally spaced rectangles, with width #auto-alt($Delta x=(b-a)/n$). Then the height of these rectangles is given by the function value at the left endpoint of the rectangle.
  #auto-alt(
    $
      integral_a^b f(x) dif x approx L_n = sum_(i=0)^(n-1) f(x_i) Delta x
    $,
  )
  // todo: picture of left sum
  Note, another way to write this sum is
  #auto-alt(
    $
      L_n = sum_(i=1)^(n) f(x_(i-1)) Delta x
    $,
  )
  it just depends if you are okay counting the first rectangle as rectangle 0 or 1.
]
#definition[Right Endpoint Approximation][
  We approximate the integral by dividing the interval #closedint("a", "b") into #auto-alt($n$) equally spaced rectangles, with width #auto-alt($Delta x$). Then the height of these rectangles is given by the function value at the right endpoint of the rectangle.
  #auto-alt(
    $
      integral_a^b f(x) dif x approx L_n = sum_(i=1)^(n) f(x_i) Delta x
    $,
  )
  // todo: picture of right sum
]

Observe if #auto-alt($f$) is *strictly increasing* (always increasing, never decreasing) then #auto-alt($L_n$) is always an underestimate and #auto-alt($R_n$) is an overestimate.

Alternatively if #auto-alt($f$) is *strictly decreasing* (always decreasing, never increasing) then #auto-alt($L_n$) is an overestimate and #auto-alt($R_n$) is an underestimate.

#exercise[
  Draw a picture to show the above claims, and convince yourself they are true.
]

In other cases of #auto-alt($f$), there is no guarantee if #auto-alt($L_n$) or #auto-alt($R_n$) are over or underestimates without further information.

#exercise[
  Can you think of (draw) an example where #auto-alt($f$) is not strictly increasing nor strictly decreasing and #auto-alt($L_n$) is an overestimate still?
]

=== More Approximations
When we talk about Riemann sums, we mention that the #auto-alt($x_i^*$) can be any point in the sub-interval. The other point we will look at is midpoint rule.
#definition[Midpoint Approximation][
  We approximate the integral by dividing the interval #closedint("a", "b") into #auto-alt($n$) equally spaced rectangles, with width #auto-alt($Delta x$). Then the height of these rectangles is given by the function value at the midpoint between the left and right endpoints of the rectangle. In other words we use
  #auto-alt(
    $
      x_(i+1/2) = (x_i + x_(i-1))/2
    $,
  )
  the average of the left/right endpoints. Then,
  #auto-alt(
    $
      integral_a^b f(x) dif x approx M_n = sum_(i=1)^(n) f(x_(i+1/2)) Delta x
    $,
  )
  // todo: midpoint picture
]

We can get a bit of a better approximation if we use different shapes other than rectangles. In the next approximation, we will use trapezoids
#definition[Trapezoidal Approximation][
  We approximate the integral by dividing the interval #closedint("a", "b") into #auto-alt($n$) equally spaced *trapezoids*, with width #auto-alt($Delta x$). Then the heights of these trapezoids are given by the function value at the endpoints of the sub-interval. Then, the area of one rectangle is
  #auto-alt(
    $
      A_i = (Delta x)/2 (f(x_(i-1))+f(x_i))
    $,
  )
  The "middle trapezoids" share heights so that we get a bit of duplicated information except the left and rightmost trapezoids' heights. Then,
  #auto-alt(
    $
      integral_a^b f(x) dif x approx T_n = (Delta x)/2 (f(x_0) + 2f(x_1) + 2f(x_2) + ... + 2 f(x_(n-1)) + f(x_n))
    $,
  )
  // todo: trapezoid picture
]

Note, for #auto-alt($f$) strictly increasing or strictly decreasing, we cannot conclude if the midpoint or trapezoid rules are over or underestimates. We need more information to conclude anything.

If #auto-alt($f$) is *concave up* on #closedint("a", "b") then #auto-alt($T_n$) is an overestimate, and #auto-alt($M_n$) is an underestimate. If #auto-alt($f$) is *concave down* on #closedint("a", "b") then #auto-alt($T_n$) is an underestimate, and #auto-alt($M_n$) is an overestimate.

#exercise[
  Draw a picture to show the above claims, and convince yourself they are true.
]

#note-block[
  #auto-alt($T_n$) is our first time seeing an approximation that isn't made up of rectangles. But it turns out #auto-alt($T_n$) is related to #auto-alt($R_n$) and #auto-alt($L_n$). Observe we can rearrange the sum to see
  #auto-alt(
    $
      T_n & = (Delta x)/2 ((f(x_0) + 2f(x_1) + 2f(x_2) + ... + 2 f(x_(n-1)) + f(x_n))) \
      & = (Delta x)/2 [(f(x_0) + f(x_1) + f(x_2) + ... + f(x_(n-1))) + (f(x_1) + f(x_2) + ... + f(x_(n-1)) + f(x_n))] \
      & = 1/2 [Delta x(f(x_0) + f(x_1) + f(x_2) + ... + f(x_(n-1))) + Delta x(f(x_1) + f(x_2) + ... + f(x_(n-1)) + f(x_n))] \
      & = 1/2(L_n+R_n)
    $,
  )
  So the trapezoid rule is the same, numerically, as the average of the left and right approximations!
]

#example[
  Use #auto-alt($M_5$) and #auto-alt($T_5$) to approximate #auto-alt($display(integral_1^2 (sin(e^x)+2)dif x)$). Use an excel sheet to do so!
]
#my-solution-block[
  What do we need for Excel?

  For #auto-alt($M_5$) we need to have
  - #auto-alt($M_5 = sum_(i=1)^n f(x_(i+1/2)) Delta x$)
  - #auto-alt($n=5$)
  - #auto-alt($Delta x = (2-1)/5=1/5$)
  - #auto-alt($x_i=1+i(1/5)$)
  - #auto-alt($x_(i+1/2)=1/2(x_i+x_(i-1))$)

  And for #auto-alt($T_5$) we need to have
  - #auto-alt($T_5=1/2 (L_5+R_5)$)
  - #auto-alt($L_n=sum_(i=1)^n f(x_(i-1)) Delta x$)
  - #auto-alt($R_n=sum_(i=1)^n f(x_(i)) Delta x$)
  - #auto-alt($n=5$)
  - #auto-alt($Delta x = (2-1)/5=1/5$)
  - #auto-alt($x_i = 1+i(1/5)$)

  Then we set up in Excel
  #table(
    columns: (auto, auto),
    inset: 7pt,
    align: center + horizon,
    table.header([*variable*], [*value*]),
    "a", "1",
    "b", "2",
    "n", "5",
    "deltax", "0.2",
  )
  and get
  #table(
    columns: (auto, auto, auto),
    inset: 7pt,
    align: center + horizon,
    table.header([*Variable*], [*#auto-alt($x$)*], [*#auto-alt($f(x)$)*]),
    "x0", "1", "2.410781291",
    "x0.5", "1.1", "2.136994463",
    "x1", "1.2", "1.822422509",
    "x1.5", "1.3", "1.496448982",
    "x2", "1.4", "1.208287429",
    "x2.5", "1.5", "1.026493407",
    "x3", "1.6", "1.028815175",
    "x3.5", "1.7", "1.276238492",
    "x4", "1.8", "1.768579232",
    "x4.5", "1.9", "2.391912189",
    "x5", "2", "2.893854955",
  )
  See Excel file in Canvas Files for details and formulas.
  #auto-alt($M_5=1.665617507$), #auto-alt($T_5=1.696084493$)
]

=== Simpson's Rule
There are many, many more complicated approximations for integrals. In this class, we will look into only one more, called Simpson's rule.

Consider that Trapezoid rule is kind of like treating the function like it is just a line on each sub-interval. To write the equation of a line, recall we need just 2 points it passes through. If we want to use a *higher order approximation*, we would need 3 points and those points would uniquely define a parabola. Skipping a lot of steps, we can say this next approximation method is like if we treated each consecutive pair of sub-intervals using a parabola.

#definition[Simpson's Rule][
  If we divide our interval #closedint("a", "b") into an even number of sub-intervals #auto-alt($n$) of equal length #auto-alt($Delta x = (b-a)/n$), then each consecutive pair of intervals can be approximated using a parabola. The resulting approximation will be given by:
  #auto-alt(
    $
      S_n = & (Delta x)/3 [(f(x_0)+4f(x_1)+f(x_2)) + (f(x_2)+4f(x_3)+f(x_4)) + \
            & ... + (f(x_(n-2))+4f(x_(n-1))+f(x_n))] \
       "or" \
      S_n = & (Delta x)/3 [f(x_0)+4f(x_1)+2f(x_2)+4f(x_3) + 2f(x_4) + ... + 2f(x_(n-2))+4f(x_(n-1))+f(x_n)]
    $,
  )
]

#example[
  Use #auto-alt($S_6$) to approximate #auto-alt($display(integral_1^2 (sin(e^x)+2)dif x)$).
]
#my-solution-block[
  We will use a calculator or spreadsheet app again. Then we end up setting up the variables as
  #table(
    columns: (auto, auto),
    inset: 7pt,
    align: center + horizon,
    table.header([*variable*], [*value*]),
    "a", "1",
    "b", "2",
    "n", "6",
    "deltax", "1/6",
  )
  and we get
  #table(
    columns: (auto, auto, auto),
    inset: 7pt,
    align: center + horizon,
    table.header([*Variable*], [*#auto-alt($x$)*], [*#auto-alt($f(x)$)*]),
    "x0", "1", "2.410781291",
    "x1", "1.166666667", "1.930378478",
    "x2", "1.333333333", "1.393162833",
    "x3", "1.5", "1.026493407",
    "x4", "1.666666667", "1.164690632",
    "x5", "1.833333333", "1.971519496",
    "x6", "2", "2.893854955",
  )
  See Excel file in Canvas for details and formulas.
  Then #auto-alt($S_6= 1.674106039$).
]

#emph-block[
  7.7 Section Summary:
  - We used Left/Right Riemann sums to approximate integrals.
  - We used Trapezoid rule and midpoint rule to approximate integrals.
  - We can discuss when left/right/trapezoid/midpoint rules are over/underestimates.
  - We looked at a more complex approximation method, called Simpson's rule.
]

