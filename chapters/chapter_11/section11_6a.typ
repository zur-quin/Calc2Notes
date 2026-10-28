#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.6")
      #counter(heading).update(10)
      = Sequences and Series
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Ratio and Root Tests for Series
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
      == Ratio and Root Tests for Series
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
      == Ratio and Root Tests for Series
    ]
  }
}
// any functions and templating you want for just this chapter can go here

#emph-block[
  11.6 Learning Objectives
  - Know when and how to use the Ratio Test
  - Know when and how to use the Root Test
  - Understand why the ratio test is inconclusive when the ratio is 1
  - Understand why the root test is inconclusive when the root is 1
]

For the two comparison tests, we checked for convergence by looking at the rates of growth for both series. For the Ratio Test, we are going to directly check the growth rate of the terms in the sequence to determine if the series (adding up the terms of the sequence) converges. We will compare #auto-alt($abs(a_(n+1))$) to #auto-alt($abs(a_n)$), for ratio test we will do this by taking their ratio...
=== Ratio Test
#theorem[The Ratio Test][
  For a series #auto-alt($display(sum_(n=1)^oo a_n)$)
  #set enum(numbering: "(i)", spacing: 2em)
  + If #auto-alt($display(lim_(n -> oo) abs((a_(n+1))/(a_n)) = L < 1)$), then the series #auto-alt($display(sum_(n=1)^oo a_n)$) is *absolutely convergent* (and therefore convergent).
  + If #auto-alt($display(lim_(n -> oo) abs((a_(n+1))/(a_n)) = L > 1)$), then the series #auto-alt($display(sum_(n=1)^oo a_n)$) is *divergent*.
  + If #auto-alt($display(lim_(n -> oo) abs((a_(n+1))/(a_n)) = L = 1)$), then the Ratio Test is *inconclusive*. The series #auto-alt($display(sum_(n=1)^oo a_n)$) may absolutely converge, conditionally converge, or diverge. We cannot determine this with ratio test.
]

#note-block[
  *Recall:* For any geometric series, #auto-alt($ a + a r + a r^2 + ... = sum_(n=1)^infinity a r^(n-1) $) the variable #auto-alt($r$) is called the ratio. In fact, for the series, #auto-alt($r=abs(a_(n+1)/a_n)$), and if #auto-alt($|r|<1$) the geometric series converges, otherwise it diverges.

  For #auto-alt($r=1$), the conclusion that the geometric series diverges does not come from ratio test. It is coming from the divergence theorem (another test).
]

#example[
  Determine whether the series #auto-alt($display(sum_(n=1)^oo ((-1)^n n^2)/(5^n))$) is absolutely convergent, conditionally convergent, or divergent.
]
#note-block[
  - This is an alternating series, but the absolute value series, #auto-alt($display(sum_(n=1)^oo (n^2)/(5^n))$) is neither a #auto-alt($p$)-series, geometric series, or something we want to integrate. It is also no a series we can easily compare to #auto-alt($p$)-series or geometric series, so we try Ratio Test. Powers, exponentials, and (we'll later see) factorials can simplify a bit when we use Ratio Test.
]
#my-solution-block[
  By Ratio Test,
  #auto-alt(
    $
      lim_(n arrow oo) abs(a_(n+1) / a_n) & = lim_(n arrow infinity) abs(((-1)^(n+1) (n+1)^2)/(5^(n+1))) dot abs(5^n/((-1)^n n^2))\
      & = lim_(n arrow infinity) abs((- (n+1)^2)/(5n^2)) \
      & = lim_(n arrow infinity) 1/5 ((n+1)^2)/(n^2) \
      & = lim_(n arrow infinity) 1/5 (n^2+2n+1)/(n^2) \
      & = lim_(n arrow infinity) 1/5 (1+2/(n)+1/(n^2) )\
      & = 1/5 < 1 checkmark
    $,
  )
  Therefore, by the Ratio Test, #auto-alt($display(sum_(n=1)^oo ((-1)^n n^2)/(5^n))$) converges absolutely.
]
Note: The "By Ratio Test" at the start isn't necessary since we say it again in the conclusion, it just feels weird jumping straight into the ratio without motivation.

