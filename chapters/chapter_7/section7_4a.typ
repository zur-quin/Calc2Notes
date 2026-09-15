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
    [ #set document(title: "Section 7.4a")
      = Integration Techniques

    ]
  }
}
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
== Integration by Partial Fractions


// any functions and templating you want for just this chapter can go here

// content
#emph-block[
  7.4a Learning Objectives
  - I can understand how to rewrite rational functions as a sum of partial fractions.
  - I can understand when and how to integrate by partial fractions.
]

=== Motivation
How can we rewrite the function $f(x)=1/(x-4)-1/(x-5)$?

$
  f(x) & = 1/(x-4) - 1/(x-5) \
       & = (x-5)/((x-4)(x-5)) - (x-4)/((x-4)(x-5)) \
       & = (x-5-x+4)/((x-4)(x-5)) \
       & = (-1)/((x-4)(x-5))
$
Which is easier to take the integral of:
$
  1/(x-4)-1/(x-5) " or " (-1)/((x-4)(x-5))"?"
$
The difference on the left is easier to take the integral of.

So, if we are asked to integrate the expression on the right, it would be nice to rewrite it as the expression on the left first. This process of rewriting a rational function as a sum of "simpler" rational functions is called partial fraction decomposition.

=== Partial Fraction Decomposition

#theorem[Fundamental Theorem of Algebra][
  If #inline_eq($P(x)$, "p of x") is a polynomial with real coefficients, then #acc("P") can be factored into linear #inline_eq($(a x + b)$, "a x plus b") and irreducible quadratic #inline_eq($(a x^2 + b x + c)$, "a x squared plus b x plus c") factors.
  #block_eq(
    $P(x)=underbrace((a_1 x + b_1)...(a_n x + b_n), "linear")underbrace((A_1 x^2 + B_1 x + C_1)...(A_m x^2 + B_m x + C_m), "quadratic")$,
    "P of x equals a one x plus b one times dot dot dot times a n x plus b n times a one x squared plus b one x plus c one times dot dot dot a m x squared plus b m x plus c m.",
  )
]

*Idea*:

Say $f(x) = (P(x))/(Q(x))$ where $P$ and $Q$ are polynomials. Then, we can factor the denominator, $Q(x)$, into its linear and quadratic terms:
$
  Q(x) = (a_1 x + b_1)...(a_n x + b_n)(A_1 x^2 + B_1 x + C_1)...(A_m x^2 + B_m x + C_m)
$
Then we can write $f(x)$ as:
$
  f(x) = S(x) + J_1/(a_1 x + b_1)+...+J_2/(a_n x + b_n)+K_1/(A_1 x^2 + B_1 x + C_1)+...+J_2/(A_m x^2 + B_m x + C_m)
$
where $S(x)$ is a polynomial.

More precisiely, the steps you can use are as follows.
#tip-block[
  *General process for decomposing a rational function into its partial fractions.*

  + If $f(x)=(P(x))/(Q(x))$ is not _proper_ ($deg P(x) gt.eq deg Q(x)$) then use polynomial long division to find
    $
      f(x) = S(x) + (R(x))/(Q(x)), " with " deg R(x) < deg Q(x)
    $
  + Then, if $(R(x))/(Q(x))$ cannot be integrated as is, factor $Q(x)$ into linear and quadratic irreducible terms.
  + Split $(R(x))/(Q(x))$ into its sum of partial fractions with unknown numerators.
    #figure(table(
      columns: (auto, auto),
      inset: 10pt,
      align: center + horizon,
      table.header([*Factor in $Q(x)$*], [*Sum of Partial Fractions*]),
      $ (a x+b)^m $, $ A_1/(a x + b) + A_2/(a x + b)^2 + ...+ A_m/(a x + b)^m $,
      $ (a x^2 + b x + c)^n $,
      $ (B_1 x + C_1)/(a x^2 + b x + c)+(B_2 x+C_2)/(a x^2 + b x + c)^2+...\ +(B_m x + C_m)/(a x^2 + b x + c)^m $,
    ))
  + Solve for the numerators.
    + Set original fraction equal to the sum of partial fractions.
    + Multiply both sides by $Q(x)$.
    + Solve for unknown constants using a system of equations and/or plugging in some $x$ values.
]

#example[
  Use polynomial long division to rewrite $ f(x) = (x^4+3x^3+5x+6)/(x+2) $ then evaluate $ integral f(x) dif x $.
]
#my-solution-block[
  #let result = poly-div((1, 3, 0, 5, 6), (1, 2))
  // todo get long div and auto-alt to work together
  // #math.equation(
  //   $
  //     result.working
  //   $,
  //   alt: "long division for the problem",
  //   block: true,
  // )
  So,
  $
    result.dividend/(result.divisor) = (result.quotient) + (result.remainder)/(result.divisor)
  $
  Then, with a quick and small $u$-sub,
  $
    integral result.dividend/(result.divisor) dif x & = integral (result.quotient) dif x + integral (result.remainder)/(result.divisor) dif x \
    & = x^4/4 + x^3/3 - x^2 + 9 x -12 ln|x+2| + C
  $
]

#example[
  Set up the partial fraction decomposition for this rational function, but you do not need to find the coefficients of the terms in the numerators.
  $
    (P(x))/( (x-1)^3 (2x-3) (x^2 + 2x + 15)^2 )
  $
]
#my-solution-block[
  We first check the quadratic term is actually irreducible: since $b^2-4 a c = 4-4(1)(15) < 0$, this is irreducible.
  Then, we have
  $
    (P(x))/( (x-1)^3 (2x-3) (x^2 + 2x + 15)^2 ) =\ A/(x-1) + B/(x-1)^2 + C/(x-1)^3 + D/(2x-3) + (E x + F)/(x^2 + 2x + 15) + (G x + H)/((x^2 + 2x + 15)^2)
  $
]



#emph-block[
  7.4a Section Summary:
]

