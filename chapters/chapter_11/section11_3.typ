#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(10)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.3")
      = Sequences and Series
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
    ]
  } else if (
    sys.inputs.at("html-frames", default: "false") == "true"
      and sys.inputs.at("individualchs", default: "false") == "true"
  ) {
    [ // if single html still print the stuff
      = Sequences and Series
      #counter(heading).update(11)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
    ]
  } else {
    // main html
    [
      #counter(heading).update(11)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
    ]
  }
}
== Integral Test for Series

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.3 Learning Objectives
  - Compare the graph of a series to an integral
  - Determine whether a series diverges or converges using the Integral Test
  - Bound the remainder of a series
]
=== Integral Test
In most cases, we cannot easily determine the actual value that a series converges to. However, we can often determine whether a series is convergent or divergent. In this section, we will begin to investigate methods used to determine whether or not a series is convergent.

#example[
  Consider the series #auto-alt($sum_(n=1)^infinity 1/sqrt(n)$). Attempt to use the sequence of partial sums to discuss the convergence of this series.
]
#my-solution-block[
  The terms in the series have the sequence
  #auto-alt(
    $
      #sequence() = (1/1, 1/sqrt(2), 1/sqrt(3), 1/sqrt(4)=1/2, 1/sqrt(5), 1/sqrt(6),...)
    $,
  )
  leading us to the sequence of partial sums
  #auto-alt(
    $
      #sequence(letter: auto-alt($s$)) = (1, 1+ (1)/sqrt(2), 1 + (1)/sqrt(2) + 1/sqrt(3),...)
    $,
  )
  and this is just gross and difficult to work with.
]
With the harmonic series we could do some clever bounding and algebra, but those are typically difficult techniques to apply in general. Instead let's see if we can approach this from a different angle.

Observe we can "graph" the sequence like a step function. We can construct a bunch of rectangles of width 1 and height #auto-alt($a_n=1/sqrt(n)$)

#figure(image(
  "figures/step.svg",
  alt: "a bunch of blue rectangles of descending heights. From x equals 1 to 2 the height is 1 over square root of 1. From x = 2 to 3 the height is 1 over square root of 2, and so on.",
))

and the area of all the rectangles is the series #auto-alt($ sum_(n=1)^infinity 1/sqrt(n). $)

A lower bound for the area under this curve is the integral of the function that passes through the left end points of our rectangles: #auto-alt($y=1/sqrt(x)$)! (not factorial, just excitement)

#figure(image(
  "figures/IntegralTest.svg",
  alt: "the step function from before now with the curve 1 over square root of x graphed for comparison. Note the top left corners of the rectangles line up with the curve at x equals 1,2,3,4,5, and so on.",
))

We can use the convergence or divergence of improper integrals that directly correspond to the series.

In this case, we already know that #auto-alt($integral_1^infinity 1/sqrt(x) dif x$) diverges since it is of the form #auto-alt($integral_1^infinity 1/x^p dif x$) with #auto-alt($p lt.eq 1$).

However, visually we can see that #auto-alt($sum_(n=1)^infinity 1/sqrt(n) > integral_1^infinity 1/sqrt(x) dif x$), since the area of each of the rectangles is like a left Reimann sum for the integral and the function is decreasing.

Thus, #auto-alt($sum_(n=1)^infinity 1/sqrt(n)$) diverges.

#example[
  Determine the convergence of the series #auto-alt($ sum_(n=1)^infinity 1/n^2 $) by comparing to a known integral.
]
#my-solution-block[
  Let's start with a picture, in this case, we suspect that this series converges, so we want to find a curve above some rectangles to help us visualize things. We can write
  #auto-alt(
    $
      sum_(n=1)^oo 1/n^2 = 1 + sum_(n=2)^oo 1/n^2
    $,
  )
  then, the series can be represented by the rectangles to the right of the red line in this picture:
  #figure(image(
    "figures/IntegralTest_converge.svg",
    alt: "rectangles under the curve 1 over x squared. The top right of the rectangles is aligned with the curve, and a red vertical line is at x = 1.",
  ))

  Notice #auto-alt($sum_(n=2)^infinity 1/n^2 < integral_1^infinity 1/x^2 dif x$). Since #auto-alt($integral_1^oo 1/x^2 dif x$) is of the form #auto-alt($integral_1^infinity 1/x^p dif x$) and #auto-alt($p > 1$), this integral converges, so the series #auto-alt($ sum_(n=2)^infinity 1/n^2 $) converges. Then, since we only need to add 1 (which is finite) we know #auto-alt($ sum_(n=1)^oo 1/n^2 $) converges as well.
]

