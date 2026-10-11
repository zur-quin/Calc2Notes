// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(10)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.1b")
      = Sequences and Series
      #counter(heading).update(11)
      #counter(heading).step(level: 2)
      == Sequences
    ]
  } else if (
    sys.inputs.at("html-frames", default: "false") == "true"
      and sys.inputs.at("individualchs", default: "false") == "true"
  ) {
    [ // if single html still print the stuff
      = Sequences and Series
      #counter(heading).update(11)
      #counter(heading).step(level: 2)
      == Sequences
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
// #counter(heading).step(level: 3)
// #counter(heading).step(level: 3)

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.2b Learning Objectives

]



#theorem[Divergence Theorem (Test for Divergence)][
  If the series #auto-alt($display(sum_(n=1)^infinity)$) is convergent, then #auto-alt($display(lim_(n arrow infinity) a_n = 0)$).

  Therefore,
  - If #auto-alt($display(lim_(n arrow infinity)) a_n eq.not 0$), then #auto-alt($display(sum_(n=1)^infinity a_n)$) is divergent.
  - If #auto-alt($display(lim_(n arrow infinity) a_n = 0)$), then the series may converge or diverge. The test is inconclusive.
]

#example[
  Use the divergence test to determine the divergence of the following series if applicable.
  #auto-alt(
    $
      sum_(k=1)^infinity (k^2)/(k^2-2k+5)
    $,
  )
]
#my-solution-block[
  Looking at the limit of the terms we have
  #auto-alt(
    $
      lim_(k arrow infinity) (k^2)/(k^2-2k+5) =^"LH" lim_(k arrow infinity) (2k)/(2k-2) =^"LH" lim_(k arrow infinity) 2/2 = 1 eq.not 0
    $,
  )
  Thus, by the Divergence Theorem, the series diverges.
]

#example[
  Use the divergence test to determine the divergence of the following series if applicable.
  #auto-alt(
    $
      sum_(n=1)^infinity ln((n^2+1)/(2n^2+1))
    $,
  )
]
#my-solution-block[
  Looking at the limit of the terms we have
  #auto-alt(
    $
      lim_(n arrow infinity) ln((n^2+1)/(2n^2+1)) & = ln(lim_(n arrow infinity) (n^2+1)/(2n^2+1)) \
                                                  & =^"LH" ln(lim_(n arrow infinity) (2n)/(4n)) \
                                                  & = ln(1/2) eq.not 0 \
    $,
  )
  Thus, by the Divergence Theorem, the series diverges.
]

#example[
  Use the divergence test to determine the divergence of the following series if applicable.
  #auto-alt(
    $
      sum_(n=1)^infinity 1/(1+n)
    $,
  )
]
#my-solution-block[
  Looking at the limit of the terms we have
  #auto-alt(
    $
      lim_(n arrow infinity) 1/(1+n) = 0
    $,
  )
  So the Divergence Theorem is inconclusive. (We cannot say if it diverges or converges yet).

]

#definition[Geometric Series][
  Geometric Series are series of the form
  #auto-alt(
    $
      a+a r+a r^2 + ... + a r^(n-1) + ... = sum_(n=1)^infinity a r^(n-1)
    $,
  )
  in which #auto-alt($a$) and #auto-alt($r$) are fixed real numbers and #auto-alt($a eq.not 0$).
  The series can also be written
  #auto-alt(
    $
      sum_(n=0)^infinity a r^n
    $,
  )
  The ratio #auto-alt($r$) can be positive or negative.
]

#remark-block[
  Geometric series are named this way because they often relate to proportions in geometric shapes. For example, consider #auto-alt($display(sum_(n=1)^infinity 1/2^n)$).
  #auto-alt(
    $
      sum_(n=1)^infinity 1/2^n = 1/2 + 1/4 + 1/8 + 1/16 + ...
    $,
  )
  #figure(image(
    "figures/geometricseries.svg",
    alt: "picture of a square cut into half then half again then half again and half again and so on",
  ))
  In the limit, this series is equal to 1, which consists of the area of the entire square.
]

For any geometric series, we can determine the exact value if it converges.
#auto-alt(
  $
    sum_(n=1)^infinity a r^(n-1) & = a + a r + a r^2 + a r^3 + dots \
                             s_n & = a + a r + a r^2 + dots + a r^(n-1) \
                           r s_n & = a r + a r^2 + dots + a r^(n-1) + a r^n \
                     s_n - r s_n & = a - a r^n \
                       s_n (1-r) & = a (1-r^n) \
                             s_n & = (a (1-r^n))/(1-r) \
  $,
)
This sequence of partial sums converges precisely when #auto-alt($|r|<1$); otherwise, #auto-alt($1-r^n arrow - infinity$). If #auto-alt($|r|<1$), then #auto-alt($1-r^n arrow 1$), so
#auto-alt(
  $
    sum_(n=1)^infinity = a/(1-r).
  $,
)

#theorem[
  If #auto-alt($|r|<1$), the *geometric series* #auto-alt($display(sum_(n=1)^infinity a r^(n-1))$) converges, and
  #auto-alt(
    $
      sum_(n=1)^infinity a r^(n-1) = a/(1-r)
    $,
  )

  #auto-alt($r$) is called the *ratio*

  If #auto-alt($|r| gt.eq 1$) the series diverges.
]

#example[
  Find #auto-alt($display(sum_(k=1)^infinity (2/3)^k)$).
]

#my-solution-block[
  We can rewrite this a little to look like
  #auto-alt(
    $
      sum_(k=1)^infinity (2/3)^k = sum_(k=1)^infinity 2/3 (2/3)^(k-1).
    $,
  )
  Then it is easy to see this is a geometric series with #auto-alt($r=2/3 < 1$) and #auto-alt($a=2/3$).
  So, this series converges to
  #auto-alt(
    $
      sum_(k=1)^infinity 2/3 (2/3)^(k-1) = a/(1-r) = (2/3)/(1-2/3) = 2.
    $,
  )
]

