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
  $X$ is a *discrete random variable* if it is a number that represents an outcome that can only be certain distinct values.
]
#example[
  The result of rolling a six sided die, or the number of times you need to flip a coin before getting "heads" are two examples of discrete random variables. The first has a finite set of outcomes: ${1,2,3,4,5,6}$, the second has a countable set of outcomes: ${1,2,3,4,5,6,7,8,...}$ (depending on how unlucky you are).
]

=== Continuous Random Variables
We'll spend our time in probability land here:
#definition[Continuous Random Variable][
  $X$ is a *continuous random variable* if it is a number that represents an outcome that can take any real value on some interval.
]

#example[
  - The height of a randomly selected person on Earth is a continuous random variable, the person _could_ be any height from 0 feet to 10 feet tall, so the random variable has a set of outcomes $[0,10]$. (In a fancy probability class you'd call this interval the support of the random variable, but you don't need to know that for now)

  - The number of inches a die rolls after dropping it is a continuous random variable, the die _could_ roll anywhere from 0 inches to 12 inches (because your dice rolling tray is only 12 inches long and has negligible width ;) ). This random variable has a set of outcomes in $[0,12]$.

  - The number of hours before the Colorado Rockies win a Baseball game is a continuous random variable (so long as we are being VERY exact about our timing ($t$ can be any positive real number) and taking care to think about when the game is, etc). The Rockies _could_ win their next game (we'll assume it ends in 2 hours) or they may never win again, so this random variable can have an outcome in $[120,infinity)$.
]

#property[Probability Density Function][
  Every continuous random variable, $X$ has a *probability density function*, $f(x)$, such that

  - The probability that $X$ is between $a$ and $b$ is given by
    $
      P(a lt.eq X lt.eq b) = integral_a^b f(x) dif x.
    $
  - The probability density function is always non-negative,
    $
      f(x) gt.eq 0
    $
  - The "total probability" is 1, that is
    $
      integral_(-infinity)^infinity f(x) dif x = 1
    $
]

#note-block[
  For a continuous random variable $X$, the probability that $X=c$ for any real $c$ in the set of possible outcomes of $X$ is 0. This is because no matter the probability density function $f(x)$, $integral_c^c f(x) dif x = 0$.
]

#fun-fact-block[
  Although you do not have the tools to integrate $e^(-x^2)$, a scaled version of this is a probability density function that represents the normal distribution! It has domain #openint("-infinity", "infinity") Specifically,
  $
    f(x) = 1/(sqrt(2 pi sigma^2)) exp(-((x-mu)^2)/(2sigma^2))
  $
  for some constants $mu, sigma$. So, we know that
  $
    integral_(-infinity)^infinity 1/(sqrt(2 pi sigma^2)) exp(-((x-mu)^2)/(2sigma^2)) dif x = 1.
  $
]

#example[
  Let
  $
    f(x) = cases(
      delim: "{", 1/6 x(10-x) #h_html(2em)& 0 lt.eq x lt.eq 10,
      0 & "otherwise"
    )
  $
  Could $f(x)$ be a PDF for some continuous random variable?
]
#my-solution-block[
  We need to check 2 things. Is $f(x) gt.eq 0$, and is $integral_(-infinity)^infinity f(x) dif x = 1$?

  First, for $0 lt.eq x lt.eq 10$, we have $1/6 x gt.eq 0$ and $10-x gt.eq 0$ and the product of 2 non-negative numbers in non-negative. Outside this interval $f(x)=0 gt.eq 0$ so yes, $f(x)gt.eq 0$ everywhere.

  Second, we check the integral
  $
    integral_(-infinity)^infinity f(x) dif x & = integral_(-infinity)^0 0 dif x + integral_0^10 1/6 x(10-x) dif x + integral_(10)^infinity 0 dif x \
    & = 0 + integral_0^10 1/6 x(10-x) dif x + 0
  $
]




#emph-block[
  8.5 Section Summary:
]

