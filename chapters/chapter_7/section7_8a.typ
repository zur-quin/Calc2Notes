#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(6)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 7.8a")
    ]
  }
}
= Integration Techniques
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
== Improper Integrals


// any functions and templating you want for just this chapter can go here

#emph-block[
  7.8a Learning Objectives
  - Identify type 1 and type 2 improper integrals
  - Rewrite improper integrals as limits of proper integrals
  - Use the comparison test to determine whether an integral converges or diverges
]
=== Motivation
So far we have worked with *proper* definite integrals, meaning
+ the domain of integration is finite, #closedint("a", "b"), and
+ the range of the integrand is finite on the domain

What if we break these rules? #auto-alt($integral_(-infinity)^(infinity) 1/x dif x$)

has infinite bounds and a vertical asymptote.

#remark-block[Why would we want to break these rules? As you will see in 8.5, there are some very important applications of improper integrals in the realm of probability and statistics. We will get there in a little, let's build up the tools to evaluate these first.]

How might we find the area under the curve #auto-alt($f(x) = 1/x$) on #inline_eq($[1,infinity)$, "the interval from 1 to infinity, including 1")?

With the current methods we have, we can evaluate #auto-alt($integral_1^t 1/x dif x$) for any finite-valued #auto-alt($t>1$).
#figure(image(
  "figures/1overxplot.svg",
  alt: "plot of 1/x with the area under the curve between 1 and t greater than 1 shaded.",
))

Then as we let #auto-alt($t arrow infinity$), the true area under the curve is more accurately approximated. Thus, we can take the limit of these integrals only covering a portion of the region.

#auto-alt(
  $
    integral_1^infinity 1/x dif x = lim_(t arrow infinity) integral_1^t 1/x dif x
  $,
)


=== Type 1 Improper Integrals
#definition[Type 1 Improper Integrals][
  These are integrals with infinite limits:
  + If #auto-alt($f(x)$) is continuous on #openint("a", "infinity")
    #auto-alt($ integral_a^infinity f(x) dif x = lim_(b arrow infinity) integral_a^b f(x) dif x $)
  + If #auto-alt($f(x)$) is continuous on #openint("-infinity", "b")
    #auto-alt($ integral_(-infinity)^b f(x) dif x = lim_(a arrow - infinity) integral_a^b f(x) dif x $)
  + If f(x) is continuous on #openint("-infinity", "infinity")
    #auto-alt(
      $
        integral_(-infinity)^infinity f(x) dif x = integral_(-infinity)^c f(x) dif x + integral_c^infinity f(x) dif x " for any real number " c
      $,
    )
]
#note-block(
  "If this limit exists and is a finite number, we say the improper integral *converges* and the limit is the value of the improper integral. Otherwise, we say the integral *diverges*.",
)

#example[
  For what values of #auto-alt($p$) does the integral #auto-alt($display(integral_1^infinity 1/x^p dif x)$) converge? What is the value when it converges?
]
#my-solution-block[
  Notice that for different values of #auto-alt($p$) that #auto-alt($y=1/x^p$) approaches #auto-alt($y=0$) at a different rate. This means that for some values of #auto-alt($p$), the function will decrease fast enough to converge, but not always.
  #figure(image("figures/pseriesplots.svg", alt: "plot comparing 1 over x to 1 over x squared to 1 over x cubed"))
  - If #auto-alt($p = 1$):
    #auto-alt(
      $
        integral_1^infinity 1/x^p dif x = lim_(t arrow infinity) integral_1^t 1/x dif x = lim_(t arrow infinity) [ln|x| ]|_1^t = lim_(t arrow infinity) ln(t) = infinity
      $,
    )
  So the integral diverges in this case.

  - If #auto-alt($p eq.not 1$):
    #auto-alt(
      $
        integral_1^infinity 1/x^p dif x & = lim_(t arrow infinity) integral_1^t x^(-p) dif x \
                                        & = lim_(t arrow infinity) [1/(-p+1) x^(-p+1)] |_1^t \
                                        & = lim_(t arrow infinity) [1/(-p+1) 1/t^(p-1) - 1/(-p+1)]
      $,
    )
  This last limit converges if #auto-alt($p>1$) and diverges if #auto-alt($p<1$). If #auto-alt($p>1$), it converges to #auto-alt($(-1)/(1-p)=1/(p-1)$)
]

