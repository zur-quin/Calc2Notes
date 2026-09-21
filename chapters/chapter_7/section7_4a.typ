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
    [ #set document(title: "Section 7.3b")
      = Integration Techniques
    ]
  }
}

#counter(heading).update(7)
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
How can we rewrite the function #auto-alt($f(x)=1/(x-4)-1/(x-5)$)?

#auto-alt(
  $
    f(x) & = 1/(x-4) - 1/(x-5) \
         & = (x-5)/((x-4)(x-5)) - (x-4)/((x-4)(x-5)) \
         & = (x-5-x+4)/((x-4)(x-5)) \
         & = (-1)/((x-4)(x-5))
  $,
)
Which is easier to take the integral of:
#auto-alt(
  $
    1/(x-4)-1/(x-5) " or " (-1)/((x-4)(x-5))"?"
  $,
)
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

Say #auto-alt($f(x) = (P(x))/(Q(x))$) where #auto-alt($P$) and #auto-alt($Q$) are polynomials. Then, we can factor the denominator, #auto-alt($Q(x)$), into its linear and quadratic terms:
#auto-alt(
  $
    Q(x) = (a_1 x + b_1)...(a_n x + b_n)(A_1 x^2 + B_1 x + C_1)...(A_m x^2 + B_m x + C_m)
  $,
)
Then we can write #auto-alt($f(x)$) as:
#auto-alt(
  $
    f(x) = S(x) + J_1/(a_1 x + b_1)+...+J_2/(a_n x + b_n)+K_1/(A_1 x^2 + B_1 x + C_1)+...+J_2/(A_m x^2 + B_m x + C_m)
  $,
)
where #auto-alt($S(x)$) is a polynomial.

More precisely, the steps you can use are as follows.
#tip-block[
  *General process for decomposing a rational function into its partial fractions.*

  + If #auto-alt($f(x)=(P(x))/(Q(x))$) is not _proper_ (#auto-alt($deg P(x) gt.eq deg Q(x)$)) then use polynomial long division to find
    #auto-alt(
      $
        f(x) = S(x) + (R(x))/(Q(x)), " with " deg R(x) < deg Q(x)
      $,
    )
  + Then, if #auto-alt($(R(x))/(Q(x))$) cannot be integrated as is, factor #auto-alt($Q(x)$) into linear and quadratic irreducible terms.
  + Split #auto-alt($(R(x))/(Q(x))$) into its sum of partial fractions with unknown numerators.
    #figure(table(
      columns: (auto, auto),
      inset: 10pt,
      align: center + horizon,
      table.header([*Factor in #auto-alt($Q(x)$)*], [*Sum of Partial Fractions*]),
      auto-alt($ (a x+b)^m $), auto-alt($ A_1/(a x + b) + A_2/(a x + b)^2 + ...+ A_m/(a x + b)^m $),
      auto-alt($ (a x^2 + b x + c)^n $),
      auto-alt(
        $ (B_1 x + C_1)/(a x^2 + b x + c)+(B_2 x+C_2)/(a x^2 + b x + c)^2+...\ +(B_m x + C_m)/(a x^2 + b x + c)^m $,
      ),
    ))
  + Solve for the numerators.
    + Set original fraction equal to the sum of partial fractions.
    + Multiply both sides by #auto-alt($Q(x)$).
    + Solve for unknown constants using a system of equations and/or plugging in some #auto-alt($x$) values.
]

#example[
  Use polynomial long division to rewrite #auto-alt($ f(x) = (x^4+3x^3+5x+6)/(x+2) $) then evaluate #auto-alt($ integral f(x) dif x $).
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
  #auto-alt(
    $
      result.dividend/(result.divisor) = (result.quotient) + (result.remainder)/(result.divisor)
    $,
  )
  Then, with a quick and small #auto-alt($u$)-sub,
  #auto-alt(
    $
      integral result.dividend/(result.divisor) dif x & = integral (result.quotient) dif x + integral (result.remainder)/(result.divisor) dif x \
      & = x^4/4 + x^3/3 - x^2 + 9 x -12 ln|x+2| + C
    $,
  )
]

