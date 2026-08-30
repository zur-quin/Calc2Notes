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
      #set document(title: "Section 6.4")]
  }
}
#context counter(heading).step(level: 2)
#context counter(heading).step(level: 2)
#context counter(heading).step(level: 2)

// any functions and templating you want for just this chapter can go here

== Work
#emph-block[
  6.4 a Learning Objectives:
  - I can understand the definitions of work and force.
  - I understand how to use integration to describe work.
  - I can describe the work done in pulley systems and springs.
]

#definition[
  Force is any influence that causes an object to undergo a change in speed, direction, or shape. Force has magnitude and direction. We say that an object with mass, #acc("m"), and acceleration, #acc("a"), has force
  #math.equation(
    $F=m a$,
    alt: "f equals m times a",
    block: true,
  )
  A body moves a distance, #acc("d"), along a straight line after being acted by a force of constant magnitude, #acc("F"), in the direction of motion, we define the work, #acc("W"), done by the force on the body with the formula
  #math.equation(
    $W=F d$,
    alt: "W equals f times d",
    block: true,
  )
]

=== Units
In this class you will encounter both metric system and imperial system.

In metric,
- Distance should be converted to meters, #zi.m(), to work with other units.
- Mass should be converted to kilograms, #zi.kg(), to work with other units.
- Time is measured in seconds, #zi.s().
- Force is measured in Newtons, #zi.N(), where #zi.N(1) is equivalent to #kgm-s2[1].
- Work is measured in Joules, #zi.J(), where #zi.J(1) is equivalent to #zi.N(1) #zi.m().
- Acceleration due to gravity is #math.equation($"g"=9.8$, alt: "g equals 9 point 8") #zi.m-s2().

In imperial system,
- Distance is measured in feet, #fts()
- Mass is not normally given. Instead weight (which is a force) is given.
- Force is measured in pounds, #lb().
- Work is measured in foot-pounds, #ft()-#lb().


#example[
  Determine the amount of work done.
  #set enum(numbering: "a.")
  + A #zi.kg(5) book is lifted #zi.m(4).
  + A #lb[5] book is lifted #ft[4].
]
#my-solution-block[
  #set enum(numbering: "a.")
  + #math.equation(
      $W=m a d=$,
      alt: "w equals m times a times d equals ",
    ) (#zi.kg[5]) (#zi.m-s2[9.8]) (#zi.m[4]) #math.equation($=$, alt: "equals") #zi.J(196).
  + #math.equation(
      $W=F d=$,
      alt: "w equals F times d equals ",
    ) (#lb(5)) (#ft(4)) #math.equation($=$, alt: "equals") #ft(20)-#lb().
]

=== Non-Constant Force
#example[
  The graph of a force function (in Newtons) is shown below. How much work is done by the force in moving an object a distance of #zi.m(5)?
  #figure(image(
    "figures/work1.svg",
    alt: "graph of force over distance connecting the points zero forty then 2 0 then 4 forty then 5 forty with straight lines.",
  ))
]
#my-solution-block[
  #math.equation(
    $
      W & = F d \
        & = "area under curve" \
        & = A_1 + A_2 + A_3 \
    $,
    alt: "w equals f time d which is the area under the curve. this is a sub 1 plus a sub 2 plus a sub 3.",
    block: true,
  )
  Then #math.equation($A_1=2(40)(1/2)=$, alt: " a sub 1 equals 2 times 40 times one half which is ") #zi.J(40), #math.equation($A_2=2(40)(1/2)=$, alt: " a sub 2 equals 2 times 40 times one half which is ") #zi.J(40), and #math.equation($A_3=1(40)=$, alt: " a sub 3 equals 1 times 40 which is ") #zi.J(40).



  Altogether, the work is
  #math.equation(
    $
      W & = A_1 + A_2 + A_3 \
        & = 120 "J" \
        & = integral_0^5 F(x) dif x
    $,
    alt: "w equals a sub 1 plus a sub 2 plus a sub 3 which is 120 joules. this is the same as the integral from 0 to 5 of the force f of x d x.",
    block: true,
  )
]

#example[
  A uniform cable #ft(30) long and weighing #lb(60) hangs vertically from a pulley system at the top of a building. A steel beam weighs #lb(500) and is attached to the end of the cable. Set up and evaluate an integral to find the work required to pull the beam to the top. Explicitly write out the integral as a limit of Riemann sums.
]
#my-solution-block[
  We will consider the cable and the steel beam separately. First, the work to get the steel beam to the top of the building is
  #math.equation($W_B = F d = 500(30)=$, alt: "w sub b equals f times d equals 5 hundred times thirty equals")#ftlb(15000).

  As we pull the cable up, less of it is pulling back, so the force is changing as we lift more and more cable. To account for this, consider chopping the cable up into #acc("n") tiny segments of length #math.equation($Delta x = 30/n$, alt: "delta x equals 30/n")#ft(). The #acc("i")th segment is #math.equation($x_i$, alt: "x sub i")#ft() from the top of the building. The weight (force) of each segment is the cable density times the length of the segment:
  #math.equation(
    $
      F_i & = (60 " lb")/(30 " ft") Delta x \
          & = 2 Delta x "lbs"
    $,
    alt: "F sub i equals 60 pounds over 30 feet all times delta x. this is 2 delta x pounds.",
    block: true,
  )
  The work done to lift the #acc("i")th segment of cable to the top of the building is then #math.equation($W_i = F_i x_i = 2 Delta x x_i$, alt: "w sub i equals f sub i times x sub i which is 2 times delta x times x sub i.").

  Next, we add up the work for all #acc("n") segments to get an approximation for the total work done to lift the cable to the top of the building:
  #math.equation(
    $
      W_C & approx sum_(i=1)^n W_i \
          & approx sum_(i=1)^n 2 Delta x x_i \
    $,
    alt: "W sub c is approximately the sum from i equals 1 to n of w sub i. this is the sum from i equals 1 to n of 2 times delta x times x sub i",
    block: true,
  )
  To get the exact amount of work, we take the limit as the number of cable segments goes to infinity,
  #math.equation(
    $
      W_c & = lim_(n arrow infinity) sum_(i=1)^n 2 Delta x x_i \
          & = integral_0^30 2 x dif x
    $,
    alt: "w sub c equals the limit as n goes to infinity of the sum from i equals 1 to n of 2 delta x times x sub i. this is equal to the integral from 0 to 30 of 2 x, d x.",
    block: true,
  )
  The work for the cable is then #math.equation($W_C = integral_0^30 2x dif x = x^2|_0^30=$, alt: "w sub c equals the integral from 0 to 30 of 2 x d x. this is x squared evaluated from 0 to 30 which is") #ftlb(900).

  Combined with the beam, the total work done to lift the beam and cable to the top of the building is #math.equation($900+15000=$, alt: "9 hundred plus 15 thousand equals ") #ftlb(15900).
]

