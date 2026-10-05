// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(6)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 7.8")
      = Integration Techniques
      #counter(heading).update(7)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Improper Integrals
    ]
  } else if (
    sys.inputs.at("html-frames", default: "false") == "true"
      and sys.inputs.at("individualchs", default: "false") == "true"
  ) {
    [ // if single html still print the stuff
      = Integration Techniques
      #counter(heading).update(7)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Improper Integrals
    ]
  } else {
    // main html
    [
      #counter(heading).update(7)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
    ]
  }
}
#counter(heading).step(level: 3)
#counter(heading).step(level: 3)

// any functions and templating you want for just this chapter can go here

#emph-block[
  7.8b Learning Objectives
  - Identify and rewrite type 2 improper integrals as limits of proper integrals
  - Use the comparison test to determine whether an integral converges or diverges
]

=== Type 2 Improper Integrals
#definition[Type 2 Improper Integrals][
  Improper integrals of Type 2 are definite integrals with integrands that are _not continuous_ within the limits of integration.

  Suppose #auto-alt($f$) is a function.
  + If #auto-alt($f$) is continuous on #inline_eq($(a,b]$, "the interval from a to b including b"), but not continuous at #auto-alt($a$), then
    #auto-alt(
      $
        integral_a^b f(x) dif x = lim_(t arrow a^+) integral_t^b f(x) dif x.
      $,
    )
  + If #auto-alt($f$) is continuous on #inline_eq($(a,b]$, "the interval from a to b including a"), but not continuous at #auto-alt($b$), then
    #auto-alt(
      $
        integral_a^b f(x) dif x = lim_(t arrow b^-) integral_a^t f(x) dif x.
      $,
    )
  + If #auto-alt($f$) is continuous on #inline_eq($[a,c) union (c,b]$, "the closed interval from a to b with some point c between them not included"), but not continuous at #auto-alt($c$) in #openint("a", "b"), then
  #auto-alt(
    $
      integral_a^b f(x) dif x & = integral_a^c f(x) dif x + integral_c^b f(x) dif x \
                              & = lim_(t arrow c^-) integral_a^t f(x) dif x + lim_(r arrow c^+) integral_r^b f(x) dif x
    $,
  )
  If the limit is finite, then we say that the definite integral *converges* and the integral is the *value* of the limit. If the limit is not finite,
  we say the definite integral *diverges*.
]

#example[
  Does #auto-alt($display(integral_0^(pi/2)tan(theta)dif theta)$) converge? If so, what is its value?
]
#my-solution-block[
  #figure(image(
    "figures/tan_plot.svg",
    alt: "plot of tangent of x on the interval from 0 to pi over 2 with the area between the curve and x axis shaded",
  ))
  Notice, this type of improper integral involves the cases where the function has a vertical asymptote, so there may be infinite or finite area. It depends on how "quickly" the curve approaches the asymptote.

  The upper bound on the integral is where the discontinuity is. So we must take the limit as the upper bound approaches #auto-alt($pi/2$) from below. Specifically,
  #auto-alt(
    $
      integral_0^(pi/2) tan(theta) dif theta & = lim_(t arrow (pi/2)^- ) integral_0^t tan(theta) dif theta \
                                             & = lim_(t arrow (pi/2)^-) integral_0^t (sin(theta))/(cos(theta)) dif theta
    $,
  )
  Let #auto-alt($u=cos(theta)$), #auto-alt($dif u = - sin(theta) dif theta$), #auto-alt($u(0) = 1$), #auto-alt($u(t) = cos(t)$) then
  #auto-alt(
    $
      integral_0^(pi/2) tan(theta) dif theta & = lim_(t arrow (pi/2)^-) integral_1^(cos(t)) (sin(theta))/(cos(theta)) dif theta \
      & = lim_(t arrow (pi/2)^-) (-1) integral_1^(cos(t)) 1/(u) dif u \
      & = lim_(t arrow (pi/2)^-) (-1) ln|u| |_1^(cos(t)) \
      & = lim_(t arrow (pi/2)^-) ln|sec(t)| \
      & = infinity
    $,
  )
  because this limit diverges, the integral diverges.
]
Note, this implies the shaded area is not finite.

#example[
  Evaluate #auto-alt($display(integral_0^3 1/(s-1)^(2/3) dif s)$) if possible, or show it diverges.
]
#note-block[This function is undefined at #auto-alt($s=1$), which is in the interval we are integrating over. If we were to just integrate this without taking care of the vertical asymptote, we'd possibly get a value that is not correct. Again, the hardest part of these integrals is the notation and treating it with care using limits.]
#my-solution-block[
  Because the function is discontinuous at #auto-alt($s=1$),
  #auto-alt(
    $
      integral_0^3 1/(s-1)^(2/3) dif s & = lim_(t arrow 1^-) integral_0^t 1/(s-1)^(2/3) dif s + lim_(r arrow 1^+) integral_r^3 1/(s-1)^(2/3) dif s \
      & = lim_(t arrow 1^-) [3(s-1)^(1/3)] |_0^t + lim_(r arrow 1^+) [3(s-1)^(1/3)] |_r^3 \
      & = lim_(t arrow 1^-) [3(t-1)^(1/3)-3(-1)] + lim_(r arrow 1^+) [3(2)^(1/3)-3(r-1)^(1/3)] \
      & = 3 + 3(2)^(1/3) \
    $,
  )
]

