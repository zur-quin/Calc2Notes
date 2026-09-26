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

Take for example $integral e^(x^2) dif x$ and $integral sqrt(1+x^3) dif x$. We cannot write these antiderivatives in terms of functions we know. But, from the FTC, we know the antiderivatives exist because $integral_a^x d^(t^2) dif t$ and $integral_a^x sqrt(1+t^3) dif t$ have continuous integrands.

#note-block[
  The way I talk about this section may make you think it is less important. It is sort of a tricky thing to test on in a timed environment without a calculator. However, this is one of biggest sections to pay attention to and take away from this class if you are any kind of engineer, computer scientist, or other STEM major. There are full classes based on just the topics in this section, and it is an incredibly important field. Being able to approximate integrals quickly and efficiently is very important.
]

=== Recall Left/Right Riemann Sums
Forget any limits for now, we will eventually just use large enough $n$ for our approximations. Then, to approximate integrals we have seen left and right endpoint approximations:
#definition[Left Endpoint Approximation][
  We approximate the integral by dividing the interval #closedint("a", "b") into $n$ equally spaced rectangles, with width $Delta x=(b-a)/n$. Then the height of these rectangles is given by the function value at the left endpoint of the rectangle.
  $
    integral_a^b f(x) dif x approx L_n = sum_(i=0)^(n-1) f(x_i) Delta x
  $
  // todo: picture of left sum
  Note, another way to write this sum is
  $
    L_n = sum_(i=1)^(n) f(x_(i-1)) Delta x
  $
  it just depends if you are okay counting the first rectangle as rectangle 0 or 1.
]
#definition[Right Endpoint Approximation][
  We approximate the integral by dividing the interval #closedint("a", "b") into $n$ equally spaced rectangles, with width $Delta x$. Then the height of these rectangles is given by the function value at the right endpoint of the rectangle.
  $
    integral_a^b f(x) dif x approx L_n = sum_(i=1)^(n) f(x_i) Delta x
  $
  // todo: picture of right sum
]

Observe if $f$ is *strictly increasing* (always increasing, never decreasing) then $L_n$ is always an underestimate and $R_n$ is an overestimate.

Alternatively if $f$ is *strictly decreasing* (always decreasing, never increasing) then $L_n$ is an over estimate and $R_n$ is an underestimate.

#exercise[
  Draw a picture to show the above claims, and convince yourself they are true.
]

In other cases of $f$, there is no guarantee if $L_n$ or $R_n$ are over or underestimates without further information.

#exercise[
  Can you think of (draw) an example where $f$ is not strictly increasing nor strictly decreasing and $L_n$ is an overestimate still?
]

=== More Approximations
When we talk about Riemann sums, we mention that the $x_i^*$ can be any point in the subinterval. The other point we will look at is midpoint rule.
#definition[Midpoint Approximation][
  We approximate the integral by dividing the interval #closedint("a", "b") into $n$ equally spaced rectangles, with width $Delta x$. Then the height of these rectangles is given by the function value at the midppoint between the left and right endpoints of the rectangle. In other words we use
  $
    x_(i+1/2) = (x_i + x_(i-1))/2
  $
  the average of the left/right endpoints. Then,
  $
    integral_a^b f(x) dif x approx M_n = sum_(i=1)^(n) f(x_(i+1/2)) Delta x
  $
  // todo: midpoint picture
]

We can get a bit of a better approximation if we use different shapes other than rectangles. In the next approximation, we will use trapezoids
#definition[Trapezoidal Approximation][
  We approximate the integral by dividing the interval #closedint("a", "b") into $n$ equally spaced *trapezoids*, with width $Delta x$. Then the heights of these trapezoids are given by the function value at the endpoints of the subinterval. Then, the area of one rectangle is
  $
    A_i = (Delta x)/2 (f(x_(i-1))+f(x_i))
  $
  The "middle trapezoids" share heights so that we get a bit of duplicated information except the left and rightmost trapezoids' heights. Then,
  $
    integral_a^b f(x) dif x approx T_n = (Delta x)/2 (f(x_0) + 2f(x_1) + 2f(x_2) + ... + 2 f(x_(n-1)) + f(x_n))
  $
  // todo: trapezoid picture
]

Note, for $f$ strictly increasing or strictly decreasing, we cannot conclude if the midpoint or trapezoid rules are over or under estimates. We need more information to conclude anything.

If $f$ is *concave up* on #closedint("a", "b") then $T_n$ is an overestimate, and $M_n$ is an underestimate. If $f$ is *concave down* on #closedint("a", "b") then $T_n$ is an underestimate, and $M_n$ is an overstimate.

#exercise[
  Draw a picture to show the above claims, and convince yourself they are true.
]

#note-block[
  $T_n$ is our first time seeing an approximation that isn't made up of rectangles. But it turns out $T_n$ is related to $R_n$ and $L_n$. Observe we can rearange the sum to see
  $
    T_n & = (Delta x)/2 ((f(x_0) + 2f(x_1) + 2f(x_2) + ... + 2 f(x_(n-1)) + f(x_n))) \
    & = (Delta x)/2 [(f(x_0) + f(x_1) + f(x_2) + ... + f(x_(n-1))) + (f(x_1) + f(x_2) + ... + f(x_(n-1)) + f(x_n))] \
    & = 1/2 [Delta x(f(x_0) + f(x_1) + f(x_2) + ... + f(x_(n-1))) + Delta x(f(x_1) + f(x_2) + ... + f(x_(n-1)) + f(x_n))] \
    & = 1/2(L_n+R_n)
  $
  So the trapezoid rule is the same, numerically, as the average of the left and right approximations!
]

#example[
  Use $M_5$ and $T_5$ to approximate $display(integral_1^2 (sin(e^x)+2)dif x)$. Use an excel sheet to do so!
]
#my-solution-block[
  What do we need for Excel?

  For $M_5$ we need to have
  - $M_5 = sum_(i=1)^n f(x_(i+1/2)) Delta x$
  - $n=5$
  - $Delta x = (2-1)/5=1/5$
  - $x_i=1+i(1/5)$
  - $x_(i+1/2)=1/2(x_i+x_(i-1))$

  And for $T_5$ we need to have
  - $T_5=1/2 (L_5+R_5)$
  - $L_n=sum_(i=1)^n f(x_(i-1)) Delta x$
  - $R_n=sum_(i=1)^n f(x_(i)) Delta x$
  - $n=5$
  - $Delta x = (2-1)/5=1/5$
  - $x_i = 1+i(1/5)$

  Then excel
]

#emph-block[
  7.7 Section Summary:
]

