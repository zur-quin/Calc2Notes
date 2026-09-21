// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(6)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 7.5")
      = Integration Techniques
    ]
  }
}

#counter(heading).update(7)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
== Strategies For Integration


// any functions and templating you want for just this chapter can go here

#emph-block[
  7.5 Learning Objectives
  - I can determine which tools I need to evaluate an integral.
  - I can combine integration techniques to evaluate more complicated integrals.
  - I can evaluate both indefinite and definite integrals with any technique discussed so far.
]
#warning-block[
  Methods described in this section genuinely take a lot of practice to get used to. You may have to try a few things, restart problems a few times, and be creative when solving integrals in general.

  Solving integrals is almost an art form. While it may feel like we've shown you every integration technique to solve any integral, that is not true. There are a lot of weird, obscure techniques that aren't covered in this class. As well, there are many, many more integrals that we cannot write the answer to with known/named functions than integrals we do know how to do by hand.

  Hopefully you can start to appreciate that integration is a more complicated operation than differentiation is. There is a whole field of study around numerically approximating integrals we cannot do by hand, and doing this accurately and efficiently.
]

=== Techniques We Have So Far
+ Knowing the antiderivative
+ Simplify then know the antiderivative
+ #auto-alt($u$)-substitution
+ Trig substitution
+ Trig integration
+ Integration by parts
+ Partial fraction decomposition

=== Strategies
+ Know your derivatives, so that recognizing antiderivatives is quick and easy.
  - Math 1225 is a prerequisite for this class, so you should know the derivatives of basic functions.
  - Knowing the derivatives of all 6 trig functions, and inverse trig functions are important for when you need to recognize these antiderivatives.
+ Simplify the integral
  - Distribute/multiply things out/FOIL
  - Factor and pull out constant multiples from the integral
  - Use trig identities
  - Factor and reevaluate usable methods.
  #example[
    Find #auto-alt($ integral (sin(x) + cos(x) )^2 dif x $)
  ]
  #my-solution-block[
    Multiplying things out we have
    #auto-alt(
      $
        integral (sin(x) + cos(x) )^2 dif x & = integral sin^2(x) + 2 sin(x) cos(x) + cos^2(x) dif x \
                                            & = integral sin^2(x) + cos^2(x) + 2 sin(x) cos(x) dif x
      $,
    )
    Then using a trig identity we have
    #auto-alt(
      $
        integral sin^2(x) + cos^2(x) + 2 sin(x) cos(x) dif x & = integral 1 dif x + integral 2 sin(x) cos(x) dif x
      $,
    )
    Which we can do with power rule and a #auto-alt($u$)-sub for the trig part. Finish this problem on your own.
  ]
  #example[
    Find #auto-alt($ integral (2x+1)/(x^2+3) dif x $)
  ]
  #my-solution-block[
    The denominator cannot be further factored, so we can't use partial fraction decomposition on this (it is already decomposed in a way). We can always try splitting fractions up over addition/subtraction in the numerator (NEVER the denominator, that isn't how fractions work!). Doing this gives
    #auto-alt(
      $
        integral (2x+1)/(x^2+3) dif x & = integral (2x)/(x^2+3) dif x + integral 1/(x^2+3) dif x
      $,
    )
    Now checking if we can do these integrals, both are #auto-alt($u$)-sub problems with slightly different functions. Here we see that it is useful to know derivatives of inverse trig functions! For the first integral let #auto-alt($u=x^2+3$) then #auto-alt($dif u = 2 x dif x$) so
    #auto-alt(
      $
        integral (2x)/(x^2+3) dif x & = 1/2 integral 1/u dif u \
                                    & = 1/2 ln|x^2+3|
      $,
    )
    and the other one is related to #auto-alt($arctan$),
    #auto-alt(
      $
        integral 1/(x^2+3) dif x & = integral 1/(3((x^2)/3+1)) dif x \
                                 & = 1/3 integral 1/(((x/sqrt(3))^2+1)) dif x
      $,
    )
    and #auto-alt($u=x/sqrt(3)$) so #auto-alt($dif u = 1/sqrt(3) dif x$) so
    #auto-alt(
      $
        sqrt(3)/3 integral 1/(u^2+1) dif u & = sqrt(3)/3 arctan(u) \
                                           & = sqrt(3)/3 arctan(x/sqrt(3))
      $,
    )
    Finally, our answer is
    #auto-alt(
      $
        integral (2x+1)/(x^2+3) dif x = 1/2 ln|x^2+3| + sqrt(3)/3 arctan(x/sqrt(3)) + C.
      $,
    )
  ]
