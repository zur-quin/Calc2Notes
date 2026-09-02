// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template

// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(6)
#context {
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [#counter(heading).update(5)
      = Applications of Integrals
      #set document(title: "Section 6.5")
    ]
  }
}

#context counter(heading).step(level: 2)
#context counter(heading).step(level: 2)
#context counter(heading).step(level: 2)
#context counter(heading).step(level: 2)
== Average Value of a Function
// any functions and templating you want for just this chapter can go here

#emph-block[
  6.5 Learning Objectives:
  - I can find the average value of a function on some interval.
  - I can know and understand how to apply the Mean Value Theorem.
]

#definition[
  Recall the average of #acc("n") values, namely #math.equation($a_1,a_2,...,a_n$, alt: "a sub 1 comma a sub 2 comma all the way up to a sub n"), is
  #math.equation(
    $
      "average" = (a_1 + a_2 + a_3 + ... + a_n)/n = sum_(i=1)^n 1/n a_i
    $,
    alt: "the average equals the sum of a sub 1 plus a sub 2 plus a sub 3 plus dot dot dot plus a sub n all divided by n is equal to the sum from i equals 1 to n of one over n times a sub i",
    block: true,
  )
]

Suppose we wanted to find the average of all values that a function #math.equation($f(x)$, alt: "f of x") achieves on an interval #closedint("a", "b"). We can think about sampling the function at #acc("n") equally spaced points and dividing by the number of points. As we look at sampling more points, we get a more precise approximation for the average of #acc("f").

#figure(image(
  "figures/genericfunavg.svg",
  alt: "sketch of a generic function f, with several values of x being sampled. The function values at these points are written above the point.",
  width: 40%,
))

The approximate function average is
#math.equation(
  $
    f_"ave" & approx (f(x_1)+f(x_2)+...+f(x_n))/n \
            & = 1/n sum_(i=1)^n f(x_i) \
            & = (Delta x)/(b-a) sum_(i=1)^n f(x_i) \
            & = 1/(b-a) sum_(i=1)^n f(x_i) Delta x
  $,
  alt: "f average is approximately the sum of f of x 1 plus f of x 2 plus dot dot dot plus f of x n all over n. this is 1 over n times the sum from i equals 1 to n of f of x sub i. this is delta x over b minus a times the sum from i equals 1 to n of f of x sub i. this is 1 over b minus a times the sum from i equals 1 to n of f of x sub i times delta x.",
  block: true,
)
To make our approximation more accurate, we will sample the function at even more points, eventually taking the limit gives us the integral.
#math.equation(
  $
    f_"ave" & = 1/(b-a) lim_(n arrow infinity) sum_(i=1)^n f(x_i) Delta x \
            & = 1/(b-a) integral_a^b f(x) dif x.
  $,
  alt: "f average is 1 over b minus a times the limit as n goes to infinity of the sum from i equals 1 to n of f of x sub i times delta x. this is 1 over b minus a times the integral from a to b of f of x d x.",
  block: true,
)

#definition[
  The average value of #acc("f") on #closedint("a", "b") is given by
  #math.equation(
    $
      f_"ave" = 1/(b-a) integral_a^b f(x) dif x.
    $,
    alt: "f ave equals 1 over b minus a times the integral from a to b of f of x d x.",
    block: true,
  )
]

#example[
  Find the average of #math.equation($f(x)=1+x^2$, alt: "f of x equals 1 plus x squared") on #closedint("-1", "2").
]
#my-solution-block[
  We use the formula
  #math.equation(
    $
      f_"ave" & = 1/(2-(-1)) integral_(-1)^2 1+x^2 dif x \
              & = 1/3 [x+(x^3)/3]_(-1)^2 \
              & = 1/3 [2+8/3-(-1-1/3)] \
              & = 2
    $,
    alt: "f average equals 1 over 2 minus negative 1 all times the integral froom minus 1 to 2 of 1 plus x squared d x. this is one third times the quantity x plus x cubed over 3 evaluated from -1 to 2. this is one third times the quantity 2 plus eight thirds minus the quantity negative 1 minus one third. this all simplifies to 2.",
    block: true,
  )
]

