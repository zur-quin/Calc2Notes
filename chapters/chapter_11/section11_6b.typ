// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.6b")
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
      #counter(heading).step(level: 2)
    ]
  }
}
#counter(heading).step(level: 3)
// #counter(heading).step(level: 3)

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.6 Learning Objectives
  - Know when and how to use the Ratio Test
  - Know when and how to use the Root Test
  - Understand why the ratio test is inconclusive when the ratio is 1
  - Understand why the root test is inconclusive when the root is 1
]

#example[
  Try to use ratio test to determine the convergence of the series
  #auto-alt(
    $
      sum_(n=1)^infinity ((2n+1)/(3n+1))^n
    $,
  )
]
#my-solution-block[
  #auto-alt(
    $
      lim_(n arrow infinity) abs(((2(n+1)+1)/(3(n+1)+1))^(n+1)/((2n+1)/(3n+1))^n)
    $,
  )
  This looks awful. Let's try something else...
]

=== Root Test
#theorem[The Root Test][
  #set enum(numbering: "(i)", spacing: 2em)
  + If #auto-alt($display(lim_(n arrow infinity) root(n, abs(a_n))=L<1)$), then the series #auto-alt($display(sum_(n=1)^infinity a_n)$) is *absolutely convergent* (and therefore convergent).
  + If #auto-alt($display(lim_(n arrow infinity) root(n, abs(a_n))=L>1)$), then the series #auto-alt($display(sum_(n=1)^infinity a_n)$) is *divergent*.
  + If #auto-alt($display(lim_(n arrow infinity) root(n, abs(a_n))=L=1)$), the Root Test is *inconclusive*. i.e. #auto-alt($display(sum_(n=1)^infinity a_n)$) may absolutely converge, conditionally converge, or diverge. We need a different test to figure out which.
]

The idea behind this convergence test is that if #auto-alt($root(n, abs(a_n))$) converges to #auto-alt($L$), and #auto-alt($L<1$), then we have #auto-alt($sum_(n=1)^infinity L^n$) is a convergent geometric series because #auto-alt($abs(L)<1$). Essentially, #auto-alt($sum_(n=1)^infinity a_n$) grows at about the same rate as #auto-alt($sum_(n=1)^infinity$). The Root Test just lets us look at more complicated exponentially-based series by only considering the bas of the exponential expression.

#note-block[
  The Ratio Test is inconclusive if and only if the Root Test is inconclusive. If one of these tests is inconclusive, it will never be worth your time to try to other. Choose a different test.
]

#example[
  Use the Root Test to determine whether the following series is convergent.
  #auto-alt(
    $
      sum_(n=1)^infinity ((4n+1)/(5n+2))^n
    $,
  )
]
#my-solution-block[
  By root test,
  #auto-alt(
    $
      lim_(n arrow infinity) root(n, ((4n+1)/(5n+2))^n) & = lim_(n arrow infinity) (4n+1)/(5n+2) \
                                                        & = 4/5 < 1
    $,
  )
  Therefore, this series converges by the Root Test.
]
#example[
  Use the Root Test to determine whether the following series is convergent.
  #auto-alt(
    $
      sum_(n=1)^infinity (arctan(n))^n
    $,
  )
]
#note-block[
  Before when we saw a number to the power #auto-alt($n$) we might try to use the geometric series test, or compare to a geometric series. Now, if we have a complicated expression to the power #auto-alt($n$), we will try root test.
]
#my-solution-block[
  Notice #auto-alt($arctan(n)>0$) for all #auto-alt($n >=1$). Then, by root test,
  #auto-alt(
    $
      lim_(n arrow infinity) root(n, abs((arctan(n))^n)) & = lim_(n arrow infinity) arctan(n) \
                                                         & = pi/2 > 1
    $,
  )
  Therfore, this series diverges by the Root Test.
]

#warning-block[
  Just like the Ratio Test, the Root Test is a powerful convergence test, but it is not always effective.
]
#example[
  Determine whether #auto-alt($display(sum_(n=1)^infinity (n^2+4n)/(n^2-2n+6))$) converges or diverges.
]
#my-solution-block[
  Trying root test: (observe #auto-alt($(n^2+4n)/(n^2-2n+6) > 0$) when #auto-alt($n >=2$))
  #auto-alt(
    $
      lim_(n arrow infinity) root(n, abs(((n^2+4n)/(n^2-2n+6))^(3n))) & = lim_(n arrow infinity) root(n, (((n^2+4n)/(n^2-2n+6))^(3))^n)\
      & = lim_(n arrow infinity) ((n^2+4n)/(n^2-2n+6))^(3)\
      & = lim_(n arrow infinity) (n^6)/(n^6) ((1+4/n)/(1-2/n+6/n^2))^3 \
      & = 1
    $,
  )
  Thus, the root test is inconclusive.

  However, we can use the divergence test here (we start in IFL #auto-alt($1^infinity$))
  #auto-alt(
    $
      lim_(n arrow infinity) ((n^2+4n)/(n^2-2n+6))^(3n) & = exp(ln(lim_(n arrow infinity) ((n^2+4n)/(n^2-2n+6))^(3n))) \
      & = exp(lim_(n arrow infinity) ln(((n^2+4n)/(n^2-2n+6))^(3n))) \
      & = exp(lim_(n arrow infinity) (3n)ln((n^2+4n)/(n^2-2n+6))) \
      & = exp(lim_(n arrow infinity) (ln((n^2+4n)/(n^2-2n+6))/(1/(3n)))) " has IFL "0/0 \
      & = "doing a l'Hosptial's rule step and some algebra we get" \
      & = e^1 = e
    $,
  )
  So by the divergence test, the series #auto-alt($display(sum_(n=1)^infinity (n^2+4n)/(n^2-2n+6))$) diverges.
]

Why might we prefer to use the Ratio Test or Root Test over some of the other tests that we have learned?

What are some clues that we should or should not use these tests?
- If a series has the entire sequence to the power of #auto-alt($n$), then the Root Test may be helpful, especially if it is not a standard geometric series or quickly comparable to a geometric series.
- If a series has factorials, or a combination of various things (e.g. factorials, exponentials, algebraic terms), then the Ratio Test is the best option (and sometimes the only option!)
- Bother the Root Test adn Ratio Test will be inconclusive for purely algebraic series, like #auto-alt($sum_(n=1)^infinity (n+n^5)/sqrt(n^2+2)$). Instead always use a comparison test (limit or direct) for these types of series.

#emph-block[
  11.6b Section Summary:
  - We went over the root test and when to use it. We discussed when we might want to use the ratio test also.
]

