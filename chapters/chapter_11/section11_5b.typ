// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.5b")
      #counter(heading).update(10)
      = Sequences and Series
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Alternating Series and Absolute Convergence
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
      == Alternating Series and Absolute Convergence
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
    ]
  }
}
#counter(heading).step(level: 3)
// #counter(heading).step(level: 3)

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.5 Learning Objectives
  - Identify alternating series
  - Determine if alternating series converge or diverge by the alternating series test
  - Estimate the remainder for alternating series
  - Distinguish between absolute and conditional convergence
]

Previously, we saw examples of series that were divergent when all of the terms of the sequence were positive, but the series became convergent when the terms had alternating signs.

=== Absolute Convergence
#definition[
  A series #auto-alt($sum_(n=1)^oo a_n$) is called *absolutely convergent* if the series of absolute values, #auto-alt($sum_(n=1)^oo abs(a_n)$) is convergent.

  A series #auto-alt($sum_(n=1)^oo a_n$) is called *conditionally convergent* if the series is _convergent_ but not _absolutely convergent_. (In other words, the series relies on the condition that some of its terms are negative to converge)
]

#theorem[
  If a series is absolutely convergent, then it is convergent.
]
#exercise[
  Prove this theorem. Hint: Use squeeze theorem.
]

#example[
  Determine whether the following series are absolutely convergent, conditionally convergent, or divergent.
  #auto-alt(
    $
      sum_(n=1)^oo ((-1)^n)/n
    $,
  )
]
#my-solution-block[
  The alternating harmonic series converges since #auto-alt($b_n=1/n$) goes to 0 by the alternating series test. However, the Harmonic series diverges because it is a #auto-alt($p$)-series with #auto-alt($p=1$). So, this series is conditionally convergent.
]

#example[
  Determine whether the following series are absolutely convergent, conditionally convergent, or divergent.
  #auto-alt(
    $
      sum_(n=1)^oo (cos(n))/(n^3+2)
    $,
  )
]
#my-solution-block[
  #auto-alt(
    $
      abs(a_n) & = abs((cos(n))/(n^3+2)) <= 1/(n^3+2)<1/(n^3)
    $,
  )
  Since #auto-alt($sum_(n=1)^oo 1/(n^3)$) is a #auto-alt($p$)-series with #auto-alt($p=3>1$), it converges. So, #auto-alt($ sum_(n=1)^oo abs((cos(n))/(n^3+2)) $) converges by direct comparison test. So #auto-alt($ sum_(n=1)^oo (cos(n))/(n^3+2) $) is absolutely convergent.
]

#example[
  Determine whether the following series are absolutely convergent, conditionally convergent, or divergent.
  #auto-alt(
    $
      sum_(n=1)^oo (-1)^(n+1) (3^n )/(2^n + 5^n)
    $,
  )
]
#warning-block[
  #auto-alt(
    $
      (3^n )/(2^n + 5^n) != (3^n )/(2^n) + (3^n )/(5^n)
    $,
  )
  This is not how fractions work!
]
#my-solution-block[
  For #auto-alt($n >=1$),
  #auto-alt(
    $
              2^n + 5^n & > 5^n \
          1/(2^n + 5^n) & < 1/5^n \
      (3^n)/(2^n + 5^n) & < (3^n)/5^n = (3/5)^n \
    $,
  )
  and #auto-alt($sum_(n=1)^oo (3/5)^n$) is a geometric series with #auto-alt($r=3/5<1$), it converges. So by the direct comparison test, #auto-alt($ sum_(n=1)^oo abs((-1)^(n+1) (3^n )/(2^n + 5^n)) = sum_(n=1)^oo (3^n)/(2^n + 5^n) $) converges. So #auto-alt($ sum_(n=1)^oo (-1)^(n+1) (3^n )/(2^n + 5^n) $) is absolutely convergent.
]

=== Alternating Series Estimation
Again, we think about approximating the series by taking a partial sum #auto-alt($s_n$) for some "large enough" value of #auto-alt($n$). If we do this for an alternating series, what can we say about the error in our estimation technique?

#theorem[Alternating Series Estimation Theorem][If #auto-alt($s=sum_(n=1)^oo (-1)^(n+1) b_n$) is the sum of an alternating series that satisfies:
  #set enum(numbering: "(i)")
  + #auto-alt($b_(n+1)<= b_n$) for all #auto-alt($n$)
  + #auto-alt($lim_(n arrow oo) b_n = 0$)
  then #auto-alt($ abs(R_n) = abs(s-s_n) <= b_(n+1) $)
]

Why does this work?

If
#auto-alt(
  $
    s & = b_1 - b_2 + b_3 - b_4 + ...
        s_n & = b_1 - b_2 + b_3 +...plus.minus b_n
  $,
)
Then
#auto-alt(
  $
    abs(R_n) = abs(s-s_n) = abs(minus.plus b_(n+1) plus.minus b_(n+2) minus.plus b_(n+3) plus.minus ...)
  $,
)
Suppose it starts with #auto-alt($+b_(n+1)$) (but it works with #auto-alt($-$) also), then we can use a similar argument to why the alternating series test works.

#figure(image("figures/AlternatingSeriesRemainder.svg", alt: "todo"))

The infinite sum for #auto-alt($abs(s-s_n)$) will have to be less than or equal to #auto-alt($b_(n+1)$) since we are subtracting and adding smaller and smaller terms.

#example[
  Consider the alternating series
  #auto-alt(
    $
      sum_(n=1)^oo (-1)^(n+1) 1/(2^(n-1))
    $,
  )
  Estimate the alternating series with a partial sum, #auto-alt($s_n$), so that the absolute value of the error is less than #auto-alt($1/50$).
]

#my-solution-block[
  We want to find the #auto-alt($n$) value where #auto-alt($abs(R_n)<1/50$). So, we need to find a term of the series where #auto-alt($abs(R_n) = abs(s-s_n) <= b_(n+1) < 1/50$). Then,
  #auto-alt(
    $
            b_(n+1) & < 1/50 \
      1/(2^(n+1-1)) & < 1/50 \
          1/(2^(n)) & < 1/50 \
                 50 & < 2^n
    $,
  )
  When #auto-alt($n=5$), #auto-alt($2^n=2^5=32 !> 50$) and when #auto-alt($n=6$), #auto-alt($2^n=2^6=64>50$). So we need to use #auto-alt($s_6$) to estiamte our series.

  #auto-alt($ s_6 = 1/1 - 1/2 + 1/4 - 1/8 + 1/16 - 1/32 = 0.65625 $)
  and we know the error we get using #auto-alt($0.65625$) as the value for the series #auto-alt($sum_(n=1)^oo (-1)^(n+1) 1/(2^(n-1))$) is no more than #auto-alt($1/64=0.015625$).
]

#emph-block[
  11.5b Section Summary:
  - We looked at different series and whether they are absolutely convergent, conditionally convergent, or divergent.
  - We also discussed the error for using partial sums to approximate the value of alternating series.

]

