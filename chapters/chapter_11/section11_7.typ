#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.7")
      #counter(heading).update(10)
      = Sequences and Series
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
    ]
  } else if (
    sys.inputs.at("html-frames", default: "false") == "true"
      and sys.inputs.at("individualchs", default: "false") == "true"
  ) {
    [ // if single html still print the stuff
      #counter(heading).update(10)
      = Sequences and Series
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
    ]
  } else {
    // main html
    [
      #counter(heading).update(11)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)

    ]
  }
}

== Strategy for Testing Series
// any functions and templating you want for just this chapter can go here

#emph-block[
  11.7 Learning Objectives
  - Summarize the different techniques for determining convergence and divergence in series.
]


First we have a few known series that we can quickly determine the convergence of.

#theorem[Geometric Series Test][
  For the series #auto-alt($display(sum_(n=1)^oo a dot r^(n-1))$) we have the following.

  If #auto-alt($|r|<1$), the *geometric series* #auto-alt($display(sum_(n=1)^infinity a r^(n-1))$) converges, and
  #auto-alt(
    $
      sum_(n=1)^infinity a r^(n-1) = a/(1-r)
    $,
  )

  #auto-alt($r$) is called the *ratio*

  If #auto-alt($|r| gt.eq 1$) the series diverges.
]

#theorem[P-Test for #auto-alt($p$)-series][
  For a #auto-alt($p$)-series of the form #auto-alt($display(sum_(n=1)^infinity 1/n^p)$) we have the following.
  + If #auto-alt($p=1$), we call the series #auto-alt($ sum_(n=1)^infinity 1/n = 1+1/2+1/3+1/4+1/5+1/6+... $) the Harmonic Series. It diverges.
  + If #auto-alt($p>1$), the series converges.
  + If #auto-alt($p < 1$), the series diverges.
]

Then we get into the rest of the tests for series convergence.
#theorem[Divergence Theorem (Test for Divergence)][
  If the series #auto-alt($display(sum_(n=1)^infinity a_n)$) is convergent, then #auto-alt($display(lim_(n arrow infinity) a_n = 0)$).

  Therefore,
  - If #auto-alt($display(lim_(n arrow infinity)) a_n eq.not 0$), then #auto-alt($display(sum_(n=1)^infinity a_n)$) is divergent.
  - If #auto-alt($display(lim_(n arrow infinity) a_n = 0)$), then the series may converge or diverge. The test is inconclusive.
]

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon,
  table.header([*Pros*], [*Cons*], [*Notes*]),
  [Usually an easy limit to compute],
  [if #auto-alt($lim_(n arrow infinity) a_n = 0$), we cannot conclude anything],
  [you may need to use l'Hospital's rule, remember to do this with functions of #auto-alt($x$)],
)

#theorem[The Integral Test][
  Let #sequence() be a sequence of positive terms. Suppose that #auto-alt($a_n=f(n)$), where #auto-alt($f$) is a continuous, positive, and decreasing function of #auto-alt($n$) for all #auto-alt($n gt.eq N$) (where #auto-alt($N$) is a positive integer).
  Then,
  #set enum(numbering: "(i)", spacing: 2em)
  + If #auto-alt($display(integral_N^infinity f(x) dif x)$) is convergent, then #auto-alt($display(sum_(n=1)^infinity a_n)$) is a convergent series.
  + If #auto-alt($display(integral_N^infinity f(x) dif x)$) is divergent, then #auto-alt($display(sum_(n=1)^infinity a_n)$) is a divergent series.
]

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon,
  table.header([*Pros*], [*Cons*], [*Notes*]),
  [We can use integral techniques!],
  [Lots of conditions/hypotheses to check, and we have to compute an improper integral.],
  [This is usually a "last resort" if other tests fail. Also, remember limit notation for improper integrals. Often this is useful if there are logarithms in your series.],
)


#theorem[Alternating Series Test][
  If an alternating series, #auto-alt($display(sum_(n=1)^oo a_n)$) of the form
  #auto-alt(
    $
      sum_(n=1)^oo (-1)^(n-1) b_n " or " sum_(n=1)^oo (-1)^(n) b_n,
    $,
  )
  where #auto-alt($b_n >= 0$) satisfies:
  #set enum(numbering: "(i)", spacing: 2em)
  + #auto-alt($b_(n+1)<= b_n$) for all #auto-alt($n >= N$)
  + #auto-alt($display(lim_(n arrow infinity) b_n = 0)$)

  then the series #auto-alt($display(sum_(n=1)^oo a_n)$) is convergent.
]

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon,
  table.header([*Pros*], [*Cons*], [*Notes*]),
  [Great for alternating series, not much else],
  [Does not tell you divergence, use divergence test for this...],
  [If (i) does not hold, try ratio or root test. ],
)


