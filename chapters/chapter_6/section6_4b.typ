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
      #set document(title: "Section 6.4")
      #context counter(heading).step(level: 2)
      #context counter(heading).step(level: 2)
      #context counter(heading).step(level: 2)
      == Work
    ]
  } else {
    [ #context counter(heading).step(level: 2)
      #context counter(heading).step(level: 2)
      #context counter(heading).step(level: 2)
      #context counter(heading).step(level: 2)]
  }
}
#context counter(heading).step(level: 3)
#context counter(heading).step(level: 3)
#context counter(heading).step(level: 3)
#context counter(heading).step(level: 3)
// any functions and templating you want for just this chapter can go here

#emph-block[
  6.4 b Learning Objectives:
  - I can understand the definitions of work and force.
  - I understand how to use integration to describe work.
  - I can describe the work done when pumping fluids out of containers of varying shapes.
]

Another physical system we can calculate the work done in is when pumping liquids out of a tank.
=== Pumping Liquids
#example[
  A rectangular tank full of water has height #ft(12), width #ft(3), and length #ft(5). Find the work done in pumping all of the water to the top of the tank given that the density of water is #imperialwater.
]
#my-solution-block[
  #figure(image(
    "figures/workrectangletank.svg",
    alt: "a diagram of the rectangular tank described above. the top of the tank is labeled 0 the bottom 12, and midway a layer is highlighted with distance x sub i from the top of the tank and width delta x.",
  ))
  Consider pumping a single layer of water out at a time. The work done to pump the #acc("i")th layer of water out is #math.equation($W_i = F_i d_i$, alt: " w sub i equals f sub i times d sub i"). We will say the #acc("i")th layer has to be pumped #math.equation($x_i$, alt: "x sub i")#ft() out of the tank, and #math.equation($x_i$, alt: "x sub i") goes from 0 to 12.

  Then the force on each layer is the weight of the slice which can be found by multiplying density and volume:
  #math.equation($F_i = #imperialwater V_i$, alt: " F sub i equals 62.4 pounds per cubic foot times v sub i"). Now #math.equation($V_i=(3)(5)(Delta x)$, alt: "v sub i equals 3 times 4 times delta x"), where #math.equation($Delta x$, alt: "delta x") is the height of the slice. Altogether #math.equation($F_i = 62.4(15)Delta x #lb()$, alt: "F sub i equals 62.4 times 15 times delta x pounds").

  Then the work on each slice is #math.equation($W_i = 62.4(15)Delta x x_i #lb()#ft()$, alt: "F sub i equals 62.4 times 15 times delta x pounds").

  The work is then the limit of the sums of the layers
  #math.equation(
    $
      W & = lim_(n arrow infinity) sum_(i=1)^n (62.4)(15) Delta x x_i \
        & = integral_0^12 (15)(62.4) x dif x
    $,
    alt: "W equals the limit as n goes to infinity of the sum from i equals 1 to n of 62.4 times 15 times delta x x sub i. this is the integral from 0 to 12 of fifteen times sixty two point 4 times x, d x.",
    block: true,
  )
]


#example[A tank pictured below is full of water. The density of water is #zi.kg-m3[1000]. Set up the integral to find the work needed to pump the water to a heigh of #zi.m[5] above the top of the tank.
  // figure for triangular prism pumping problem
  #figure(image(
    "figures/triangularprismtank.svg",
    alt: "a picture of a tank that is a triangular prism. The triangular face is towards the viewer and is a right triangle with base length 4 meters and height 3 meters that is also the height of the tank. The length of the prism is 10 meters. A tube 5 meters long sticks out of the front left top corner of the tank.",
  ))
]