#example[
  Find the area under the curve of #auto-alt($display(y = (ln(x))/x^2)$) for #auto-alt($x gt.eq 1$).
]
#my-solution-block[
  We first rewrite the improper integral as a limit of a proper integral,
  #auto-alt(
    $
      integral_1^infinity (ln(x))/x^2 dif x & = lim_(b arrow infinity) integral_1^b (ln(x))/x^2 dif x
    $,
  )
  Now we integrate #auto-alt($integral_1^b (ln(x))/x^2 dif x$) with our normal methods, just writing #auto-alt($lim_(x arrow b)[" "]$) around everything...
  #auto-alt(
    $
      integral_1^infinity (ln(x))/x^2 dif x & = lim_(b arrow infinity) integral_1^b (ln(x))/x^2 dif x \
    $,
  )
  we need integration by parts for this integral, so
  #IBP(auto-alt($ln(x)$), auto-alt($1/x dif x$), auto-alt($1/x^2 dif x$), vstep: auto-alt($=-1/x$))
  then
  #auto-alt(
    $
      integral_1^infinity (ln(x))/x^2 dif x & = lim_(b arrow infinity) integral_1^b (ln(x))/x^2 dif x \
                                            & = lim_(b arrow infinity) [ ln(x) (-1/x)|_1^b - integral_1^b (-1/x)1/x dif x] \
                                            & = lim_(b arrow infinity) [(- ln(x))/x - 1/x ] |_1^b \
                                            & = lim_(b arrow infinity) [(- ln(b))/b - 1/b + (ln(1))/1 + 1/1 ] \
                                            & = lim_(b arrow infinity) [(- ln(b))/b - 1/b + 1 ] \
                                            & = lim_(b arrow infinity) (- ln(b))/b + lim_(b arrow infinity)1 - 1/b \
                                            & =^"LH" lim_(b arrow infinity)(-1/b)/1 + 1 \
                                            & = 0 + 1 = 1
    $,
  )

]
#warning-block[
  Recall that #auto-alt($infinity$) is not a number. We cannot evaluate things at infinity, we have to discuss these things in terms of limits. Notation is going to play a large role in this section, so pay close attention to it. We always rewrite these in terms of limits.
]

#example[
  Evaluate #auto-alt($display(integral_(-infinity)^infinity 1/(1+x^2) dif x)$).
]
#my-solution-block[
  We can split this integral up at any real number, but thinking ahead the antiderivative of this is #auto-alt($arctan(x)$) and #auto-alt($arctan(0)=0$) so we will split it at 0. It is not necessary that you think ahead in this way, but it can be nice.

  #auto-alt(
    $
      integral_(-infinity)^infinity 1/(1+x^2) dif x &= integral_(-infinity)^0 1/(1+x^2) dif x + integral_0^infinity 1/(1+x^2) dif x\
      & = lim_(t arrow -infinity) integral_(t)^0 1/(1+x^2) dif x + lim_(r arrow infinity) integral_0^r 1/(1+x^2) dif x\
      & = lim_(t arrow -infinity) arctan(x)|_t^0 + lim_(r arrow infinity) arctan(x)|_0^r\
      & = lim_(t arrow -infinity) -arctan(t) + lim_(r arrow infinity) arctan(r)\
      & = pi/2 + pi/2 \
      & = pi
    $,
  )
]

#emph-block[
  7.8a Section Summary:
  - We evaluated some integrals that had infinite bounds.
  - We discussed when integrals converge or diverge.
]

