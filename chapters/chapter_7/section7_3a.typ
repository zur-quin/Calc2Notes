// chapter_5.typ

#import "./../../template_notes.typ": *
#import "@preview/diverential:0.3.0": *
#show: template

// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(6)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 7.3a")
      = Integration Techniques
    ]
  }
}

#counter(heading).update(7)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)

// any functions and templating you want for just this chapter can go here

// content
== Trigonometric Substitutions

#emph-block[
  7.3a Learning Objectives
  - I can understand the relationship between right triangles and substitutions.
  - I can draw triangles to represent substitutions.
  - I can understand when and how to use trigonometric substitutions.
]
Suppose we want to derive the formula for area of a circle or radius #acc("r"). We know how to set up the integral for this using area between curves:

#block_eq(
  $A & = integral_(-r)^r underbrace(sqrt(r^2-x^2), "top")-underbrace((-sqrt(r^2-x^2)), "bottom") dif x \
  & = 2 integral_(-r)^r sqrt(r^2-x^2) dif x$,
  "A equals integral from negative r to r of square root of r squared minus x squared minus the negative square root of r squared minus x squared d x. This equals 2 times the integral from minus r to r of square root of r squared minus x squared d x",
)
// todo circle picture with triangle
Up until now, we don't have a method to evaluate this integral. Looking at a point on the circle we can use trig functions to rewrite the expressions in #acc("x") and #acc("y") into #acc("r") and #acc("theta"). We have a few options, so let's do both and compare.

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: center + horizon,
  table.header([*Step*], [*Cosine*], [*Sine*]),
  "substitution",
  inline_eq($x=r cos(theta)$, "x equals r cosine theta"),
  inline_eq($x=r sin(theta)$, "x equals r sine theta"),

  "triangle",
  image(
    "figures/73trianglecos.svg",
    alt: "a triangle with angle theta and hypotenuse r. The opposite side is square root of r squared minus x squared and the adjacent side is x.",
  ),
  image(
    "figures/73trianglesin.svg",
    alt: "a triangle with angle theta and hypotenuse r. The opposite side is x and the adjacent side is square root of r squared minus x squared.",
  ),

  "differential",
  inline_eq($dif x = - r sin(theta) dif theta$, "d x equals negative r sine theta d theta"),
  inline_eq($dif x = r cos(theta) dif theta$, "d x equals r cosine theta d theta"),

  [bounds for #acc("theta")],
  block_eq(
    $x=-r &arrow.double theta = pi\ x=r &arrow.double theta = 0$,
    "when x is negative r, theta is pi and when x is r, theta is 0",
  ),
  inline_eq(
    $x = -r &arrow.double theta = 0\ x=r &arrow.double theta = pi/2$,
    "when x is negative r, theta is 0 and when x is r, theta is pi over 2.",
  ),

  [integral after trig sub\ steps below!],
  block_eq(
    $2 integral_pi^0 r sin(theta)(-r sin(theta)) dif theta$,
    "2 times the integral from pi to 0 of r sine theta times negative r sine theta d theta.",
  ),
  block_eq(
    $2 integral_0^(pi/2) r cos(theta)r cos(theta) dif theta$,
    "2 times the integral from 0 to pi over 2 of r cosine theta times r cosine theta d theta.",
  ),

  [integral after trig identity],
  block_eq($2 r^2 (-1)integral_pi^0 1/2(1-cos(2theta)) dif theta$, "d"),
  block_eq($2 r^2 integral_0^(pi/2) 1/2 (1+cos(2 theta)) dif theta$, "a"),

  [Observations],
  table.cell(
    [
      - bounds are flipped
      - extra negatives
    ],
    align: left + horizon,
  ),
  table.cell(
    [
      - the bounds are least to greatest
      - there are no extra negatives
    ],
    align: left + horizon,
  ),
)

For #inline_eq($x=r sin(theta)$, "x equals r sine theta") we get #inline_eq($dif x = r cos(theta) dif theta$, "d x equals r cosine theta d theta"). We have to solve little equations for #acc("theta") to get our new bounds.
// todo bounds
Then the integral becomes
#block_eq(
  $A & = 2 integral_(-r)^r sqrt(r^2-x^2) dif x \
  & = 2 integral_0^(pi/2) sqrt(r^2-(r sin(theta))^2) (r cos(theta)) dif theta\
  & = 2 integral_0^(pi/2) sqrt(r^2-r^2 sin^2(theta)) (r cos(theta)) dif theta\
  & = 2 integral_0^(pi/2) sqrt(r^2(1-sin^2(theta))) (r cos(theta)) dif theta \
  & = 2 integral_0^(pi/2) sqrt(r^2 cos^2(theta)) (r cos(theta)) dif theta \
  & = 2 integral_0^(pi/2) r |cos(theta)| (r cos(theta)) dif theta \
  & = 2 integral_0^(pi/2) r^2 cos^2(theta) dif theta \
  & = 2 integral_0^(pi/2) r^2 [1/2 (1+cos(2 theta))] dif theta\
  & = r^2 integral_0^(pi/2) (1+cos(2 theta)) dif theta$,
  "A equals ",
)

Ultimately, either substitution *could* work *if you are careful enough*. However, we will just show the substitutions and patterns for the trig subs that don't give extra minus signs. If you are still confused on why we do things in the order we do them, please come chat in office hours about it! (It honestly took me a while to figure this out myself!)


could write #inline_eq($cos(theta)=x/r$, "cosine of theta equals x over r") or #inline_eq($x=r cos(theta)$, "x equals r cosine of theta"). This gives us


Find the area of a circle with radius #acc("r") using techniques of integration.


#emph-block[
  7.3a Section Summary:
]

