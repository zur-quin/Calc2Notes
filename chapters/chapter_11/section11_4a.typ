#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.4")
      #counter(heading).update(10)
      = Sequences and Series
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Comparison Tests for Series
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
      == Comparison Tests for Series
    ]
  } else {
    // main html
    [
      #counter(heading).update(11)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Comparison Tests for Series
    ]
  }
}

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.4 Learning Objectives
  - Determine when it is appropriate to use a comparison test
  - Determine an appropriate series to compare a given series to
  - Know when and how to use direct comparison and limit comparison tests.
]

=== Direct Comparison Test

#example[
  Determine whether the series #auto-alt($display(sum_(n=1)^infinity 1/(n-1))$) converges or diverges.
]

This series is extremely similar to #auto-alt($display(sum_(n=2)^infinity 1/n)$), which we know diverges. In fact, thinking about graph transformations, #auto-alt($1/(x-1)$) is just #auto-alt($1/x$) shifted one space to the right.

Because #auto-alt($display(sum_(n=2)^infinity 1/n)$) diverges, we expect that #auto-alt($display(sum_(n=1)^infinity 1/(n-1))$) also diverges, since the only difference is the #auto-alt($-1$) in the denominator... let's look at a picture

todo: plots

We can observe that #auto-alt($1/x < 1/(x-1)$) for all #auto-alt($x>0$), so for all #auto-alt($n gt.eq 1$) we have
#auto-alt(
  $
                       1/n & < 1/(n-1) \
    sum_(n=2)^infinity 1/n & lt.eq sum_(n=2)^infinity 1/(n-1) \
                  infinity & lt.eq sum_(n=2)^infinity 1/(n-1)
  $,
)
so #auto-alt($sum_(n=2)^infinity 1/(n-1)$) diverges since #auto-alt($sum_(n=2)^infinity 1/n$) diverges.

#theorem[The Direct Comparison Test (Comparison Test)][
  Suppose that #auto-alt($display(sum_(n=1)^infinity a_n)$) and #auto-alt($display(sum_(n=1)^infinity b_n)$) are series with positive terms.

  #set enum(spacing: 2em, numbering: "(i)")
  + If #auto-alt($display(sum_(n=1)^infinity b_n)$) is convergent and #auto-alt($a_n lt.eq b_n$) for all #auto-alt($n gt.eq N$), then #auto-alt($display(sum_(n=1)^infinity a_n)$) converges.
  + If #auto-alt($display(sum_(n=1)^infinity b_n)$) is divergent and #auto-alt($a_n gt.eq b_n$) for all #auto-alt($n gt.eq N$), then #auto-alt($display(sum_(n=1)^infinity a_n)$) diverges.
]

#note-block[
  In this theorem, we have a series #auto-alt($display(sum_(n=1)^infinity a_n)$) with positive terms that we wish to talk about the convergence or divergence of. We make an educated guess on if it converges or diverges, and find another series #auto-alt($display(sum_(n=1)^infinity b_n)$) with positive terms either above or below the original, and hope that other series is easier to analyze the convergence of.
]
#note-block[
  The #auto-alt($n gt.eq N$) part of all these series convergence tests can be read as "eventually the series behaves this way..."

  In the above theorem, it only matters that _eventually_ we have #auto-alt($a_n lt.eq b_n$) (or #auto-alt($a_n gt.eq b_n$)). The first few terms before #auto-alt($N$) can only contribute a finite amount to the series, and don't end up mattering in the long run of the sum.
]

todo: plots