#example[
  Set up the partial fraction decomposition for this rational function, but you do not need to find the coefficients of the terms in the numerators.
  #auto-alt(
    $
      (P(x))/( (x-1)^3 (2x-3) (x^2 + 2x + 15)^2 )
    $,
  )
]
#my-solution-block[
  We first check the quadratic term is actually irreducible: since #auto-alt($b^2-4 a c = 4-4(1)(15) < 0$), this is irreducible, and we do not need to further factor it.

  Then, we have
  #auto-alt(
    $
      (P(x))/( (x-1)^3 (2x-3) (x^2 + 2x + 15)^2 ) =\ A/(x-1) + B/(x-1)^2 + C/(x-1)^3 + D/(2x-3) + (E x + F)/(x^2 + 2x + 15) + (G x + H)/((x^2 + 2x + 15)^2)
    $,
  )
]

#example[
  Do the partial fraction decomposition on the following rational function.
  #auto-alt(
    $
      (x^2+2x-1)/(x(2x-1)(x+2))
    $,
  )
]
#my-solution-block[
  Each factor in the denominator is linear and has a power of 1. So, the partial fractions are in the form
  #auto-alt(
    $
      (x^2+2x-1)/(x(2x-1)(x+2)) = A/x + B/(2x-1) + C/(x+2)
    $,
  )
  and we need to determine #auto-alt($A,B,C$). Then,
  #auto-alt(
    $
                   && (x(2x-1)(x+2)) (x^2+2x-1)/(x(2x-1)(x+2)) & =( A/x + B/(2x-1) + C/(x+2) ) (x(2x-1)(x+2)) \
      arrow.double &&                               (x^2+2x-1) & = A(2x-1)(x+2) + B x(x+2) + C x (2x-1)
    $,
  )
  Now we can carefully plug in values to help us find #auto-alt($A,B,C$). First, if #auto-alt($x=1/2$) notice
  #auto-alt(
    $
      ((1/2)^2+2(1/2)-1) & = A(2(1/2)-1)((1/2)+2) + B (1/2)((1/2)+2) + C (1/2) (2(1/2)-1) \
                     1/4 & = B(1/2)(5/2) \
                       B & = 1/4(2)(2/5) \
                       B & = 1/5
    $,
  )
  If #auto-alt($x=0$) notice
  #auto-alt(
    $
      ((0)^2+2(0)-1) & = A(2(0)-1)((0)+2) + B (0)((0)+2) + C (0) (2(0)-1) \
                  -1 & = A(1)(2) \
                   A & = -1/2
    $,
  )
  and if #auto-alt($x=-2$) we have
  #auto-alt(
    $
      ((-2)^2+2(-2)-1) & = A(2(-2)-1)((-2)+2) + B (-2)((-2)+2) + C (-2) (2(-2)-1) \
                    -1 & = C(-2)(-5) \
                     C & = -1/10
    $,
  )
  Then the partial fraction decomposition is
  #auto-alt(
    $
      (x^2+2x-1)/(x(2x-1)(x+2)) = (-1/2)/x + (1/5)/(2x-1) + (-1/10)/(x+2).
    $,
  )
]

=== Integrals Needing Partial Fraction Decomposition

#example[
  Find the antiderivative
  #auto-alt(
    $
      integral (2 x^3 -x^2 + 4x)/(x^4 + 4x^2) dif x
    $,
  )
]

