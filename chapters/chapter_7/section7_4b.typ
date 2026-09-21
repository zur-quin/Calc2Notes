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
    [ #set document(title: "Section 7.4b")
      = Integration Techniques
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Partial Fraction Decomposition
      #counter(heading).step(level: 3)
      #counter(heading).step(level: 3)
      === Integrals Needing Partial Fraction Decomposition (Continued)
    ]
  } else if (
    sys.inputs.at("html-frames", default: "false") == "true"
      and sys.inputs.at("individualchs", default: "false") == "true"
  ) {
    [ // if single html still print the stuff
      #counter(heading).update(7)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 3)
      #counter(heading).step(level: 3)
      === Integrals Needing Partial Fraction Decomposition (Continued)
    ]
  } else {
    // main html
    [
      #counter(heading).update(7)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 3)
      #counter(heading).step(level: 3)
      #counter(heading).step(level: 3)
    ]
  }
}

// any functions and templating you want for just this chapter can go here

// content
#emph-block[
  7.4b Learning Objectives
  - I can use partial fraction decomposition to help me solve integrals.
]

#example[
  Compute the following antiderivative
  #auto-alt($ integral (3e^(2x) - 5 e^(3x))/((3e^x-1)(e^x-1)^2) dif x $))
]

#note-block[
  If you feel like you need to review exponent rules do that, note
  #auto-alt(
    $
      e^(3x)=e^(2x) e^x
    $,
  )
  for example.
]

#my-solution-block[
  First, it looks like #auto-alt($e^x$) is everywhere, so we will do a quick #auto-alt($u$)-substitution with #auto-alt($u=e^x$). Then #auto-alt($dif u = e^x dif x$)
  #auto-alt(
    $
      integral (3e^(2x) - 5 e^(3x))/((3e^x-1)(e^x-1)^2) dif x & = integral (3e^(x) - 5 e^(2x))/((3e^x-1)(e^x-1)^2) e^x dif x \
                                                              & = integral (3u - 5 u^2)/((3u-1)(u-1)^2) dif u \
    $,
  )
  Now, this integral needs a partial fraction decomposition. The denominator is already factored into all linear terms so the form of the partial fractions is
  #auto-alt(
    $
      (3u - 5 u^2)/((3u-1)(u-1)^2) & = A/(3u-1) + B/(u-1) + C/(u-1)^2
    $,
  )
  Multiplying everything by the common denominator
  #auto-alt(
    $
      (3u - 5 u^2)/((3u-1)(u-1)^2) ((3u-1)(u-1)^2) & =( A/(3u-1) + B/(u-1) + C/(u-1)^2 )((3u-1)(u-1)^2) \
                                        3u - 5 u^2 & = A(u-1)^2 + B(u-1)(3u-1) + C(3u-1) \
    $,
  )
  We can find #auto-alt($A,C$) easily by plugging in values #auto-alt($u=1,u=1/3$) but will have to deal with #auto-alt($B$) another way. Then, for #auto-alt($u=1$)
  #auto-alt(
    $
      3(1) - 5 (1)^2 & = A((1)-1)^2 + B((1)-1)(3(1)-1) + C(3(1)-1) \
                  -2 & = 2C \
    $,
  )
  so #auto-alt($C=-1$). Then
  #auto-alt(
    $
      3(1/3) - 5 (1/3)^2 & = A((1/3)-1)^2 + B((1/3)-1)(3(1/3)-1) + C(3(1/3)-1) \
                     4/9 & = 4/9 A \
    $,
  )
  so #auto-alt($A=1$). Then plugging in #auto-alt($A,C$) we have
  #auto-alt(
    $
      3u - 5 u^2 & = (u-1)^2 + B(u-1)(3u-1) - (3u-1) \
    $,
  )
  Since we only need to find one of the coefficients still, we can plug in any value for #auto-alt($u$) we haven't used here and solve for #auto-alt($B$). Let's do #auto-alt($u=-1$). Then,
  #auto-alt(
    $
      3(-1) - 5 (-1)^2 & = ((-1)-1)^2 + B((-1)-1)(3(-1)-1) - (3(-1)-1) \
                    -8 & = 4 + B(-2)(-4)-(-4) \
                    -8 & = 4 + 8B + 4 \
                   -16 & = 8B
    $,
  )
  so #auto-alt($B=-2$).
  Then, the integrand becomes
  #auto-alt(
    $
      integral (3e^(2x) - 5 e^(3x))/((3e^x-1)(e^x-1)^2) dif x & = integral A/(3u-1) + B/(u-1) + C/(u-1)^2 dif u \
      & = integral 1/(3u-1) -2 1/(u-1) - 1/(u-1)^2 dif u \
      & = integral 1/(3u-1) dif u -2 integral 1/(u-1) dif u - integral 1/(u-1)^2 dif u
    $,
  )
  We can solve each of these new integrals with a small substitution.
  First, let #auto-alt($w=3u-1$) then #auto-alt($dif w = 3 dif u$) and so
  #auto-alt(
    $
      integral 1/(3u-1) dif u & = 1/3 integral 1/w dif w \
                              & = 1/3 ln|w| \
                              & = 1/3 ln|3u-1| \
                              & = 1/3 ln|3e^x - 1|,
    $,
  )
  where we might as well get back to #auto-alt($x$) while we are here. Then with #auto-alt($y=u-1$) so #auto-alt($dif y = dif u$) the second integral becomes
  #auto-alt(
    $
      -2 integral 1/(u-1) dif u & = -2 integral 1/y dif y \
                                & = -2 ln|y| \
                                & = -2 ln|u-1| \
                                & = -2 ln|e^x-1|.
    $,
  )
  Lastly, with #auto-alt($z=u-1$) so #auto-alt($dif z = dif u$) the last integral becomes
  #auto-alt(
    $
      -integral 1/(u-1)^2 & = -integral z^(-2) dif z \
                          & = - 1/(-1) z^(-1) \
                          & = 1/z \
                          & = 1/(u-1) \
                          & = 1/(e^x -1)
    $,
  )
  Altogether our final answer is
  #auto-alt(
    $
      integral (3e^(2x) - 5 e^(3x))/((3e^x-1)(e^x-1)^2) dif x & = 1/3 ln|3e^x - 1| -2 ln|e^x-1|+1/(e^x -1) + C.
    $,
  )
]

