#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(7)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 8.5")
    ]
  }
}
= Even More Integral Applications
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
== Probability

// any functions and templating you want for just this chapter can go here

#emph-block[
  8.5 Learning Objectives
  - Understand how we describe probability of events using integrals
  - Identify whether a function can be a probability density function
  - Find probability of events occurring using a PDF
  - Find the mean value of a PDF
]

#definition[Probability][
  The *probability* of an event is how likely the event is to occur, and is restricted to values between #closedint("0", "1").
]
#example[
  If you flip a coin, the probability it lands on either side is 0.5 (which we normally translate to 50%).
]

#definition[Discrete Random Variable][
  #auto-alt($X$) is a *discrete random variable* if it is a number that represents an outcome that can only be certain distinct values.
]
#example[
  The result of rolling a six sided die, or the number of times you need to flip a coin before getting "heads" are two examples of discrete random variables. The first has a finite set of outcomes: #auto-alt(${1,2,3,4,5,6}$), the second has a countable set of outcomes: #auto-alt(${1,2,3,4,5,6,7,8,...}$) (depending on how unlucky you are).
]

=== Continuous Random Variables and Probability Density
We'll spend our time in probability land here:
#definition[Continuous Random Variable][
  #auto-alt($X$) is a *continuous random variable* if it is a number that represents an outcome that can take any real value on some interval.
]

#example[
  - The height of a randomly selected person on Earth is a continuous random variable, the person _could_ be any height from 0 feet to 10 feet tall, so the random variable has a set of outcomes #auto-alt($[0,10]$). (In a fancy probability class you'd call this interval the support of the random variable, but you don't need to know that for now)

  - The number of inches a die rolls after dropping it is a continuous random variable, the die _could_ roll anywhere from 0 inches to 12 inches (because your dice rolling tray is only 12 inches long and has negligible width ;) ). This random variable has a set of outcomes in #auto-alt($[0,12]$).

  - The number of hours before the Colorado Rockies win a Baseball game is a continuous random variable (so long as we are being VERY exact about our timing (#auto-alt($t$) can be any positive real number) and taking care to think about when the game is, etc). The Rockies _could_ win their next game (we'll assume it ends in 2 hours) or they may never win again, so this random variable can have an outcome in #auto-alt($[120,infinity)$).
]

#property[Probability Density Function][
  Every continuous random variable, #auto-alt($X$) has a *probability density function*, #auto-alt($f(x)$), such that

  - The probability that #auto-alt($X$) is between #auto-alt($a$) and #auto-alt($b$) is given by
    #auto-alt(
      $
        P(a lt.eq X lt.eq b) = integral_a^b f(x) dif x.
      $,
    )
  - The probability density function is always non-negative,
    #auto-alt(
      $
        f(x) gt.eq 0
      $,
    )
  - The "total probability" is 1, that is
    #auto-alt(
      $
        integral_(-infinity)^infinity f(x) dif x = 1
      $,
    )
]

#note-block[
  For a continuous random variable #auto-alt($X$), the probability that #auto-alt($X=c$) for any real #auto-alt($c$) in the set of possible outcomes of #auto-alt($X$) is 0. This is because no matter the probability density function #auto-alt($f(x)$), #auto-alt($integral_c^c f(x) dif x = 0$).
]

#fun-fact-block[
  Although you do not have the tools to integrate #auto-alt($e^(-x^2)$), a scaled version of this is a probability density function that represents the normal distribution! It has domain #openint("-infinity", "infinity") Specifically,
  #auto-alt(
    $
      f(x) = 1/(sqrt(2 pi sigma^2)) exp(-((x-mu)^2)/(2sigma^2))
    $,
  )
  for some constants #auto-alt($mu, sigma$). So, we know that
  #auto-alt(
    $
      integral_(-infinity)^infinity 1/(sqrt(2 pi sigma^2)) exp(-((x-mu)^2)/(2sigma^2)) dif x = 1.
    $,
  )
]

#example[
  Let
  #block_eq(
    $
      f(x) = cases(
        delim: "{", 1/6 x(10-x) #h_html(2em)& 0 lt.eq x lt.eq 10,
        0 & "otherwise"
      )
    $,
    "f of x is the piecewise function defined as one sixth times x times ten minus x for 0 less than or equal to x less than or equal to ten and f is defined as 0 otherwise.",
  )
  Could #auto-alt($f(x)$) be a PDF for some continuous random variable?
]
#my-solution-block[
  We need to check 2 things: Is #auto-alt($f(x) gt.eq 0$), and is #auto-alt($integral_(-infinity)^infinity f(x) dif x = 1$)?

  First, for #auto-alt($0 lt.eq x lt.eq 10$), we have #auto-alt($1/6 x gt.eq 0$) and #auto-alt($10-x gt.eq 0$) and the product of 2 non-negative numbers in non-negative. Outside this interval #auto-alt($f(x)=0 gt.eq 0$) so yes, #auto-alt($f(x)gt.eq 0$) everywhere.

  Second, we check the integral
  #auto-alt(
    $
      integral_(-infinity)^infinity f(x) dif x & = integral_(-infinity)^0 0 dif x + integral_0^10 1/6 x(10-x) dif x + integral_(10)^infinity 0 dif x \
      & = 0 + integral_0^(10) 1/6 x(10-x) dif x + 0 \
      & = 1/6 integral_0^(10) 10x-x^2 dif x \
      & = 1/6 [5x^2-x^3/3] |_0^(10)\
      & = 1/6 (500-1000/3) \
      & = 500/18 eq.not 1.
    $,
  )
  So, #auto-alt($f(x)$) could not be a PDF for some continuous random variable.
]

