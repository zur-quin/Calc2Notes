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
  Suppose that $display(sum_(n=1)^infinity a_n)$ and $display(sum_(n=1)^infinity b_n)$ are series with positive terms. If
  $
    lim_(n arrow infinity) a_n/b_n = c
  $
  where $c$ is a finite positive number ($c>0$), then either both seris converge, or both series diverge.
]

#example[
  Does the series $display(sum_(n=1)^infinity 1/(2^n-1))$ converge or diverge?
]
#my-solution-block[
  Always checking the divergence test at the start, we can confirm the terms of the series go to zero, $lim_(n arrow infinity) 1/(2^n-1) = 0$ so the divergence test is inconclusive.

  Then, we can see that $1/(2^n-1)$ is fairly similar to $1/2^n$ which we know converges because $sum_(n=1)^infinity 1/(2^n)=sum_(n=1)^infinity (1/2)^n$ is a geometric series with $r=1/2<1$.

  Next, if we want to use direct comparison test to show convergence, then we would need
  $
                  1/(2^n-1) & < 1/2^n \
    "in other words " 2^n-1 & > 2^n
  $
  which is false! So we *cannot* use direct comparison test.

  We can use limit comparison test, however: let $b_n=1/2^n$ and $a_n=1/(2^n-1)$ then
  $
    lim_(n arrow infinity) a_n/b_n & = lim_(n arrow infinity) (1/(2^n-1))/(1/2^n) \
                                   & = lim_(n arrow infinity) 2^n/(2^n-1) \
                                   & = lim_(n arrow infinity) 1/(1-1/2^n) \
                                   & = 1/(1-0) \
                                   & = 1
  $
  since 1 is constant, then *by the limit comparison test* the series $sum_(n=1)^infinity 1/(2^n-1)$ converges.
]

#emph-block[
  11.4b Section Summary:

]

