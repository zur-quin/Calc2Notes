#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(11)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.3")
      = Sequences and Series
    ]
  }
}
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
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
  Consider the series $sum_(n=1)^infinity 1/sqrt(n)$. Attempt to use the sequence of partial sums to discuss the convergence of this series.
]
#my-solution-block[
  The terms in the series have the sequence
  $
    #sequence() = (1/1, 1/sqrt(2), 1/sqrt(3), 1/sqrt(4)=1/2, 1/sqrt(5), 1/sqrt(6),...)
  $
  leading us to the sequence of partial sums
  $
    #sequence(letter: auto-alt($s$)) = (1, 1+ (1)/sqrt(2), 1 + (1)/sqrt(2) + 1/sqrt(3),...)
  $
  and this is just gross and difficult to work with.
]
With the harmonic series we could do some clever bounding and algebra, but those are typically difficult techniques to apply in general. Instead let's see if we can approach this from a different angle.

Observe we can "graph" the sequence like a step function. We can construct a bunch of rectangles of width 1 and height $a_n=1/sqrt(n)$

// todo: picture

and the area of all the rectangles is the series $ sum_(n=1)^infinity 1/sqrt(n). $

A lower bound for the area under this curve is the integral of the function that passes through the left end points of our rectangles: $y=1/sqrt(x)$! (not factorial, just excitement)

// todo: picture with curve now!

We can use the convergence or divergence of improper integrals that directly correspond to the series.

In this case, we already know that $integral_1^infinity 1/sqrt(x) dif x$ diverges since it is of the form $integral_1^infinity 1/x^p dif x$ with $p lt.eq 1$.

However, visually we can see that $sum_(n=1)^infinity 1/sqrt(n) > integral_1^infinity 1/sqrt(x) dif x$, since the area of each of the rectangles is like a left Reimann sum for the integral and the function is decreasing.

Thus, $sum_(n=1)^infinity 1/sqrt(n)$ diverges.

#example[
  Determine the convergence of the series $ sum_(n=1)^infinity 1/n^2 $ by comparing to a known integral.
]
#my-solution-block[
  //todo: start sum at 2? and picture
  Notice $sum_(n=1)^infinity 1/n^2 < integral_1^infinity 1/x^2 dif x$. Since $integral 1/x^2 dif x$ is of the form $integral_1^infinity 1/x^p dif x$ and $p > 1$, this integral converges, so the series $ sum_(n=1)^infinity 1/n^2 $ converges.
  //todo: 1+?
]

#theorem[The Integral Test][
  Let #sequence() be a sequence of positive terms. Suppose that $a_n=f(n)$, where $f$ is a continuous, positive, and decreasing function of $n$ for all $n gt.eq N$ (where $N$ is a positive integer).
  Then,
  #set enum(numbering: "(i)", spacing: 2em)
  + If $display(integral_N^infinity f(x) dif x)$ is convergent, then $display(sum_(n=1)^infinity a_n)$ is a convergent series.
  + If $display(integral_N^infinity f(x) dif x)$ is divergent, then $display(sum_(n=1)^infinity a_n)$ is a divergent series.
]

#warning-block[
  - This does not tell you what value the series converges to!!!!!!
  - This test does not always hold without all 3 of the assumptions. $f$ must be continuous, positive, and decreasing to use this test. If you don't check these conditions you can't use the integral test.
]

We have already determined for which values of $p$ the integral $integral_1^infinity 1/x^p dif x$ converges and diverges. So...
#corollary[$p$-Series Test][
  The $p$-series $display(sum_(n=1)^infinity 1/n^p)$,
  #set enum(numbering: "(i)", spacing: 2em)
  + converges if $p>1$
  + diverges if $p lt.eq 1$
]

#tip-block[
  We are starting to build up a few test we can use for series convergence, and it will begin to be a challenge to identify which to use. For $sum_(n=1)^infinity a_n$ so far we can use
  - the divergence test (if #sequence() doesnt converge to 0 then the series diverges)
  - Think about the partial sums (usful for telescoping series and things that easily simplify when added together)
  - $p$-series test (for $a_n=1/n^p$ type things)
  - integral test (for things that are easy/possible to integrate using our integration techniques)

  We will add to this list, so keeping a reference of each test (and a short description of when to use them) easily accessible in your notes will be good.
]