There are no extra considerations needed for the bounds of these integrals. If you end up needing a substitution, change the bounds accordingly and so on.
#exercise[
  Evaluate #auto-alt($ integral_3^6 (2x^3-x^2+4x)/(x^4+4x^2) $)
  (You do not need to evaluate any complicated functions at the end.)
]

#example[
  Compute the following antiderivative
  #auto-alt(
    $
      integral (x^4+2x^2 + 1)/(x-1) dif x
    $,
  )
]

#my-solution-block[
  First, #auto-alt($deg "numerator" gt.eq deg "denominator"$) so we have to do polynomial long division first.
  #let result = poly-div((1, 0, 2, 0, 1), (1, -1))
  // todo get long div and auto-alt to work together
  // #math.equation(
  //   #auto-alt($
  //     result.working
  //   $),
  //   alt: "long division for the problem",
  //   block: true,
  // )

  So,
  #auto-alt(
    $
      result.dividend/(result.divisor) = (result.quotient) + (result.remainder)/(result.divisor)
    $,
  )
  Then
  #auto-alt(
    $
      integral result.dividend/(result.divisor)dif x & = integral (result.quotient)dif x + integral (result.remainder)/(result.divisor) dif x \
      & = x^4/4 + x^3/3 + 3/2 x^2 + 3x + 4 ln|x-1| + C
    $,
  )
]

#emph-block[
  7.4b Section Summary:
  - We solved a lot of integrals using partial fraction decomposition.
]