#exercise[
  Show that #auto-alt($f(x)$) is a PDF for some random variable #auto-alt($X$).
  #block_eq(
    $
      f(x) = cases(
        delim: "{", pi/2 sin(pi x) #h_html(2em)& 0 lt.eq x lt.eq 1,
        0 & "otherwise"
      )
    $,
    "f of x is the piecewise function defined as pi over 2 times sine of pi x for 0 less than or equal to x less than or equal to 1 and f is defined as 0 otherwise.",
  )
]

#example[
  Find #auto-alt($P(X gt.eq 1/2)$), if the PDF for #auto-alt($X$) is
  #block_eq(
    $
      f(x) = cases(
        delim: "{", pi/2 sin(pi x) #h_html(2em)& 0 lt.eq x lt.eq 1,
        0 & "otherwise"
      )
    $,
    "f of x is the piecewise function defined as pi over 2 times sine of pi x for 0 less than or equal to x less than or equal to 1 and f is defined as 0 otherwise.",
  )
]

#my-solution-block[
  We can assume this is a PDF (because we showed it in previous exercise, but also the wording of the problem). Then all we do is find
  #auto-alt(
    $
      P(X gt.eq 1/2) & = integral_(1/2)^infinity f(x) dif x \
                     & = integral_(1/2)^1 pi/2 sin(pi x) dif x + integral_(1)^infinity 0 dif x \
                     & = pi/2 integral_(1/2)^1 sin(pi x) dif x \
                     & = pi/2 1/pi integral_(pi/2)^pi sin(u) dif u \
                     & = 1/2 (-cos(u))|_(pi/2)^pi \
                     & = 1/2 (cos(pi/2)-cos(pi)) \
                     & = 1/2 (0-(-1)) \
                     & = 1/2
    $,
  )
  Where #auto-alt($u=pi x$), #auto-alt($dif u = pi dif x$), #auto-alt($u(1/2)=pi/2$), #auto-alt($u(1)=pi$).
]
#note-block(
  "Note, probability is always between 0 and 1. This is a good thing to double check at the end, is the probability between 0 and 1?",
)

=== Mean Value of a Probability Density Function
#definition[Mean of a random variable][
  The average, or *mean*, or *expected value* of a continuous random variable #auto-alt($X$) with probability density function #auto-alt($f(x)$) is
  #auto-alt(
    $
      mu = integral_(-infinity)^(infinity) f(x) x dif x
    $,
  )
]

#remark-block[
  Consider the PDF #auto-alt($f(x)$) on #openint("-infinity", "infinity"). Now, consider the lamina defined as the area under #auto-alt($f(x)$). What is the #auto-alt($x$) coordinate of the centroid of this lamina?

  #auto-alt(
    $
      overline(x) = (integral_(-infinity)^(infinity) f(x) x dif x)/(integral_(-infinity)^(infinity) f(x) dif x)
    $,
  )
  However, since #auto-alt($f(x)$) is a PDF, #auto-alt($integral_(-infinity)^(infinity) f(x) dif x=1$). So,
  #auto-alt(
    $
      overline(x) = (integral_(-infinity)^(infinity) f(x) x dif x)/1 = integral_(-infinity)^(infinity) f(x) x dif x.
    $,
  )

  How does this relate to the average of a continuous random variable with #auto-alt($f$) as its PDF?

  It is the same!
]

=== Median Value of a Probability Density Function
#definition[Median of a random variable][
  The *median* of a random variable #auto-alt($X$) with probability density function #auto-alt($f(x)$) is #auto-alt($M$), where #auto-alt($M$) is found by solving
  #auto-alt(
    $
      integral_(-infinity)^M f(x) dif x = 1/2.
    $,
  )
]

#exercise[
  Find the median of a continuous random variable #auto-alt($X$) with probability density function defined as
  #block_eq(
    $
      f(x) = cases(
        delim: "{", pi/2 sin(pi x) #h_html(2em)& 0 lt.eq x lt.eq 1,
        0 & "otherwise"
      )
    $,
    "f of x is the piecewise function defined as pi over 2 times sine of pi x for 0 less than or equal to x less than or equal to 1 and f is defined as 0 otherwise.",
  )
  _Hint: we saw this function earlier_
]

