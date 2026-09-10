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
// todo 1st triangle
// todo flipped uncomfy triangle
Up until now, we don't have a method to evaluate this integral. Looking at a point on the circle we can use trig functions to rewrite the expressions in #acc("x") and #acc("y") into #acc("r") and #acc("theta"). We have a few options, so let's do both and compare.

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: horizon,
  table.header([*Cosine*], [*Sine*]),
  inline_eq($x=r cos(theta)$, "x equals r cosine theta"), inline_eq($x=r sin(theta)$, "x equals r sine theta"),
  inline_eq($dif x = - r sin(theta) dif theta$, "d x equals negative r sine theta d theta"),
  inline_eq($dif x = r cos(theta) dif theta$, "d x equals r cosine theta d theta"),
)


could write #inline_eq($cos(theta)=x/r$, "cosine of theta equals x over r") or #inline_eq($x=r cos(theta)$, "x equals r cosine of theta"). This gives us


Find the area of a circle with radius #acc("r") using techniques of integration.


#emph-block[
  7.3a Section Summary:
]