#example[
  Does the series #auto-alt($display(sum_(n=1)^infinity 2^(2n) 5^(1-n))$) converge or diverge? If the series converges, then find its sum.
]
#my-solution-block[
  We rewrite the series with exponent rules to clearly see #auto-alt($a$) and #auto-alt($r$)
  #auto-alt(
    $
      sum_(n=1)^infinity 2^(2n) 5^(1-n) & = sum_(n=1)^infinity (2^2)^(n) 5^(1)5^(-n) \
                                        & = sum_(n=1)^infinity 5^(1) (4)^(n) (5^(-1))^(n) \
                                        & = sum_(n=1)^infinity 5 (4/5)^(n) \
                                        & = sum_(n=1)^infinity 5 (4/5) (4/5)^(n-1) \
                                        & = sum_(n=1)^infinity 4 (4/5)^(n-1) \
    $,
  )
  So this is a geometric series with #auto-alt($a=4$) and #auto-alt($r = 4/5 < 1$). Because #auto-alt($r<1$), this series converges. So, it converges to
  #auto-alt(
    $
      sum_(n=1)^infinity 4 (4/5)^(n-1) = 4/(1-4/5) = 20.
    $,
  )
]

#theorem[Algebraic Properties of Infinite Series][
  Given #underline("convergent") series #auto-alt($display(sum_(n=1)^infinity a_n)$), #auto-alt($display(sum_(n=1)^infinity b_n)$), and any constant #auto-alt($c$), the following are true:

  #set enum(spacing: 2em)
  + The series #auto-alt($display(sum_(n=1)^infinity a_n+sum_(n=1)^infinity b_n)$)
  + The series #auto-alt($display(sum_(n=1)^infinity c a_n = c sum_(n=1)^infinity a_n)$)
    #set enum(spacing: auto)
]

#example[
  Determine the convergence of the series
  #auto-alt(
    $
      sum_(n=1)^infinity (2^n + e^n)/(pi^n)
    $,
  )
]

#my-solution-block[
  #auto-alt(
    $
      sum_(n=1)^infinity (2^n + e^n)/(pi^n) & = sum_(n=1)^infinity (2^n )/(pi^n) + sum_(n=1)^infinity (e^n)/(pi^n) \
                                            & = sum_(n=1)^infinity 2/pi (2/pi)^(n-1) + sum_(n=1)^infinity e/pi (e/pi)^(n-1) \
    $,
  )
  Since these geometric series have #auto-alt($r=2/pi<1$) and #auto-alt($r=e/pi<1$) they converge. So

  #auto-alt(
    $
      sum_(n=1)^infinity (2^n + e^n)/(pi^n) & = (2/pi)/(1-2/pi) + (e/pi)/(1-e/pi) \
                                            & = 2/(pi-2) + e/(pi-e)
    $,
  )
  The series converges.
]

#example[
  Find the values of #auto-alt($x$) for which the series converges.
  #auto-alt(
    $
      sum_(n=0)^infinity x^n
    $,
  )
]
#my-solution-block[
  This is a geometric series for all #auto-alt($x$), so it converges when #auto-alt($|x|<1$). This is because #auto-alt($x$) is the ratio, so this converges for #auto-alt($x$) in #auto-alt($(-1,1)$).
]
This is called an interval of convergence, which we will discuss more later.

#example[
  Find the values of #auto-alt($x$) for which the series converges.
  #auto-alt(
    $
      sum_(n=0)^infinity (-4)^n(x-5)^n
    $,
  )
]
#my-solution-block[
  #auto-alt(
    $
      sum_(n=0)^infinity (-4)^n(x-5)^n & = sum_(n=0)^infinity (-4(x-5))^n
    $,
  )
  This converges when #auto-alt($r = -4(x-5)$) has #auto-alt($|r|<1$), so
  #auto-alt(
    $
      |-4(x-5)| & < 1 \
        4 |x-5| & < 1 \
          |x-5| & < 1/4
    $,
  )
  So #auto-alt($x-5 < 1/4 arrow.double x < 21/4$) and #auto-alt($x-5 > - 1/4 arrow.double x > 19/4$). So the interval of #auto-alt($x$) where this series converges is #auto-alt($(19/4,21/4)$).
]

#example[Extra Example][
  Malaria is a parasitic infection transmitted by mosquito bites, mainly in tropical area of the world. Suppose a person is given a 50 mg dose of quinine at the same time every day for the prevention of malaria. After the first dose, the person has 50 mg of quinine in the body. Each day, the person's body metabolizes some of the quinine so that, after one day 23% of the original amount remains. How much quinine remains in the body after a long time with a dose every day?
]

#my-solution-block[
  We need to add up the total amount of quinine, so we will track how much is left after each day.
  Day 1: #auto-alt($50$)

  Day 2: #auto-alt($50 + (0.23) 50$)

  Day 3: #auto-alt($50 + (0.23) 50 + (0.23)^2 50$)

  Day 4: #auto-alt($50 + (0.23) 50 + (0.23)^2 50 + (0.23)^3 50$)

  and so on. Thus, the total amount after a very long time is
  #auto-alt(
    $
      sum_(n=1)^infinity 50 (0.23)^n-1 = 50/(1-0.23) = 50/0.77 approx 64.95"mg"
    $,
  )
]

#emph-block[
  11.2b Section Summary:
  - We used the divergence test to tell if series diverged.
  - We went over geometric series and the formula for their value.
  - We went over algebraic properties of series.
]