Breaking off the 1 at the start, we can do a similar trick with any convergent series, so we don't have to do this in the future. We can generalize these results with the following test for convergence.

#theorem[The Integral Test][
  Let #sequence() be a sequence of positive terms. Suppose that #auto-alt($a_n=f(n)$), where #auto-alt($f$) is a continuous, positive, and decreasing function of #auto-alt($n$) for all #auto-alt($n gt.eq N$) (where #auto-alt($N$) is a positive integer).
  Then,
  #set enum(numbering: "(i)", spacing: 2em)
  + If #auto-alt($display(integral_N^infinity f(x) dif x)$) is convergent, then #auto-alt($display(sum_(n=1)^infinity a_n)$) is a convergent series.
  + If #auto-alt($display(integral_N^infinity f(x) dif x)$) is divergent, then #auto-alt($display(sum_(n=1)^infinity a_n)$) is a divergent series.
]

#warning-block[
  - This does not tell you what value the series converges to!!!!!!
  - This test does not always hold without all 3 of the assumptions. #auto-alt($f$) must be continuous, positive, and decreasing to use this test. If you don't check these conditions you can't use the integral test.
]

We have already determined for which values of #auto-alt($p$) the integral #auto-alt($integral_1^infinity 1/x^p dif x$) converges and diverges. So...
#corollary[#auto-alt($p$)-Series Test][
  The #auto-alt($p$)-series #auto-alt($display(sum_(n=1)^infinity 1/n^p)$),
  #set enum(numbering: "(i)", spacing: 2em)
  + converges if #auto-alt($p>1$)
  + diverges if #auto-alt($p lt.eq 1$)
]

#tip-block[
  We are starting to build up a few test we can use for series convergence, and it will begin to be a challenge to identify which to use. For #auto-alt($sum_(n=1)^infinity a_n$) so far we can use
  - the divergence test (if #sequence() doesnt converge to 0 then the series diverges)
  - Think about the partial sums (usful for telescoping series and things that easily simplify when added together)
  - Geometric Series test (is it a geomatric series with #auto-alt($r<1$)?)
  - #auto-alt($p$)-series test (for #auto-alt($a_n=1/n^p$) type things)
  - integral test (for things that are easy/possible to integrate using our integration techniques)

  We will add to this list, so keeping a reference of each test (and a short description of when to use them) easily accessible in your notes will be good.
]

#example[
  Determine whether the series #auto-alt($display(sum_(n=1)^infinity (ln(n))/n)$) converges or diverges.
]
#my-solution-block[
  It us often useful to do a quick check that the sequence converges to 0 before progressing:
  #auto-alt(
    $
      lim_n arrow infinity (ln(n))/n & =^"LH" (1/n)/1 & = 0
    $,
  )
  So the series is not obviously divergent. We still don't know if it converges or diverges.

  Next, we run through our other tests. It won't be easy to simplify the partial sums, and this is not a #auto-alt($p$)-series. So we try the integral test. Let
  #auto-alt(
    $
      f(x) = (ln(x))/x.
    $,
  )
  Notice this is something we can integrate, let's see if it converges or not: #auto-alt($u=ln(x)$) #auto-alt($dif u = 1/x dif x$) so
  #auto-alt(
    $
      integral_1^infinity (ln(x))/x dif x & = lim_(t arrow infinity) integral_1^t (ln(x))/x dif x \
                                          & = lim_(t arrow infinity) integral_(u(1))^(u(t)) u dif u \
                                          & = lim_(t arrow infinity) (u^2)/2 |_(u(1))^(u(t)) \
                                          & = lim_(t arrow infinity) (1/2 (ln(x))^2) |_(1)^(t) \
                                          & = lim_(t arrow infinity) (1/2 (ln(t))^2 - 0) \
                                          & = infinity
    $,
  )
  Thus, *by the Integral Test*, the series diverges.
]
#warning-block[
  - You will lose points for not using proper limit notation on improper integrals in this seciton.
  - You will also lose points for not stating which series convergence test you are using. These might be good things to make flashcards of and study as we move towards the exam.
]