#example[
  Does the series #auto-alt($display(sum_(n=1)^infinity (2^n)/(n+6^n))$) converge or diverge?
]
#my-solution-block[
  Let #auto-alt($a_n = 2^n/(n+6^n)$).
  Doing a quick check of the divergence test (exercise: check the divergence test is inconclusive yourself, you will need h'Hosptial's rule and to review exponent rules and exponential derivatives!) we see that #auto-alt($lim_(n arrow infinity) a_n = 0$), so the series does not obviously diverge. Then we have to use another one of the tests.

  Now we see that this series is very similar to #auto-alt($display(sum_(n=1)^infinity (2^n)/(6^n))$) except it differes by the #auto-alt($+n$) in the denominator. Importantly, #auto-alt($ display(sum_(n=1)^infinity (2^n)/(6^n) = sum_(n=1)^infinity (1/3)^n) $) converges by the Geometric Series test, since #auto-alt($r=1/3<1$).

  Now, we have to check the rest of the conditions of the comparison test: all the terms need to be positive and for #auto-alt($n gt.eq 1$) we have that both #auto-alt($2^n/(n+6^n)$) and #auto-alt($2^n/6^n$) are positive.

  Lastly we need to show that the series we are comparing to has terms, #auto-alt($b_n gt.eq a_n$), where #auto-alt($a_n$) are the terms in the original. Notice that if we want
  #auto-alt(
    $
                                    2^n/(n+6^n) & < 2^n/6^n \
            "then we must also have " 1/(n+6^n) & < 1/6^n \
      "in which case we also would have " n+6^n & > 6^n \
                      "which is the case if " n & > 0.
    $,
  )
  Fortunately this is true, we have #auto-alt($n gt.eq 1 > 0$) for all terms in this series (#auto-alt($N=0$)).

  So, *by the comparison test* the series #auto-alt($sum_(n=1)^infinity 2^n/(n+6^n)$) converges.
]

#note-block[
  - We don't have to check the divergence test is inconclusive for all of these, but if the divergence test works and shows something is divergent, it is a really quick and easy solution. Essentially, we don't want to miss any easy ways out in this process so it is good to at least think about before continuing on with the problem.
  - A complete solution to determining a series converges or diverges has the following "rubric":
    - Did the problem solver identify the right test to use?
    - Did the problem solver check all the hypotheses for the test, showing enough detail for each?
    - Did the problem solver write a conclusion about the convergence of the series including a citation stating which test they used?

  - Note these problems need more writing than a lot of other math up to this point, you should have a few _complete_ sentences in a solution.
]

#example[
  Does the series #auto-alt($display(sum_(n=1)^infinity (cos^2(n))/(1+n^5))$) converge or diverge?
]
#my-solution-block[
  With a quick limit, the divergence test is inconclusive:
  #auto-alt(
    $
      lim_(n arrow infinity) (cos^2(n))/(1+n^5) " behaves like a finite number divided by a very large number so " = 0
    $,
  )

  Now we notice that this series is similar to #auto-alt($sum_(n=1)^infinity 1/n^5$), which converges by the #auto-alt($p$)-series test. We just have to relate the original series to this one
  #auto-alt(
    $
      a_n = (cos^2(n))/(1+n^5) lt.eq 1/(1+n^5) < 1/n^5 = b_n
    $,
  )
  (in the first step above, the denominator got bigger going from #auto-alt($cos^2(n)$) to 1, then in the second step the denominator got smaller which made the entire fraction larger)

  Lastly, for direct comparison test to work, the terms in both series must be positive. Notice that #auto-alt($1/n^5$) is positive for #auto-alt($n gt.eq 1$) and #auto-alt($cos^2(n) gt.eq 0$) since it is a number between #auto-alt($-1$) and 1 that is squared.

  Then, by the direct comparison test, #auto-alt($display(sum_(n=1)^infinity (cos^2(n))/(1+n^5))$) also converges.
]

#warning-block[
  Can we apply the Direct Comparison Test to the series #auto-alt($display(sum_(n=2)^infinity 1/(n^2-1))$)?

  This series is similar to #auto-alt($display(sum_(n=2)^infinity 1/n^2)$), which converges by the #auto-alt($p$)-series test, so we would expect the original series to converge. However, since
  #auto-alt(
    $
                     n^2-1 & < n^2 " for " n gt.eq 2 \
      "we have " 1/(n^2-1) & > 1/n^2
    $,
  )
  and so our convergent series we want to compare to is below the original! So, the direct comparison test does not work.

  We will build up a tool to use on these types of series in the next part of 11.4.
]


#emph-block[
  11.4a Section Summary:
  - We identified when to use direct comparison test and how to find a series to compare to.
  - We applied direct comparison test.
]