=== Direct Comparison Test for Improper Integrals
#theorem[Direct Comparison Test for Improper Integrals][
  Let #auto-alt($f$) and #auto-alt($g$) be continuous on #inline_eq($[a,infinity)$, "the interval from a to infinity including a") with #auto-alt($0 lt.eq f(x) lt.eq g(x)$) for all #auto-alt($x gt.eq a$). Then,
  + If #auto-alt($display(integral_a^infinity g(x) dif x)$) converges, then we can conclude that #auto-alt($display(integral_a^infinity f(x) dif x)$) will converge also.
  + Alternatively, if #auto-alt($display(integral_a^infinity f(x) dif x)$) diverges, then we can conclude that #auto-alt($display(integral_a^infinity g(x) dif x)$) will diverge also.
]

#note-block[
  Why does this make sense?
  #figure(image(
    "figures/comparisonTest.svg",
    alt: "plot of 2 curves f and g going towards 0 as x goes to infinity. From a and beyond g is greater than f.",
  ))
  In the first case, if we know that the larger of the 2 areas is finite (i.e. that #auto-alt($integral_a^infinity g(x) dif x$) converges), then we know that the area under #auto-alt($f$) is less (i.e. we can conclude that #auto-alt($integral_a^infinity f(x) dif x$) must also converge).

  In the second case, we instead know the area under #auto-alt($f$) is not finite (i.e. #auto-alt($integral_a^infinity f(x) dif x$) diverges). Then, because #auto-alt($g$) is always above #auto-alt($f$), the area under #auto-alt($g$) is greater than the area under #auto-alt($f$), which is not finite. Thus, the area under #auto-alt($g$) cannot be finite (i.e. #auto-alt($integral_a^infinity g(x) dif x$) diverges).
]

#example[
  Does #auto-alt($display(integral_0^infinity e^(-x^2) dif x)$) converge?
]
#note-block[
  This integral is still one we cannot do analytically (without using approximations). That is to say that the antiderivative of #auto-alt($e^(-x^2)$) is not one we can write down. So, to answer the question we will use the comparison test to compare this integral to one we know more about.

  Coming up with the function we compare to is an art, and because we are only human we'll keep it pretty simple in this class. (Large language models and people with too much time on their hands can come up with incredibly obtuse and non-obvious functions to use the comparison test on, and when people do it it can be impressive)
]
#my-solution-block[

  Observe #auto-alt($e^(-x^2)$) is kind of like #auto-alt($e^(-x)$). Note, #auto-alt($e^(-x)>e^(-x^2)$) for #auto-alt($x>1$) and, importantly, we can integrate #auto-alt($e^(-x)$).

  First, we show #auto-alt($e^(-x)>e^(-x^2)$) for #auto-alt($x>1$) (yes this is part of a complete solution, and you would have to do something similar with your comparison functions):
  For #auto-alt($x>1$) we have
  #auto-alt(
    $
                 x^2 & > x \
         "so " - x^2 & < - x \
      "so " e^(-x^2) & < e^(-x).
    $,
  )

  Next, we show #auto-alt($integral_1^infinity e^(-x) dif x$) converges:
  #auto-alt(
    $
      integral_1^infinity e^(-x) dif x & = lim_(t arrow infinity) integral_1^t e^(-x) dif x \
                                       & = lim_(t arrow infinity) - e^(-x)|_1^t \
                                       & = lim_(t arrow infinity) e^(-1) - 1(e^(t)) \
                                       & = e^(-1) - 0 = e^(-1)
    $,
  )
  Because #auto-alt($e^(-1)$) is finite #auto-alt($integral_1^infinity e^(-x) dif x$) converges.

  Lastly, we need to connect this to #auto-alt($integral_0^infinity e^(-x^2) dif x$):
  If it converges,
  #auto-alt(
    $
      integral_0^infinity e^(-x^2) dif x = integral_0^1 e^(-x^2) dif x + integral_1^infinity e^(-x^2) dif x
    $,
  )
  *By the direct comparison test*, since #auto-alt($integral_1^infinity e^(-x) dif x$) converges and #auto-alt($e^(-x)>e^(-x^2)$) for #auto-alt($x>1$) then #auto-alt($integral_1^infinity e^(-x^2) dif x$) must also converge. Finally, since #auto-alt($integral_0^1 e^(-x^2) dif x$) is a finite number (finite continuous function integrated over a finite interval) the sum
  #auto-alt(
    $
      integral_0^infinity e^(-x^2) dif x = integral_0^1 e^(-x^2) dif x + integral_1^infinity e^(-x^2) dif x
    $,
  )
  must also converge.

  _Note: We don't know what the integral will converge to still! Just that the improper definite integral is a finite number._
]

#note-block[
  This solution goes into a little extra detail than we would usually require, specifically the breaking the integral up from 0 to 1 then 1 to #auto-alt($infinity$). This is because our direct comparison test had #auto-alt($a$) be both the starting point of the integral and the point where #auto-alt($g(x) gt.eq f(x)$) from that point onward. This is not required. So long as one function is larger than the other _eventually_ (and forever after that point) direct comparison test will work.
]



#emph-block[
  7.8b Section Summary:
  - We discussed type 2 improper integrals, those with discontinuities on the interval we integrate over.
  - We discussed when improper integrals of type 2 converge or diverge.
  - We used direct comparison test to conclude if an integral we cannot do converges or diverges.
]