#exercise[
  Assume the previous example's set up. Find the work done to lift the beam only #ft(10) up.
]

#theorem[Hooke's Law][
  The force required to compress or stretch a spring by #acc("x") units short of or beyond its natural length is proportional to #acc("x")
  #math.equation(
    $
      F= k x
    $,
    alt: "f equals k times x",
    block: true,
  )
  Note that #acc("k") is called the spring constant.
]

#exercise[Using what you know about the units for force and distance, derive the units for the spring constant in both metric and imperial units.]

#example[
  A spring has a natural length of #zi.cm(50). A force of #zi.N(50) stretches the spring to a length of #zi.cm(60).
  + What force is needed to stretch the spring #acc("x") meters?
  + How long is the spring when stretched by a force of #zi.N(200)?
  + Set up an integral to find the work done in stretching the spring #zi.cm(20).
  + Set up an integral to find the work done in stretching the spring from a length of #zi.cm(100) to #zi.cm(110).
  + #zi.J(20) of work is done in stretching the spring a certain distance. How far was the spring stretched?
]
#my-solution-block[
  + In general, #math.equation($F= k x$, alt: "f equals k times x"), so if we know #acc("k") we can get a formula for the force needed to stretch the spring #acc("x") meters. Going from #zi.cm(50) to #zi.cm(60) is a change of #zi.m(0.1), since this takes #zi.N(50) we know
    #math.equation(
      $
        50" N" & = k (0.1 " m") \
             k & = (50 "N")/(0.1 " m") \
             k & = 500 "N" "m"^(-1)
      $,
      alt: "50 newtons equals k times point 1 meters. then k is 50 newtons divided by point 1 meters which is 500 newtons per meter.",
      block: true,
    )
    Then a formula for force needed to stretch this spring #acc("x") meters is #math.equation($F=500x$, alt: "f equals 5 hundred x").

  + Using our formula and #math.equation($F=200$, alt: "f equals 2 hundred"),
    #math.equation(
      $
          F & = 500 x \
        200 & = 500 x \
          x & = 0.4 " m"
      $,
      alt: "f equals 500 x then 2 hundred equals 5 hundred times x so x is point 4 meters",
      block: true,
    )
    Remember that this is how far from the spring rest length it is, so we have to add the #zi.m(0.5) to this to get that the spring is #zi.m(0.9).
  + #zi.cm(20) is #zi.m(0.2). Then the work is #math.equation(
      $ W & = integral_a^b F(x) dif x \
        & =integral_0^0.2 500x dif x $,
      alt: "w equals the integral from a to b of f of x d x. this is the integral from 0 to 0 point 2 of 5 hundred x d x.",
      block: true,
    )
  + The trick here is finding the bounds of the integral. #zi.cm(100) is #zi.m(1) and #zi.cm(110) is #zi.m(1.1). We also need to know how far from rest length these distances are: #math.equation($1-0.5=$, alt: "1 minus 0.5 equals") #zi.m(0.5) and #math.equation($1.1-0.5=$, alt: "1 point 1 minus 0.5 equals") #zi.m(0.6). Then, the work done is #math.equation($W = integral_0.5^0.6 500x dif x$, alt: " w equals the integral from point 5 to point 6 of 5 hundred x d x.", block: true)

  + Let #acc("l") be how far the spring was stretched (from rest). Then the work to get it there is
    #math.equation(
      $
        W & = integral_0^l 500 x dif x = 20 " J"
      $,
      alt: " w equals the integral from 0 to l of 5 hundred x d x equals 20 joules",
      block: true,
    )
    Then solving for #acc("l")
    #math.equation(
      $
         20 & = integral_0^l 500 x dif x \
         20 & = 250 x^2 |_0^l \
         20 & = 250 l^2 \
        l^2 & = 2/25 \
          l & = plus.minus sqrt(2)/5
      $,
      alt: "20 equals the integral from 0 to 1 of 500 x d x. then 20 equals 250 x squared evaluated from 0 to l. then 20 equals 250 l squared. then l squared equals 2 over 25 then l equals plus or minus square root of 2 over 5.",
      block: true,
    )
    The spring was stretched an additional #math.equation($sqrt(2)/5$, alt: "square root of 2 over 5")#zi.m().
]


#emph-block[
  6.4 a Section Summary:
  - We used integrals and Riemann sums to describe work done to lift heavy objects and stretch springs.
]