#example[
  Determine whether the series $display(sum_(n=1)^infinity (ln(n))/n)$ converges or diverges.
]
#my-solution-block[
  It us often useful to do a quick check that the sequence converges to 0 before progressing:
  $
    lim_n arrow infinity (ln(n))/n & =^"LH" (1/n)/1 & = 0
  $
  So the series is not obviously divergent. We still don't know if it converges or diverges.

  Next, we run through our other tests. It won't be easy to simplify the partial sums, and this is not a $p$-series. So we try the integral test. Let
  $
    f(x) = (ln(x))/x.
  $
  Notice this is something we can integrate, let's see if it converges or not: $u=ln(x)$ $dif u = 1/x dif x$ so
  $
    integral_1^infinity (ln(x))/x dif x & = lim_(t arrow infinity) integral_1^t (ln(x))/x dif x \
                                        & = lim_(t arrow infinity) integral_(u(1))^(u(t)) u dif u \
                                        & = lim_(t arrow infinity) (u^2)/2 |_(u(1))^(u(t)) \
                                        & = lim_(t arrow infinity) (1/2 (ln(x))^2) |_(1)^(t) \
                                        & = lim_(t arrow infinity) (1/2 (ln(t))^2 - 0) \
                                        & = infinity
  $
  Thus, *by the Integral Test*, the series diverges.
]
#warning-block[
  - You will lose points for not using proper limit notation on improper integrals in this seciton.
  - You will also lose points for not stating which series convergence test you are using. These might be good things to make flashcards of and study as we move towards the exam.
]

=== Remainder Estimate for Integral Test
Suppose a series converges, and we want to estimate its value. How can we do this?

- If a series converges, then, by definition (even if it is hard for us to calculate directly), its value is the limit of the sequence of partial sums. So, we can take a sufficiently long partial sum to approximate the value. The larger $n$ we use for the $n^"th"$ partial sum, the better the estimate, since we're adding more of the terms.

#theorem[Remainder Estimate for Integral Test][
  Suppose $f(n)=a_n$, where $f$ is a continuous, positive, decreasing function for $x gt.eq N$ and $display(sum_(n=1)^infinity a_n)$ is convergent.

  The remainder, $R_n$, is the error made when $s_n$, the sum of the first $n$ terms, is used as an approximation to the total sum, $s$. We define
  $ R_n = s - s_n = a_(n+1) + a_(n+2) + a_(n+3) + ... $
  Then, we know that
  $
    R_n = a_(n+1) + a_(n+2) + a_(n+3) + ... lt.eq integral_n^infinity f(x) dif x
  $
  and
  $ R_n = a_(n+1) + a_(n+2) + a_(n+3) + ... gt.eq integral_(n+1)^infinity f(x) dif x $
  So,
  $
    integral_(n+1)^infinity f(x) dif x lt.eq R_n lt.eq integral_n^infinity f(x) dif x
  $
  gives us an error approximation to the estimation $s_n$.
]

#example[
  Approximate the sum of the series $display(sum_(n=1)^infinity 1/n^2)$ by using the $10^"th"$ partial sum, namely by adding the first 10 terms of the series. How many terms are needed to guarantee an approximation for the series that is accurate to at least 3 decimal places?
]
#my-solution-block[
  $
    s_(10) & = sum_(n=1)^(10) 1/n^2 \
           & = 1 + 1/4 + 1/9 + ... + 1/100 approx 1.54976773117
  $
  To guarantee our approximation is accurate to at least 3 decimal places, we need the error (or the remainder $R_n$) to be less than 0.001. We'll see what value of $n$ guarantees $R_n lt.eq 0.001$ by solving when $R_n < 0.001$. We know by the remainder estimate that
  $
    R_n & lt.eq integral_n^infinity 1/x^2 dif x \
  $
  This integral is
  $
    integral_n^infinity 1/x^2 dif x & = lim_(t arrow infinity) integral_n^t 1/x^2 dif x \
                                    & = lim_(t arrow infinity) -1/x |_n^t \
                                    & = lim_(t arrow infinity) 1/n - 1/t \
                                    & = 1/n.
  $
  Then, since we know $R_n lt.eq 1/n$, to get $R_n < 0.001 = 1/1000$ we need $1/n<1/1000$ or $n>1000$. So, to *guarantee* that the estimate is accurate up to 3 decimal places we need to use $n>1000$.
]
It turns out this is an overestimate of what is actually needed to get an accurate approximation of the series. We only need up to $n=32$ to get 3 decimals of accuracy in this case. Much less than 1000.

#emph-block[
  11.3 Section Summary:
  - We used integrals to bound series
  - We used integrals to bound the error when approximating series with partial sums.
]

