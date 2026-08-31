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

// figure for triangular prism pumping problem
#figure(image("figures/triangularprismtank.svg", alt: "a picture of a tank that is a triangular prism"))

#figure(image(
  "figures/triangularprismprob.svg",
  alt: "the tank above with a labeled generic layer to pump out of the top",
))

#emph-block[
  6.4 b Section Summary:
]