#example[
  Find the average value of #acc("f"), given in the graph below, on #closedint("0", "11").
  #figure(image(
    "figures/favgex.svg",
    alt: "plot of f of x. It is defined as the top of a circle with radius 4 centered at 4 comma 3 from x equals 0 to 8. At x equals 8, the function becomes linear with slope minus 1 connecting the points 8 comma 3 and eleven comma 0.",
  ))
]
#my-solution-block[
  We use the formula for average of a function
  #math.equation(
    $
      f_"ave" & = 1/(11-0) integral_0^11 f(x) dif x
    $,
    alt: "f average equals 1 over eleven minus 0 times the integral from 0 to 11 of f of x d x",
    block: true,
  )
  In this case, to get the integral, we remember that the integral of a curve is the same as the area under that curve. We don't need the equation for #acc("f") since we can use geometry to find the area.
  #figure(image(
    "figures/favgexsol.svg",
    alt: "the graph of f from before with added annotations. first, it is split into 3 regions, the top half of a circle is labeled a sub 1. below that the rectangle that is 8 wide and 3 tall is labeled a sub 2. lastly the triangle on the right is labeled a sub 3.",
  ))
  Now, we add the areas of the different parts up:
  #math.equation($A_1 = 1/2 pi r^2 = 1/2 pi 4^2 = 8 pi$, alt: "a sub 1 equals one half pi r squared which is 1 half pi four squared which is 8 pi.") And #math.equation($A_2 = w h = (8)(3) = 24$, alt: "a sub 2 equals w times h which is 8 times 3 which is twenty four"). And #math.equation($A_3 = 1/2 b h = 1/2 (3)(3)=9/2$, alt: "a sub 3 equals one half base times height which is one half times three times three. which is 9 halves").

  Then, the average is
  #math.equation(
    $
      f_"ave" & = 1/(11) integral_0^11 f(x) dif x \
              & = 1/11 (A_1 + A_2+A_3) \
              & = 1/11 (8 pi + 24 + 9/2).
    $,
    alt: "f average equals 1 over eleven minus 0 times the integral from 0 to 11 of f of x d x. this is now one eleventh times the sum of a sub 1 plus a sub 2 plus a sub 3. this is one eleventh times 8 pi plus 24 plus 9 halves.",
    block: true,
  )
]

#theorem[Mean Value Theorem for Integrals][
  If #acc("f") is continuous on #closedint("a", "b"), then there is some #acc("c") in #openint("a", "b") where #math.equation($f(c)=f_"ave"=1/(b-a) integral_a^b f(x) dif x$, alt: "f of c equals f average equals 1 over b minus a times the integral from f of x d x", block: true)
]

#example[
  Does the function #math.equation($f(x) = (x+1)^3$, alt: "f of x equals x plus 1 cubed") achieve its average value on #closedint("a", "b") for some value in #openint("a", "b")? If so where does this happen?
]
#my-solution-block[
  Yes, because #acc("f") is continuous (since it is a polynomial), so by Mean Value Theorem (MVT) the function achieves its average value for some #acc("c") in #openint("a", "b").

  As for where this happens, the MVT does not say. We can find it though,
  #math.equation(
    $
      f_"ave" & = 1/(2-0) integral_0^2 (x+1)^3 dif x \
              & = 1/2 integral_1^3 u^3 dif u \
              & = 1/2 (u^4)/4 |_1^3 \
              & = 1/2(3^4/4-1/4) \
              & = 10
    $,
    alt: "f average equals 1 over 2 minus 0 times the integral from 0 to 2 of x plus 1 cubed, d x. Then this is one half times the integral from 1 to 3 of u to the third power, d u. Then this is one half times u to the fourth over four evaluated from 1 to 3. then this is one half times 3 cubed over 4 minus 1 fourth. this is ten.",
    block: true,
  )
  Where the #acc("u")-sub we used was #math.equation($u=x+1$, alt: "u equals x plus 1.") so #math.equation($dif u = dif x$, alt: "d u equals d x") and #math.equation($u(0)=1 " and " u(2) = 3$, alt: "u of 0 equals 1 and u of 2 equals 3").

  Since the average value is now known (10), we can find which #acc("c") value has #math.equation($f(c)=10$, alt: "f of c equals ten").
  #math.equation(
    $
                 10 & = (c+1)^3 \
        root(10, 3) & = c+1 \
      root(10, 3)-1 & = c
    $,
    alt: "ten equals c plus 1 cubed. Then cuberoot of ten equals c plus 1 then c is cube root of 10 minus 1.",
    block: true,
  )
  which is in #openint("0", "2").
]


#emph-block[
  6.5 Section Summary:
  - We found the average value of a function on some interval.
  - We used mean value theorem to find where a function achieves its average value.
]
