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
    [ #set document(title: "Section 7.2")
      = Integration Techniques
    ]
  }
}

#counter(heading).update(7)
#counter(heading).step(level: 2)
#counter(heading).step(level: 3)
#counter(heading).step(level: 3)

// any functions and templating you want for just this chapter can go here

// content
== Trigonometric Integrals

#emph-block[
  7.2 Learning Objectives
  - I combine methods from previous sections to find general strategies to solve trigonometric integrals.
]

#example[
  #inline_eq($integral cos^3(x) dif x$, "integral cosine cubed of x, d x")
]

#note-block[
  With our current techniques, we can try to recognize what function has a derivative of this, try a #acc("u")-substitution, or integration by parts (or reduction formula). We don't clearly know this antiderivative, and we can't use #acc("u")-sub because there isn't a spot for d#acc("u"). Lastly, we could try integrating by parts and/or reduction formula, but that will be incredibly tedious. Let's try the alternative in the solution below.
]

Whenever we see a power of #inline_eq($cos(x)$, "cosine of x") (or #inline_eq($sin(x)$, "sine of x")) of 2 or more we can try to use the Pythagorean Identity:

#theorem[Pythagorean Identity][
  For any angle #acc("x") we have
  #block_eq($sin^2(x)+cos^2(x)=1$, "sine squared of x plus cosine squared of x equals 1")
  This can be rearranged by dividing by #inline_eq($sin^2(x)$, "sine squared of x") or #inline_eq($cos^2(x)$, "cosine squared of x"):
  #block_eq($1 + cot^2(x) = csc^2(x)$, "1 plus tangent squared x equals coseceant squared x")
  and
  #block_eq($tan^2(x) + 1 = sec^2(x).$, "tangent squared x plus 1 equals secant squared x")
]


#my-solution-block[
  Recall the Pythagorean Identity #inline_eq($sin^2(x)+cos^2(x)=1$, "sine squared of x plus cosine squared of x equals 1"), rearranging this we can write #inline_eq($cos^2(x)=1-sin^2(x)$, "cosine squared of x equals 1 minus sine squared of x"). Then using this in the integral we have
  #block_eq(
    $integral cos^3(x) dif x & = integral cos^2(x) cos(x) dif x \
    & = integral (1-sin^2(x)) cos(x) dif x$,
    "integral cosine cubed of x, d x equals the integral of cosine squared x times cosine of x d x. This equals the integral of 1 minus sine squared x all times cosine of x, d x.",
  )
  This might look more complicated at first, but now if we tried a #acc("u")-sub it will work!
  Let #inline_eq($u = sin(x)$, "u equals sine of x"), then #inline_eq($dif u = cos(x) dif x$, "d u equals cosine of x d x."), so the integral becomes
  #block_eq(
    $integral (1-sin^2(x)) cos(x) dif x & = integral 1-u^2 dif u \
    & = u-(u^3)/3 \
    & = sin(x)-(sin^3(x))/3$,
    "integral of 1 minus sine squared x all times cosine of x, d x equals integral of 1 minus u squared d u. This is then u minus u cubed over 3. This is then sine of x minus sine cubed of x over 3 plus c",
  )
]
Let's check our answer by taking its derivative:
#block_eq(
  $dv(, x) sin(x)-sin^3(x)/3 & = cos(x) - sin^2(x)cos(x)\
  & = cos(x)(1-sin^2(x)) \
  & = cos(x) cos^2(x) \
  & = cos^3(x)$,
  "d by d x of sine of x minus sine cubed of x over 3 is cosine of x minus sine squared x times cosine of x. This is cosine of x times 1 minus sine squared of x. This is cosine of x times cosine squared x. This is cosine cubed x.",
)
Note we used the same Pythagorean Identity here to get back to the same thing we started with.

#warning-block[
  In this section and on its WebAssign problems you may have to use other trigonometric identities. It is good to remember these exist every now and then, and practice using them, but having you memorize too many of these is not worth your time and energy.

  You are expected to know the Pythagorean identity and alternative versions of it, but any other identity you need you may look up. Examples include the half angle and double angle formulas, and product to sum formulas, etc.
]

Notice in the above problem that in our #acc("u")-sub, it was nice to have everything in terms of 1 trig function (#inline_eq($sin(x)$, "sine of x") in the above example), except a single multiple of the other trig function times d#acc("x") (#inline_eq($cos(x)$, "cosine of x") in the above example). Then the first variable can be our #acc("u"). We will repeat this technique below, getting rid of most of one trig function except something to work for d#acc("u"). This takes a lot of practice and trial and error to get good at, make sure to try things and be okay failing and trying again.