#theorem[The Direct Comparison Test (Comparison Test)][
  Suppose that #auto-alt($display(sum_(n=1)^infinity a_n)$) and #auto-alt($display(sum_(n=1)^infinity b_n)$) are series with positive terms.

  #set enum(spacing: 2em, numbering: "(i)")
  + If #auto-alt($display(sum_(n=1)^infinity b_n)$) is convergent and #auto-alt($a_n lt.eq b_n$) for all #auto-alt($n gt.eq N$), then #auto-alt($display(sum_(n=1)^infinity a_n)$) converges.
  + If #auto-alt($display(sum_(n=1)^infinity b_n)$) is divergent and #auto-alt($a_n gt.eq b_n$) for all #auto-alt($n gt.eq N$), then #auto-alt($display(sum_(n=1)^infinity a_n)$) diverges.
]

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon,
  table.header([*Pros*], [*Cons*], [*Notes*]),
  [Usually easy if you can find #auto-alt($b_n$).],
  [Have to show and inequality, and also figure out #auto-alt($b_n$)],
  [Usually you choose #auto-alt($sum b_n$) to be a geometric or #auto-alt($p$) series.],
)


#theorem[The Limit Comparison Test][
  Suppose that #auto-alt($display(sum_(n=1)^infinity a_n)$) and #auto-alt($display(sum_(n=1)^infinity b_n)$) are series with positive terms. If
  #auto-alt(
    $
      lim_(n arrow infinity) a_n/b_n = c
    $,
  )
  where #auto-alt($c$) is a finite positive number (#auto-alt($c>0$)), then either both seris converge, or both series diverge.
]

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon,
  table.header([*Pros*], [*Cons*], [*Notes*]),
  [Similar to DCT, but no longer need to show an inequality.],
  [Sometiems the limit we need to compute has tricky algebra, be careful.],
  [Same as DCT, choose #auto-alt($sum b_n$) carefully, probably geometric or #auto-alt($p$) series.],
)


#theorem[The Ratio Test][
  For a series #auto-alt($display(sum_(n=1)^oo a_n)$)
  #set enum(numbering: "(i)", spacing: 2em)
  + If #auto-alt($display(lim_(n -> oo) abs((a_(n+1))/(a_n)) = L < 1)$), then the series #auto-alt($display(sum_(n=1)^oo a_n)$) is *absolutely convergent* (and therefore convergent).
  + If #auto-alt($display(lim_(n -> oo) abs((a_(n+1))/(a_n)) = L > 1)$), then the series #auto-alt($display(sum_(n=1)^oo a_n)$) is *divergent*.
  + If #auto-alt($display(lim_(n -> oo) abs((a_(n+1))/(a_n)) = L = 1)$), then the Ratio Test is *inconclusive*. The series #auto-alt($display(sum_(n=1)^oo a_n)$) may absolutely converge, conditionally converge, or diverge. We cannot determine this with ratio test.
]

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon,
  table.header([*Pros*], [*Cons*], [*Notes*]),
  [No conditions to check!],
  [If #auto-alt($L=1$), need to try something else],
  [Works well when we have factorials and exponents.],
)



#theorem[The Root Test][
  #set enum(numbering: "(i)", spacing: 2em)
  + If #auto-alt($display(lim_(n arrow infinity) root(n, abs(a_n))=L<1)$), then the series #auto-alt($display(sum_(n=1)^infinity a_n)$) is *absolutely convergent* (and therefore convergent).
  + If #auto-alt($display(lim_(n arrow infinity) root(n, abs(a_n))=L>1)$), then the series #auto-alt($display(sum_(n=1)^infinity a_n)$) is *divergent*.
  + If #auto-alt($display(lim_(n arrow infinity) root(n, abs(a_n))=L=1)$), the Root Test is *inconclusive*. i.e. #auto-alt($display(sum_(n=1)^infinity a_n)$) may absolutely converge, conditionally converge, or diverge. We need a different test to figure out which.
]

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon,
  table.header([*Pros*], [*Cons*], [*Notes*]),
  [No conditions to check!],
  [If #auto-alt($L=1$), need to use another test.],
  [Works well when #auto-alt($a_n=("something with "n)^n$)],
)


#exercise[
  Take the time to make flash cards and/or a flowchart for the different series convergence tests above.
]


#emph-block[
  11.7 Section Summary:
  - We summarized all the different *series* convergence tests and when you might use them.
]