#example[
  Use the ration test to determine whether #auto-alt($display(sum_(n=1)^infinity ((n^2+1)3^n)/n!)$) converges or diverges.
]
#note-block[
  We see exponentials and exponents and factorials all over the place! No other tests are equipped to deal with all of these at once #auto-alt($arrow.double$) *Try Ratio Test!*
]
#my-solution-block[
  By Ratio Test,
  #auto-alt(
    $
      lim_(n arrow infinity) abs(a_(n+1) / a_n) & = lim_(n arrow infinity) abs((((n+1)^2+1)3^(n+1))/((n+1)!) dot (n!)/((n^2+1)3^n)) \
      & = lim_(n arrow infinity) (((n+1)^2+1)cancel(3^(n))3^1 cancel(n!))/((n+1)cancel(n!) (n^2+1)cancel(3^n)) \
      & = lim_(n arrow infinity) (3(n+1)^2 + 3)/((n+1)(n^2+1)) \
      & = lim_(n arrow infinity) (3n^2 + 6n + 6)/(n^3 + n^2 + n + 1) \
      & =^"L'H" lim_(n arrow infinity) (6n + 6 )/(3n^2 + 2n + 1) \
      & =^"L'H" lim_(n arrow infinity) (6 )/(6n + 2 ) \
      & = 0 < 1 checkmark
    $,
  )
  Therefore, #auto-alt($display(sum_(n=1)^infinity ((n^2+1)3^n)/n!)$) converges by the Ratio Test.
]

#remark-block[
  Notice that we need to be exponential experts and factorial fans! Brush up on your rules for both of these if needed!
]

#example[
  Try applying Ratio Test to determine the convergence of #auto-alt($display(sum_(n=1)^infinity 1/n)$) and #auto-alt($display(sum_(n=1)^infinity 1/n^2)$). What do you observe? Compare the results from Ration test to what we know about these series as #auto-alt($p$)-series.
]

#example[
  Use the ration test to determine whether #auto-alt($display(sum_(n=1)^infinity n!/n^n)$) is absolutely convergent, conditionally convergent, or divergent.
]
#note-block[
  We once again see exponentials and exponents and factorials all over the place! No other tests are equipped to deal with all of these at once #auto-alt($arrow.double$) *Try Ratio Test!*
]
#my-solution-block[
  By Ratio Test,
  #auto-alt(
    $
      lim_(n arrow infinity) abs(a_(n+1) / a_n) & = lim_(n arrow infinity) abs((n+1)!/((n+1)^(n+1)) dot n^n/n!) \
                                                & = lim_(n arrow infinity) ((n+1)n^n) / (n+1)^(n+1) \
                                                & = lim_(n arrow infinity) (n^n) / (n+1)^(n) \
                                                & = lim_(n arrow infinity) (n/(n+1))^n
    $,
  )
  This limit is a little tricky, but it has indeterminate form #auto-alt($1^oo$) so we need to use our exponential and log trick. Consider
  #auto-alt(
    $
      lim_(x arrow infinity) ln((x/(x+1))^x) & = lim_(x arrow oo) x ln(x/(x+1)) \
                                             & = lim_(x arrow infinity) ln(x/(x+1))/(1/x) " has IFL:" 0/0 \
                                             & =^"L'H" lim_(x arrow infinity) ((x+1)/x (x+1-x)/(x+1)^2)/(-1/x^2) \
                                             & = lim_(x arrow infinity) - x/(x+1) \
                                             & = -1
    $,
  )
  So
  #auto-alt(
    $
      lim_(x arrow infinity) (x/(x+1))^x = e^(lim_(x arrow infinity) ln((x/(x+1))^x)) = e^(-1)
    $,
  )
  So then
  #auto-alt(
    $
      lim_(n arrow infinity) abs(a_(n+1) / a_n) & = lim_(n arrow infinity) (n/(n+1))^n = 1/e < 1.
    $,
  )
  Therefore, #auto-alt($display(sum_(n=1)^infinity n!/n^n)$) is absolutely convergent by the Ratio Test.
]



#emph-block[
  11.6a Section Summary:
]