#example[
  Find #block_eq($integral_0^(pi/2) sin^5(x)cos^2(x) dif x.$, "the integral from 0 to pi over 2 of sine to the fifth x times cosine squared x, d x")
]

Because we need 1 trig function left over for d#acc("u"), and the power of #inline_eq($sin(x)$, "sine of x") is odd, we can leave 1 #inline_eq($sin(x)$, "sine of x") alone, and replace the other 4 powers with #inline_eq($cos(x)$, "cosine of x") through the Pythagorean identity.

#my-solution-block[
  #block_eq(
    $integral_0^(pi/2) sin^5(x)cos^2(x) dif x & = integral_0^(pi/2) sin^4(x) sin(x) cos^2(x) dif x \
    & = integral_0^(pi/2) (1-cos^2(x))^2 sin(x) cos^2(x) dif x$,
    "the integral from 0 to pi over 2 of sine to the fifth x times cosine squared x, d x equals the integral from 0 to pi over 2 of sine to the fourth x times sine of x times cosine squared x, d x. This is the integral from 0 to pi over 2 of 1 minus cosine squared of x squared times sine of x times cosine squared of x.",
  )
  And now a #acc("u")-sub works! Let #inline_eq($u=cos(x)$, "u equal cosine of x"), then #inline_eq($dif u = - sin(x) dif x$, "d u equals negative sine of x d x"), and #inline_eq($u(0)=1$, "u at 0 is 1") and #inline_eq($u(pi/2)=0$, "u of pi over 2 is 0").

  So we have
  #block_eq(
    $integral_0^(pi/2) (1-cos^2(x))^2 sin(x) cos^2(x) dif x & = integral_1^0 (1-u^2)^2 u^2 (-1) dif u\
    & = integral_0^1 (1-u^2)^2 u^2 dif u \
    & = integral_0^1 u^2-2u^4+u^6 dif u \
    & = [(u^3)/3 - 2/5 u^5 + (u^7)/7]_0^1\
    & = 1/3 - 2/5 + 1/7$,
    "integral from 0 to pi over 2 of 1 minus cosine squared of x squared times sine of x times cosine squared of x equals the integral from 1 to 0 of the square of 1 minus u squared times u squared times -1 d u. This is the integral from 0 to 1 of the square of 1 minus u squared times u squared d u. This is the integral from 0 to 1 of u squared minus 2 u to the fourth plus u to the sixth. This is u cubed over 3 minus 2 fifths u to the fifth plus u to the seventh over 7 evaluated from 0 to 1. This is one third minus 2 fifths plus one seventh.",
  )
]

#example[
  Find #block_eq($integral sin^2(x) cos^2(x) dif x.$, "integral sine squared of x times cosine squared x d x.")
]

Here, we have an even number on both exponents, so using the Pythagorean identity wouldn't leave anything for d#acc("u") at the end of the rearranging. We need a new strategy.

#theorem[Double Angle Formula][
  For any angle #acc("x") we have
  #block_eq($cos^2(x) = 1/2 (1 + cos(2x))$, "cosine squared of x equals one half times 1 plus cosine of 2 x.")
  and
  #block_eq($sin^2(x) = 1/2 (1-cos(2x))$, "sine squared of x equals one half times 1 minus cosine of 2 x.")
]

#my-solution-block[
  When we use double andgle formula, we might have to simplify a lot and try the formula again.
  #block_eq(
    $integral sin^2(x) cos^2(x) dif x & = integral 1/2 (1-cos(2x)) 1/2 (1 + cos(2x)) dif x \
    & = 1/4 integral 1 - cos^2(2x) dif x$,
    "integral sine squared of x times cosine squared x d x equals the integral of one half times 1 plus cosine of 2 x times one half times 1 minus cosine of 2 x d x. This becomes one quarter of the integral of 1 minus cosine squared of 2 x, d x.",
  )
  Then we have to use double angle formula again.
  #block_eq(
    $integral sin^2(x) cos^2(x) dif x & = 1/4 integral 1 - cos^2(2x) dif x\
    & = 1/4 integral 1 - 1/2 (1 + cos(4x)) dif x \
    & = 1/4 integral 1- 1/2 - cos(4x) dif x$,
    "integral sine squared of x times cosine squared x d x equals one quarter of the integral of 1 minus cosine squared of 2 x, d x. This becomes one quarter the integral of 1 minus one half of 1 plus cosine 4 x d x. This becomes one quarter the integral of 1 minus a half minus cosine of 4 x d x.",
  )
  Then let #inline_eq($u= 4x$, " u equals 4 x"), #inline_eq($dif u = 4 dif x$, "d u equals 4 d x.") so
  #block_eq(
    $integral sin^2(x) cos^2(x) dif x & = 1/4 integral 1- 1/2 - cos(4x)/2 dif x \
    & = 1/4 integral 1/2 dif x - 1/32 integral cos(u) dif u\
    & = 1/8 x - 1/32 sin(4x) + C.$,
    "integral sine squared of x times cosine squared x d x equals one quarter the integral of 1 minus a half minus cosine of 4 x over 2 d x. This becomes one quarter the integral of 1 half d x minus 1 over thirty two times the integral of cosine of u d u. This is one eighth x minus one thirty second sine of 4 x plus c.",
  )
]