=== Remainder Estimate for Integral Test
Suppose a series converges, and we want to estimate its value. How can we do this?

- If a series converges, then, by definition (even if it is hard for us to calculate directly), its value is the limit of the sequence of partial sums. So, we can take a sufficiently long partial sum to approximate the value. The larger #auto-alt($n$) we use for the #auto-alt($n^"th"$) partial sum, the better the estimate, since we're adding more of the terms.

#theorem[Remainder Estimate for Integral Test][
  Suppose #auto-alt($f(n)=a_n$), where #auto-alt($f$) is a continuous, positive, decreasing function for #auto-alt($x gt.eq N$) and #auto-alt($display(sum_(n=1)^infinity a_n)$) is convergent.

  The remainder, #auto-alt($R_n$), is the error made when #auto-alt($s_n$), the sum of the first #auto-alt($n$) terms, is used as an approximation to the total sum, #auto-alt($s$). We define
  #auto-alt($ R_n = s - s_n = a_(n+1) + a_(n+2) + a_(n+3) + ... $)
  Then, we know that
  #auto-alt(
    $
      R_n = a_(n+1) + a_(n+2) + a_(n+3) + ... lt.eq integral_n^infinity f(x) dif x
    $,
  )
  and
  #auto-alt($ R_n = a_(n+1) + a_(n+2) + a_(n+3) + ... gt.eq integral_(n+1)^infinity f(x) dif x $)
  So,
  #auto-alt(
    $
      integral_(n+1)^infinity f(x) dif x lt.eq R_n lt.eq integral_n^infinity f(x) dif x
    $,
  )
  gives us an error approximation to the estimation #auto-alt($s_n$).
]

#example[
  Approximate the sum of the series #auto-alt($display(sum_(n=1)^infinity 1/n^2)$) by using the #auto-alt($10^"th"$) partial sum, namely by adding the first 10 terms of the series. How many terms are needed to guarantee an approximation for the series that is accurate to at least 3 decimal places?
]
#my-solution-block[
  #auto-alt(
    $
      s_(10) & = sum_(n=1)^(10) 1/n^2 \
             & = 1 + 1/4 + 1/9 + ... + 1/100 approx 1.54976773117
    $,
  )
  To guarantee our approximation is accurate to at least 3 decimal places, we need the error (or the remainder #auto-alt($R_n$)) to be less than 0.001. We'll see what value of #auto-alt($n$) guarantees #auto-alt($R_n lt.eq 0.001$) by solving when #auto-alt($R_n < 0.001$). We know by the remainder estimate that
  #auto-alt(
    $
      R_n & lt.eq integral_n^infinity 1/x^2 dif x \
    $,
  )
  This integral is
  #auto-alt(
    $
      integral_n^infinity 1/x^2 dif x & = lim_(t arrow infinity) integral_n^t 1/x^2 dif x \
                                      & = lim_(t arrow infinity) -1/x |_n^t \
                                      & = lim_(t arrow infinity) 1/n - 1/t \
                                      & = 1/n.
    $,
  )
  Then, since we know #auto-alt($R_n lt.eq 1/n$), to get #auto-alt($R_n < 0.001 = 1/1000$) we need #auto-alt($1/n<1/1000$) or #auto-alt($n>1000$). So, to *guarantee* that the estimate is accurate up to 3 decimal places we need to use #auto-alt($n>1000$).
]
It turns out this is an overestimate of what is actually needed to get an accurate approximation of the series. We only need up to #auto-alt($n=32$) to get 3 decimals of accuracy in this case. Much less than 1000.

#emph-block[
  11.3 Section Summary:
  - We used integrals to bound series
  - We used integrals to bound the error when approximating series with partial sums.
]

