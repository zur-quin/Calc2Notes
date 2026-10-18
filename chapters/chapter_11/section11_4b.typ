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
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Comparison Tests for Series
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
      #counter(heading).step(level: 2)
    ]
  }
}
#counter(heading).step(level: 3)
// #counter(heading).step(level: 3)


// any functions and templating you want for just this chapter can go here

#emph-block[
  11.4 Learning Objectives
  - Determine when it is appropriate to use a comparison test
  - Determine an appropriate series to compare a given series to
  - Know when and how to use direct comparison and limit comparison tests.
]

=== Limit Comparison Test
#theorem[The Limit Comparison Test][
  Suppose that #auto-alt($display(sum_(n=1)^infinity a_n)$) and #auto-alt($display(sum_(n=1)^infinity b_n)$) are series with positive terms. If
  #auto-alt(
    $
      lim_(n arrow infinity) a_n/b_n = c
    $,
  )
  where #auto-alt($c$) is a finite positive number (#auto-alt($c>0$)), then either both seris converge, or both series diverge.
]

#example[
  Does the series #auto-alt($display(sum_(n=1)^infinity 1/(2^n-1))$) converge or diverge?
]
#my-solution-block[
  Always checking the divergence test at the start, we can confirm the terms of the series go to zero, #auto-alt($lim_(n arrow infinity) 1/(2^n-1) = 0$) so the divergence test is inconclusive.

  Then, we can see that #auto-alt($1/(2^n-1)$) is fairly similar to #auto-alt($1/2^n$) which we know converges because #auto-alt($sum_(n=1)^infinity 1/(2^n)=sum_(n=1)^infinity (1/2)^n$) is a geometric series with #auto-alt($r=1/2<1$).

  Next, if we want to use direct comparison test to show convergence, then we would need
  #auto-alt(
    $
                    1/(2^n-1) & < 1/2^n \
      "in other words " 2^n-1 & > 2^n
    $,
  )
  which is false! So we *cannot* use direct comparison test.

  We can use limit comparison test, however: let #auto-alt($b_n=1/2^n$) and #auto-alt($a_n=1/(2^n-1)$) then
  #auto-alt(
    $
      lim_(n arrow infinity) a_n/b_n & = lim_(n arrow infinity) (1/(2^n-1))/(1/2^n) \
                                     & = lim_(n arrow infinity) 2^n/(2^n-1) \
                                     & = lim_(n arrow infinity) 1/(1-1/2^n) \
                                     & = 1/(1-0) \
                                     & = 1
    $,
  )
  since #auto-alt($1>0$), then *by the limit comparison test* the series #auto-alt($sum_(n=1)^infinity 1/(2^n-1)$) converges.
]

#example[
  Does the series #auto-alt($display(sum_(n=1)^infinity (2n^2 + 3n)/sqrt(5+n^5))$) converge or diverge?
]
#my-solution-block[
  We start by deciding which test to use:
  - divergence test is inconclusive since #auto-alt($lim_(n arrow infinity) (2n^2 + 3n)/sqrt(5+n^5) = 0$) (exercise: work out this limit to show this step and convince yourself)
  - this is not something like a telescoping series where the partial sums are easy to simplify and find the limit of, so we skip that idea
  - this is not a geometric series, like #auto-alt($sum_(n=1)^infinity a r^n$), so geometric series test does not apply
  - this is not a #auto-alt($p$)-series, like #auto-alt($sum_(n=1)^infinity 1/n^p$), so #auto-alt($p$)-series test does not apply
  - this is not something we really want to integrate, so we will avoid this test for now
  - this is a fairly complicated expression to have as the terms in the series, if we could "ignore" some of the terms and simplify it would actually be sort of like a #auto-alt($p$)-series... so let's compare this to something a little simpler.

  In order to figure out which series to compare this to, we want a series that grows at the same rate as the given series. Comparing the degrees of the numberator and denominator, we can compare this series to #auto-alt($sum_(n=1)^infinity n^2/sqrt(n^5) = sum_(n=1)^infinity 1/sqrt(n)$), which diverges by the #auto-alt($p$) series test, since #auto-alt($p=0/5<1$). We can either try using direct comparison test (we would have to show that #auto-alt($(2n^2+3n)/(sqrt(5+n^5)) gt.eq n^2/sqrt(n^5)$), which doesn't sound easy) or the limit comparison test.

  Using limit comparison test, let #auto-alt($a_n = (2n^2+3n)/(sqrt(5+n^5))$) and #auto-alt($b_n = n^2/sqrt(n^5)$). Note, #auto-alt($a_n$) and #auto-alt($b_n$) have positive terms since everything involved is addition and powers of #auto-alt($n$). Now that we checked the conditions for limit comparison test, let's compute the limit
  #auto-alt(
    $
      lim_(n arrow infinity) a_n/b_n & = lim_(n arrow infinity) ((2n^2+3n)/(sqrt(5+n^5)))/(n^2/sqrt(n^5)) \
                                     & = lim_(n arrow infinity) (2n^2+3n)/(sqrt(5+n^5)) (sqrt(n^5)/n^2) \
                                     & = lim_(n arrow infinity) (2n^2+3n)/(sqrt(5+n^5)) ((1/n^2)/(1/sqrt(n^5))) \
                                     & = lim_(n arrow infinity) (2+3/n)/(sqrt(5/n^5+1)) \
                                     & = (2+lim_(n arrow infinity) 3/n)/(sqrt(lim_(n arrow infinity) 5/n^5+1)) \
                                     & = (2)/(sqrt(1)) \
                                     & = 2
    $,
  )
  Since #auto-alt($2>0$), then we know the series #auto-alt($sum_(n=1)^infinity a_n$) and #auto-alt($sum_(n=1)^infinity b_n$) either both diverge or both converge. Since #auto-alt($sum_(n=1)^infinity b_n$) diverges with #auto-alt($p$)-series test, then #auto-alt($sum_(n=1)^infinity a_n$) also diverges by the limit comparison test.
]