#my-solution-block[
  First we factor and simplify everything we can
  #auto-alt(
    $
      integral (2 x^3 -x^2 + 4x)/(x^4 + 4x^2) dif x & = integral (x(2 x^2 -x + 4))/(x^2(x^2 + 4)) dif x \
                                                    & = integral (2 x^2 -x + 4)/(x(x^2 + 4)) dif x \
    $,
  )
  Then we find the partial fraction decomposition of the integrand. Since the #auto-alt($x^2+4$) factor has discriminant #auto-alt($0^2-4(1)(4)=-16<0$) it is irreducible. Then, the form of the partial fraction decomposition is
  #auto-alt(
    $
      (2 x^2 -x + 4)/(x(x^2 + 4)) & = A/x + (B x + C)/(x^2+4)
    $,
  )
  Multiplying by the denominator gives us
  #auto-alt(
    $
      (2 x^2 -x + 4) & =(x(x^2 + 4)) A/x + (x(x^2 + 4)) (B x + C)/(x^2+4) \
      (2 x^2 -x + 4) & = (x^2 + 4) A + x(B x + C) \
    $,
  )
  // When $x=0$ we can tell
  // $
  //   (2 (0)^2 -(0) + 4) & = ((0)^2 + 4) A + (0)(B (0) + C) \
  //                    4 & = 4 A \
  //                    A & = 1
  // $
  We need a slightly new strategy for #auto-alt($B,C$) since the roots of #auto-alt($x^2+4$) are complex, we will use this strategy for finding #auto-alt($A$) also, but it isn't necessary. Multiplying things out
  #auto-alt(
    $
      (2 x^2 -x + 4) & = (x^2 + 4) A + x(B x + C) \
       2 x^2 - x + 4 & = A x^2 + 4A + B x^2 + C x \
       2 x^2 - x + 4 & = (A+B) x^2 + C x + 4 A
    $,
  )
  Now lining up like powers on both sides we see that
  #auto-alt(
    $
      2 x^2 underline(- x) + 4 & = (A+B) x^2 + underline(C x) + 4A \
               arrow.double -1 & = C
    $,
  )
  Then we see
  #auto-alt(
    $
      2 x^2 - x + underline(4) & = (1+B) x^2 + C x + underline(4 A) \
                arrow.double 1 & = A
    $,
  )
  and lastly,
  #auto-alt(
    $
      underline(2 x^2) - x + 4 & = underline((A+B) x^2) + C x + 4 A \
                arrow.double 2 & = A+B \
                arrow.double 2 & = 1 + B \
                arrow.double 1 & = B.
    $,
  )
  So then the integral becomes
  #auto-alt(
    $
      integral (2 x^2 -x + 4)/(x(x^2 + 4)) & = integral A/x dif x + integral (B x + C)/(x^2+4) dif x \
                                           & = integral 1/x dif x + integral (1 x - 1)/(x^2+4) dif x \
                                           & = integral 1/x dif x + integral (x)/(x^2+4) dif x - integral 1/(x^2+4) dif x \
    $,
  )
  We can solve these integrals with either known antiderivatives or #auto-alt($u$)-substitution.
  #auto-alt(
    $
      integral 1/x dif x & = ln|x| + C
    $,
  )
  And with #auto-alt($u=x/2$) and some factoring we have
  #auto-alt(
    $
      integral 1/(x^2+4) dif x & = integral 1/((4)((x/2)^2+1)) dif x \
                               & = 1/4 integral 1/(u^2 + 1) 2 dif u \
                               & = 1/2 integral 1/(u^2 + 1) dif u \
                               & = 1/2 integral 1/(u^2 + 1) dif u \
                               & = 1/2 arctan(u) + C \
                               & = 1/2 arctan(x/2) + C \
    $,
  )
  and with #auto-alt($u=x^2 + 4$), #auto-alt($dif u = 2 x dif x$) we have
  #auto-alt(
    $
      integral (x)/(x^2+4) dif x & = 1/2 integral 1/u dif u \
                                 & = 1/2 ln|u| +C \
                                 & = 1/2 ln|x^2+4| + C
    $,
  )
  Thus,
  #auto-alt(
    $
      integral (2 x^2 -x + 4)/(x(x^2 + 4)) & = integral 1/x dif x + integral (x)/(x^2+4) dif x - integral 1/(x^2+4) dif x \
                                           & = ln|x| + 1/2 ln|x^2+4| -1/2 arctan(x/2)+C.
    $,
  )
]

We'll get plenty more practice (and with more complicated problems) in 7.4b.

#emph-block[
  7.4a Section Summary:
  - We mostly had an algebra lesson, motivated by a need to take integrals.
  - We can rewrite rational functions with partial fraction decomposition. Then we started using this as a trick for evaluating integrals.
]