+ Look for #auto-alt($u$)-sub opportunities. Some common #auto-alt($u$)-sub applications are
  - When you see a function, and it's derivative is being multiplied by everything
  - When you see a sum (without squared values) in a root or in a denominator and want to move that sum (or difference) outside the root or outside the denominator
  - When you see a weird function showing up every time the variable of integration is used.
  #example[
    Evaluate #auto-alt($ integral x^2/sqrt(x^3-4) dif x $)
  ]
  #my-solution-block[
    Seeing the root, our first thought might be trig sub. However, that won't work because the thing in the square root doesn't have #auto-alt($x^2$) it has #auto-alt($x^3$).

    The next thing we might notice is that the inside of the square root has a derivative that has the same power as the thing in the numerator.

    Use #auto-alt($u=x^3-4$), then #auto-alt($dif u = 3x^2 dif x$) (or #auto-alt($1/3 dif u = x^2 dif x$)) so
    #auto-alt(
      $
        integral x^2/sqrt(x^3-4) dif x & = 1/3 integral 1/sqrt(u) dif u \
                                       & = 1/3 integral u^(-1/2) dif u \
                                       & = 2/3 u^(1/2) \
                                       & = 2/3 (x^3-4)^(1/2) +C \
      $,
    )
  ]
  #example[
    Find #auto-alt($ integral x^2 sqrt(x-3) dif x $)
  ]
  #my-solution-block[
    Again we see another root where there isn't an #auto-alt($x^2$), so we don't try trig substitution. Then, we kind of want to move the subtraction out of the root. We do this with a #auto-alt($u$)-sub of #auto-alt($u=x-3$) or #auto-alt($x=u+3$) so #auto-alt($dif u = dif x$) then
    #auto-alt(
      $
        integral x^2 sqrt(x-3) dif x & = integral (u+3)^2 sqrt(u) dif u \
                                     & = integral (u^2+6u + 9)u^(1/2) dif u \
                                     & = integral u^(5/2) + 6 u^(3/2) + 9u^(1/2) dif u
      $,
    )
    Finish this problem as an exercise, if you feel you need the practice.
  ]
  #example[
    Find #auto-alt($ integral (2x-15)/(x+3) dif x $)
  ]
  #my-solution-block[
    Since the degrees in the numerator and denominator are the same, partial fraction decomposition doesn't do anything. We can split this up over the subtraction in the numerator, but we still get an integral we cannot solve
    #auto-alt($ integral (2x-15)/(x+3) dif x & = integral (2x)/(x+3) dif x + integral (-15)/(x+3) dif x $)
    (we can't solve the first of the 2 integrals here as is)
    But! If we could remove the addition in the denominator, we could simplify the terms we get in the numerator! Let #auto-alt($u=x+3$) so #auto-alt($dif u = dif x$), and #auto-alt($x=u-3$) then
    #auto-alt(
      $
        integral (2x-15)/(x+3) dif x & = integral (2(u-3)-15)/(u) dif u \
                                     & = integral (2u)/u dif u + integral (-6-15)/u dif u \
                                     & = integral 2 dif u -21 integral 1/u dif u
      $,
    )
    These should be easy integrals to finish up. If they aren't, come to office hours and let's make them easy to solve. Finish this problem on your own if you feel you need the practice!
  ]
+ Classify integral based on form
  - Product of trigonometric functions? Use trigonometric integral techniques from section 7.2. Specifically we can use the Pythagorean identities to integrate things of the form
    - #auto-alt($sin^m (x) cos^n (x)$)
    - #auto-alt($tan^m (x) sec^n (x)$)
    - #auto-alt($cot^m (x) csc^n (x)$)
  - Rational function? Try polynomial long division and/or partial fraction decomposition. Specifically the forms
    - #auto-alt($(P(x))/(Q(x))$), #auto-alt($deg P>deg Q$) we need polynomial long division before we partial fraction decompose.
    - #auto-alt($(P(x))/(Q(x))$), #auto-alt($deg P < deg Q$) we can go straight to partial fraction decomposition.
  - Product of polynomial and transcendental (#auto-alt($e^x$), #auto-alt($sin(x)$), #auto-alt($ln(x)$), etc.) function? Try integration by parts.
  - Radicals (roots) with #auto-alt($x^2$) in it? Try trig substitution. Specifically powers of #auto-alt($sqrt(b^2x^2+a^2)$), #auto-alt($sqrt(b^2x^2-a^2)$), and #auto-alt($sqrt(a^2-b^2x^2)$).

+ Try multiple things to see what eventually works!

#emph-block[
  7.5 Section Summary:
  - We explored different integration techniques, and mentioned that we often have to try multiple methods to see what works. We might also try to combine methods.
]