#example[
  While taking a walk along the road where you live, you accidentally drop your glove, but you don't know where. The probability density function #auto-alt($f(x)$) for having dropped your glove #auto-alt($x$) kilometers from home is
  #auto-alt(
    $
      f(x) = 2 e^(-2x), x gt.eq 0
    $,
  )
  (it is 0 otherwise)

  + What is the probability that you dropped your glove within 1 #zi.km() of your home?
  + At what distance #auto-alt($y$) from home is the probability that you dropped it within #auto-alt($y$) #zi.km() of home at least 95%?
  + What is the mean value for when you dropped your glove?
  + What is the median value for when you dropped your glove?
]

#my-solution-block[
  + What is the probability that you dropped your glove within 1 #zi.km() of your home?
    #auto-alt(
      $
        P(0 lt.eq X lt.eq 1) & = integral_0^1 2e^(-2x) dif x \
                             & = integral_0^(-2) -e^u dif u \
                             & = -e^u |_0^(-2) \
                             & = -e^(-2)-(-e^0) \
                             & = 1-e^(-2) \
                             & approx 0.86
      $,
    )
    The probability the glove was dropped within #zi.km() is 86%.
  + At what distance #auto-alt($y$) from home is the probability that you dropped it within #auto-alt($y$) #zi.km() of home at least 95%?\
    We need to solve when #auto-alt($P(0lt.eq x lt.eq y) = 0.95$), so
    #auto-alt(
      $
                     &&            0.95 & = P(0lt.eq x lt.eq y) \
                     &&                 & = integral_0^y 2e^(-2x) dif x \
                     &&                 & = integral_0^(-2y) -e^(u) dif u \
                     &&                 & = integral_0^(-2y) -e^(u) dif u \
                     &&                 & = 1-e^(-2y) \
        arrow.double &&           -0.05 & = -e^(-2y) \
        arrow.double &&            0.05 & = e^(-2y) \
        arrow.double &&        ln(0.05) & = -2y \
        arrow.double && (ln(0.05))/(-2) & = y \
      $,
    )
    So, at #auto-alt($y approx 1.5$)#zi.km() from home, there is a 95% chance you dropped your glove before this point.
  + What is the mean value for when you dropped your glove?
    #auto-alt(
      $
        mu & = integral_(-infinity)^infinity f(x) x dif x \
           & = integral_(-infinity)^0 0 dif x + integral_(0)^infinity 2e^(-2x) x dif x \
           & = 0 + integral_(0)^infinity 2e^(-2x) x dif x \
           & = lim_(b arrow infinity) integral_(0)^b 2e^(-2x) x dif x \
      $,
    )
    which needs integration by parts
    #IBP(auto-alt($x$), auto-alt($dif x$), auto-alt($2e^(-2x) dif x$), vstep: auto-alt($=-e^(-2x)$))
    So
    #auto-alt(
      $
        mu & = lim_(b arrow infinity) [-x e^(-2x)|_0^b - integral_0^b-e^(-2x)dif x] \
           & = lim_(b arrow infinity) [-x/e^(2x)|_0^b + integral_0^b e^(-2x)dif x] \
           & = lim_(b arrow infinity) [-x/e^(2x)|_0^b + e^(-2x)/(-2)|_0^b] \
           & = lim_(b arrow infinity) [-b/e^(2b) + 0/e^(0) + e^(-2b)/(-2) - e^(0)/(-2)] \
           & = lim_(b arrow infinity) [-b/e^(2b) + e^(-2b)/(-2) + 1/(2)] \
           & = lim_(b arrow infinity) -b/e^(2b) + lim_(b arrow infinity) e^(-2b)/(-2) + 1/(2) \
           & = lim_(b arrow infinity) -b/e^(2b) + 0 + 1/(2) \
      $,
    )
    This limit has indeterminate form #auto-alt($-infinity/infinity$) so we need l'Hospital's rule
    #auto-alt(
      $
        mu & =^"LH" lim_(b arrow infinity) -1/(2e^(2b)) + 1/2 & = 0 + 1/2 = 1/2.
      $,
    )
    The mean distance for where you dropped your glove is #auto-alt($1/2$)#zi.km().
  + What is the median value for when you dropped your glove?
    We must solve for #auto-alt($M$) in
    #auto-alt(
      $
        &&                              integral_(-infinity)^M f(x) dif x & = 1/2 \
        && integral_(-infinity)^0 0 dif x + integral_(0)^M 2e^(-2x) dif x & = 1/2 \
        &&                                    0 + integral_(0)^M 2e^(-2x) & = 1/2 \
        &&                                                  -e^(-2x)|_0^M & = 1/2 \
        &&                                                      1-e^(-2M) & = 1/2 \
        &&                                                        e^(-2M) & = 1/2 \
        &&                                                            -2M & = ln(1/2) \
        &&                                                             2M & = ln(2) \
        &&                                                              M & = 1/2 ln(2) \
      $,
    )
    So the median distance for where you dropped your glove is #auto-alt($mu = 1/2 ln(2) approx 0.34$)#zi.km().
]


#emph-block[
  8.5 Section Summary:
  - We discussed continuous random variables, their probability density functions, and their mean and median values.
]