#tip-block[
  Strategy for evaluating #inline_eq($integral sin^m (x) cos^n (x) dif x$, "integral of sine to the m of x times cosine to the n of x d x.")
  - *Case 1: At least one of #acc("m") or #acc("n") are odd:*
    - Choose the trig function with the odd power to be #acc("u"). If both are odd, just pick one.
    - Save one factor of this trig function for d#acc("u") later.
    - Rewrite the other trig function (even power) with the Pythagorean Identity.
    - Do #acc("u")-sub, expand everything, and evaluate.
  - *Case 2: Both #acc("m") and #acc("n") are even*
    - Reduce all even powers with the double angle identities.
    - You may need to expand and apply the previous step multiple times until all even powers are eliminated.
    - The identity #inline_eq($sin(2theta) = 2 sin(theta)cos(theta)$, "sine of two theta equals 2 times sine of theta cosine of theta") may sometimes be useful.
]

#example[
  Find #block_eq($integral_(pi/6)^(pi/4) tan^5(x)sec^7(x) dif x$, "the integral from pi over 6 to pi over 4 of tangent to the fifth of x times sec to the seventh of x.")
]
Building off what we know from #inline_eq($sin(x)$, "sine of x") and #inline_eq($cos(x)$, "cosine of x"), we will probably want to pick #acc("u") so that d#acc("u") is still around. Recall the derivatives of the 4 non sinusoidal trig functions

#note-block[
  You should know the following derivatives from the prerequisites to this class, if you are unfamilar with these, please review and/or discuss in office hours.
  #block_eq($dv(, x) tan(x) = sec^2(x)$, "the derivative with respect to x of tangent of x is secant squared x.")
  #block_eq(
    $dv(, x) cot(x) = -csc^2(x)$,
    "the derivative with respect to x of cotangent of x is negative cosecantd squared of x",
  )
  #block_eq(
    $dv(, x) sec(x) = sec(x) tan(x)$,
    "the derivative with respect to x of secant of x is secant x times tangent of x",
  )
  #block_eq(
    $dv(, x) csc(x) = - csc(x) cot(x)$,
    "the derivative with respect to x of cosecant of x is negative cosecant of x times cotangent of x.",
  )
]

#my-solution-block[
  Now, when we pick #acc("u") we should plan to "save" the derivative of #acc("u") and replace everything else so it is in terms of #acc("u"). We can either keep a #inline_eq($sec^2(x)$, "secant squared of x") around, or #inline_eq($sec(x)tan(x)$, "secant of x times tangent of x."). Depending on if #acc("u") is going to be #inline_eq($tan(x)$, "tangent of x") or #inline_eq($sec(x)$, "secant of x"). Either way should work, we will pick #inline_eq($u=sec(x)$, "u equals secant of x") here, try #inline_eq($u=tan(x)$, "u equals tangent of x") on your own as practice.

  Let #inline_eq($u=sec(x)$, "u equals secant of x"), then #inline_eq($dif u = sec(x)tan(x) dif x$, " d u equals secant of x times tangent of x d x"). This gets us
  #block_eq(
    $integral_(pi/6)^(pi/4) tan^4(x) underbrace(sec^6(x), u^6) underbrace(tan(x) sec(x) dif x, dif u)$,
    "the integral from pi over 6 to pi over 4 of tangent to the fourth of x times secant to the sixth of x times tangent x times secant x d x. secant to teh sixth of x is u to the sixth and tangent of x times secant of x d x is d u.",
  )
  This leaves us with #inline_eq($tan^4(x)$, "tangent to the fourth of x") that we have to rewrite with Pythagorean identity. Then, using #inline_eq($tan^2(x) = sec^2(x)-1$, "tangent squared of x equals secant squared x minus 1.") we have
  #block_eq(
    $integral_(pi/6)^(pi/4) (sec^2(x)-1)^2sec^6(x) tan(x)sec(x)dif x & = integral_(2/sqrt(3))^(2/sqrt(2)) (u^2-1)^2 u^6 dif u \
    & = integral_(2/sqrt(3))^(2/sqrt(2)) u^10-2u^8+1u^6 dif u \
    & = [(u^11)/11 - 2/9 u^9 + (u^7)/7 ]_(2/sqrt(3))^(2/sqrt(2))$,
    "the integral from pi over 6 to pi over 4 of tangent to the fourth of x times secant to the sixth of x times tangent x times secant x d x equals the integral from 2 over root 3 to 2 over root 2 of the square of u squared minus 1 times u to the sixth d u. This becomes the integral from 2 over root 3 to 2 over root 2 of u to the tenth minus 2 u to the eighth plus u to the sixth. This becomes u to the eleventh over eleven minus 2 ninths u to the ninth plus u to the seventh over 7 evaluated from 2 over root 3 to 2 over root 2 ",
  )
  Simplifying this expression is left as an exercise to the reader.
]