#my-solution-block[
  Recall that to find the work done, we consider the work to pump a generic layer of water out, then add all the layers up and take the limit as the number of layers goes to inifinity to get an integral.

  First, we sketch the layer
  #figure(image(
    "figures/triangularprismprob.svg",
    alt: "the tank above with a labeled generic layer. The slice is between 0 and 3 meters with height x sub i. It has to go d sub i meters to get to the top of the 5 meter tube on top of the tank. the width of the layer is delta x.",
    width: 50%,
  ))
  Then, the force on this layer is just gravity, so
  #math.equation(
    $
      F_i & = m_i a \
          & = ("density of water")(V_i)(g) \
          & = (#zi.kg-m3[1000])(V_i)(#zi.m-s2[9.8])
    $,
    alt: "F sub i equals m sub i times a. this is the density of water times v sub i times g. this is one thousand kilograms per meter cubed times v sub i times 9 point 8 meters per second squared.",
    block: true,
  )
  The volume of the slice is a little trickier, we need to use similar triangles to find the side length, #acc("l"), of the box that touches the triangular face in terms of #math.equation($x_i$, alt: "x sub i").

  // todo similar triangle diagram for this one
  We get the following relation for #acc("l").
  #math.equation(
    $
      4/3 & = l/(3-x_i) \
        l & = 4/3 (3-x_i)
    $,
    alt: "4 over 3 equals l over 3 minus x sub i. this means l is four thirds times the quantity 3 minus x sub i.",
    block: true,
  )

  Altogether the volume is
  #math.equation(
    $
      V_i & = l w h \
          & = 4/3 (3-x_i) (10) Delta x
    $,
    alt: "v sub i equals l times w times h which is four thirds times the quantity 3 minus x sub i times ten times delta x.",
    block: true,
  )
  So the force to lift this layer becomes
  #math.equation(
    $
      F_i & = (#zi.kg-m3[1000])4/3 (3-x_i) (10) Delta x(#zi.m-s2[9.8])
    $,
    alt: "f sub i equals one thousand kilograms per meter cubed times four thirds times the quantity 3 minus x sub i times ten times delta x times 9 point 8 meters per second squared",
    block: true,
  )
  The the distance this layer has to travel to get out of the spout at the top is #math.equation($d_i = 8-x_i$, alt: "d sub i equals 8 minus x sub i"), where #math.equation($x_i$, alt: "x sub i") falls between #closedint("0", "3") (since that is where the water is).

  Thus, the work to pump a single layer is
  #math.equation(
    $
      W_i & = (#zi.kg-m3[1000])4/3 (3-x_i) (10) Delta x(#zi.m-s2[9.8]) (8-x_i).
    $,
    alt: "W sub i equals one thousand kilograms per meter cubed times four thirds times the quantity 3 minus x sub i times ten times delta x times 9 point 8 meters per second squared times 8 minus x sub i",
    block: true,
  )
  The sum of the work for each layer gives us an approximation to the total work
  #math.equation(
    $
      W & approx sum_(i=1)^n (#zi.kg-m3[1000])4/3 (3-x_i) (10) Delta x(#zi.m-s2[9.8]) (8-x_i).
    $,
    alt: "W is approximatel the sum from i equals 1 to n of one thousand kilograms per meter cubed times four thirds times the quantity 3 minus x sub i times ten times delta x times 9 point 8 meters per second squared times 8 minus x sub i",
    block: true,
  )
  Then taking the limit of this sum gives us the integral for work
  #math.equation(
    $
      W & = lim_(n arrow infinity) sum_(i=1)^n (1000)4/3 (3-x_i) (10) Delta x(9.8) (8-x_i) \
        & = integral_0^3 (1000)4/3 (3-x) (10) (9.8) (8-x) dif x #zi.J().
    $,
    alt: "W is the limit as n goes to infinity of the sum from i equals 1 to n of one thousand times four thirds times the quantity 3 minus x sub i times ten times delta x times 9 point 8 times 8 minus x sub i. This is equal to the integral from 0 to 3 of one thousand times four thirds times the quantity 3 minus x times ten times 9 point 8 times 8 minus x, d x joules",
    block: true,
  )
  If you want to evaluate this integral, bring constant multiples out of the integral and multiply the binomials in #acc("x") then use power rule.
]


#emph-block[
  6.4 b Section Summary:
  - We used limits of Riemann sums to describe the work done to pump liquids out of tanks.
  - We had to review some formulas for some geometry to finish these problems, like similar triangles and Pythagorean Theorem.
]