#remark-block[
  This is maybe a lot to write, and some of it is explanations of things that might just be happening in your head. A minimally complete solution is reproduced below, anything less than this is probably losing points to something.
]
#my-solution-block[
  _the student starts by deciding to use limt comparison test, and begins the solution there._

  Let #auto-alt($a_n = (2n^2+3n)/(sqrt(5+n^5))$) and #auto-alt($b_n = n^2/sqrt(n^5)$). Note, #auto-alt($a_n$) and #auto-alt($b_n$) have positive terms since everything involved is addition and powers of #auto-alt($n$). Then,
  #auto-alt(
    $
      lim_(n arrow infinity) a_n/b_n & = lim_(n arrow infinity) ((2n^2+3n)/(sqrt(5+n^5)))/(n^2/sqrt(n^5)) \
                                     & = lim_(n arrow infinity) (2n^2+3n)/(sqrt(5+n^5)) (sqrt(n^5)/n^2) \
                                     & = lim_(n arrow infinity) (2n^2+3n)/(sqrt(5+n^5)) ((1/n^2)/(1/sqrt(n^5))) \
                                     & = lim_(n arrow infinity) (2+3/n)/(sqrt(5/n^5+1)) \
                                     & = (2+lim_(n arrow infinity) 3/n)/(sqrt(lim_(n arrow infinity) 5/n^5+1)) \
                                     & = 2
    $,
  )
  Since #auto-alt($2>0$), then we know the series #auto-alt($sum_(n=1)^infinity a_n$) and #auto-alt($sum_(n=1)^infinity b_n$) either both diverge or both converge. Since #auto-alt($sum_(n=1)^infinity b_n = sum_(n=1)^infinity n^2/sqrt(n^5) = sum_(n=1)^infinity 1/n^(1/2)$) diverges with #auto-alt($p$)-series test (#auto-alt($p=1/2<1$)), then #auto-alt($sum_(n=1)^infinity a_n$) also diverges by the limit comparison test.
]
#remark-block[
  Notice the solution above
  - defines #auto-alt($a_n$) and #auto-alt($b_n$) for their write up at the start
  - checks the requirements for limit comparison test (that the terms in both series are positive) with justification
  - shows full work for the limit required
  - explains why the series #auto-alt($sum_(n=1)^infinity b_n$) diverges
  - writes the conclusion about #auto-alt($sum_(n=1)^infinity a_n$) diverging as well with the words "by limit comparison test" and they have used complete sentences.

  Every one of these points is needed for a complete solution.
]

#example[
  Does the series #auto-alt($display(sum_(n=1)^infinity (1+3/n^2)^4 (1/3^n))$) converge or diverge?
]
#my-solution-block[
  We go through the available tests as we have done before, and settle on limit comparison for the following reasons.

  This series is a bit more complex, but thinking about the terms as #auto-alt($n$) gets large, the #auto-alt($(1+3/n^2)^4$) part goes to just #auto-alt($1^4=1$). The rest is like a geometric series. This indicates we should compare to a geometric series, and because it is more complex we maybe don't want to have to check if #auto-alt($a_n>b_n$) to use direct comparison test, so we will us limit comparison test.

  Then, let #auto-alt($a_n=(1+3/n^2)^4 (1/3^n)$) and #auto-alt($b_n = 1/3^n$). Then,
  #auto-alt(
    $
      lim_(n arrow infinity) a_n/b_n & = lim_(n arrow infinity) ((1+3/n^2)^4 (1/3^n))/(1/3^n) \
                                     & = lim_(n arrow infinity) (1+3/n^2)^4 \
                                     & = 1>0
    $,
  )
  Since #auto-alt($sum_(n=1)^infinity 1/3^n = sum_(n=1)^infinity (1/3)^n$) is a geometric series with #auto-alt($r = 1/3 < 1$), it converges. So by the limit comparison test, #auto-alt($display(sum_(n=1)^infinity (1+3/n^2)^4 (1/3^n))$) converges as well.
]

*When is the Limit Comparison Test Not Applicable?*

The Limit Comparison Test works really well when there is a series that is known to converge or diverge that has the "same" rate of growth as #auto-alt($n arrow oo$).

This makes it particularly useful for algebraic functions as the underlying sequence. For example both
#auto-alt(
  $
    sum_(n=1)^oo (root(3, n^3-2n))/(n^4+n^3) "  or  " sum_(n=1)^oo (3n+1)/(n^2+2)
  $,
)
are both good series to try limit comparison test on.

However, some series we cannot easily compare with a series we know converges or diverges. For example,
#auto-alt(
  $
    sum_(n=1)^oo 1/(n ln(n))
  $,
)
If we tried to use limit comparison test to compare this to #auto-alt($sum_(n=1)^oo 1/n$), it would be inconclusive!
#auto-alt(
  $
    lim_(n arrow oo) (1/(n ln(n)))/(1/n) = lim_(n arrow oo) 1/(n ln(n)) dot n = lim_(n arrow oo) 1/(ln(n)) = 0
  $,
)
and since the limit is 0, the limit comparison test is inconclusive.



#emph-block[
  11.4b Section Summary:
  - We can now use limit comparison test and can tell when limit comparison test is inconclusive.
]