#example[
  Find #block_eq($integral cot^2(x)csc^4(x) dif x$, "the integral of cotangent squared x times cosecant to the fourth x, d x.")
]
#my-solution-block[
  Let #inline_eq($u=cot(x)$, "u equal cotangent of x"), then #inline_eq($dif u = -csc^2(x) dif x$, "d u equals negative cosecant squared of x d x"). Then,
  #block_eq(
    $integral cot^2(x)csc^4(x) dif x & = integral (-1) underbrace(cot^2(x), u^2) underbrace(csc^2(x), "rewrite") underbrace((-1) csc^2(x) dif x, dif u)$,
    "the integral of cotangent squared x times cosecant to the fourth x, d x equals the integral of negative 1 times cotangent squared x times cosecant squared x times negative cosecant squared x d x.",
  )
  Then using the Pythagorean Identity #inline_eq($csc^2(x) = 1 + cot^2(x)$, "cosecant squared x equals 1 plus cotangent squared x") we have
  #block_eq(
    $integral cot^2(x)csc^4(x) dif x & = -integral cot^2(x)(1+cot^2(x))^2 (-csc^2(x)) dif x \
    & = -integral u^2(1+u^2)^2 dif u \
    & = - integral u^2 + 2u^4+u^6 dif u \
    & = - [(u^3)/3 + 2/5 u^5 + (u^7)/7] + C \
    & = - [(cot^3(x))/3 + 2/5 cot^5(x) + (cot^7(x))/7] + C$,
    "the integral of cotangent squared x times cosecant to the fourth x, d x equals negative integral of cotangent squared x times the square of 1 plus cotangent squared times negative cosecant squared x, d x. This becomes negative integral of u squared times 1 plus u squared squared d u. This becomes negative integral of u squared plus 2 u to the fourth plus u to the sixth d u. Which is negative cotangent cubed x over 3 plus 2 fifths cotangent to the fifth of x plus cotangent to the seventh of x over 7 plus c.",
  )

]

#tip-block[
  Strategy for evaluating #inline_eq($integral tan^m (x) sec^n (x) dif x$, "integral of tangent to the m of x times secant to the n of x d x.")
  - *Case 1: #acc("n") even:* (i.e. the power of secant is even)
    - Save one factor of #inline_eq($sec^2(x)$, "secant squared x") for d#acc("u") later.
    - Rewrite the rest of the powers of #inline_eq($sec^2(x)$, "secant squared x") using #inline_eq($sec^2(x)= 1+tan^2(x)$, "secant squared x equals 1 plus tangent squared x") (even power) with the Pythagorean Identity.
    - Do #acc("u")-sub, expand everything, and evaluate.
  - *Case 2: #acc("m") is odd:* (i.e. the power of tangent is odd)
    - Save one factor of #inline_eq($sec(x)tan(x)$, "secant x times tangent x") for d#acc("u") later.
    - Convert the remaining even powers of tangent to #inline_eq($tan^2(x) = sec^2(x)-1$, " tangent squared x equals secant squared x minus 1")
    - Do #acc("u")-sub, expand everything, and evaluate.

  - You may also use the following 2 antiderivatives
  #block_eq(
    $integral tan(u) dif u = ln|sec(u)|+C$,
    "integral tangent of u d u equals natural log of absolute value of secant u plus c",
  )
  #block_eq(
    $integral sec(u) dif u = ln|sec(u) + tan(u)| +C$,
    "integral of secant u d u equals natural log of absolute value of secant u plus tangent u plus c ",
  )
  #exercise[
    Derive the above antiderivatives. The second needs a clever multiplication by 1 trick. Come to office hours if you want to go through this together.
  ]

]

#emph-block[
  7.2 Section Summary:
  - We used trigonometric identities and other tools to rearrange trigonometric integrals to be able to solve them.
]

