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
      == Alternating Series and Absolute Convergence
    ]
  }
}

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.5 Learning Objectives
  - Identify alternating series
  - Determine if alternating series converge or diverge by the alternating series test
  - Estimate the reaminder for alternating series
  - Distinguish between absolute and conditional convergence
]

The convergence tests we have looked at so far only apply to series with _positive terms_. In this section, we will focus on _alternating series_.

#definition[
  A series $display(sum_(n=1)^oo a_n)$ is an alternating series if the series terms have the form
  $
    a_n = (-1)^n b_n " or " a_n=(-1)^(n-1) b_n " for " b_n >= 0.
  $
]

#example[
  Is the following series and alternating series or not?
  $
    sum_(n=1)^oo ((-1)^(n-1) (n+1) )/(n+2)
  $
]
#my-solution-block[
  Yes, this series is alternating because $b_n=(n+1)/(n+2) >=0$ for all $n >=1$, and the $(-1)^(n-1)$ in front make the terms alternate between positive and negative.
]

#example[
  Is the following series and alternating series or not?
  $
    sum_(n=1)^oo (cos(pi n))/(sqrt(n))
  $
]
#my-solution-block[
  Yes, for integers $n$, we can rewrite $cos(pi n)=(-1)^n$ and $1/sqrt(n) >=0$ for $n>=1$.
]



#example[
  Is the following series and alternating series or not?
  $
    sum_(n=1)^oo (cos(2 pi n))/(n^2)
  $
]
#my-solution-block[
  No, because for integer $n$, $cos(2 pi n) = 1$ and so this series is the same as $sum_(n=1)^oo (1)/(n^2)$ and $1/n^2 >=0$.
]

#example[
  Is the following series and alternating series or not?
  $
    sum_(n=1)^oo (-1)^n cos(n)
  $
]
#my-solution-block[
  No, while there is the $(-1)^n$ part, $b_n=cos(n) gt.eq.not 0$, in other words $cos(n)$ is positive or negative for different values of $n gt.eq 1$ and we need $b_n gt.eq 0$.
]

#theorem[Alternating Series Test][
  If an alternating series, $display(sum_(n=1)^oo a_n)$ of the form
  $
    sum_(n=1)^oo (-1)^(n-1) b_n " or " sum_(n=1)^oo (-1)^(n) b_n,
  $
  where $b_n >= 0$ satisfies:
  #set enum(numbering: "(i)", spacing: 2em)
  + $b_(n+1)<= b_n$ for all $n >= N$ ($N$ is some number, this requirement is that ""$b_n$ is decreasing eventually")
  + $display(lim_(n arrow infinity) b_n = 0)$

  then the series $display(sum_(n=1)^oo a_n)$ is convergent.
]

#warning-block[
  A common mistake students make at this point is to look at _any_ series and say that the terms are decreasing to 0 so the series converges, however we know from the divergence test (section 11.2b) that this does not guarantee the series converges. This is only the case in the very special *alternating* series test.
]

The reasoning for why the alternating series test works is because the terms are decreasing in absolute value but alternating sign, we can always verify that the sequence of partial sums converges.

todo: picture

#example[
  Prove that the *alternating harmonic series*
  $
    sum_(n=1)^oo (-1)^n/n
  $
  converges.
]
#my-solution-block[
  Notice that $b_n=1/n$ is decreasing since
  $
    n+1 > n " for " n gt.eq 1 \
    1/(n+1) < 1/n \
    b_(n+1) < b_n
  $
  Also notice that
  $
    lim_(n arrow infinity) b_n = lim_(n arrow infinity) 1/n = 0.
  $
  Therefore, by the alternating series test,
  $
    sum_(n=1)^oo (-1)^n/n
  $
  converges.
]

Recall that the (regular) harmonic series $display(sum_(n=1)^oo 1/n)$ diverges, but the alternating series converges. This shows that alternating series are more likely to converge.

#example[
  Determine whether
  $
    sum_(n=2)^oo ((-1)^(n+1)ln(n))/n
  $
  is convergent or divergent.
]

#my-solution-block[
  This is an alternating series with $b_n = (ln(n))/n$. First, notice that $ lim_(n arrow oo) b_n = lim_(n arrow oo) ln(n)/n =^"LH" lim_(n arrow oo) (1/n)/1 = 0. $ Then, we need to show that
  $
    (ln(n))/n
  $
  is decreasing eventually. It is difficult to argue clearly why $(ln(n))/n > (ln(n+1))/(n+1)$, but we can use something else in calculus to show when something is decreasing...derivatives!

  Let $y= (ln(x))/x$. Then, by quotient rule,
  $
    y' & = (x dot 1/x - ln(x))/(x^2) \
       & = (1-ln(x))/x^2
  $
  To find the critical points, we set $y'=0$ and find where $y'$ does not exist. Then, these points are
  $x=e,0$. On #openint("e", "infinity") $y'$ is negative, so after $x=e$, $y$ is decreasing. Going back to integers, for $n gt.eq 3$, $(ln(n))/n$ is decreasing ($N=3$). Therefore, by the alternating series test, the series
  $
    sum_(n=2)^oo ((-1)^(n+1)ln(n))/n
  $
  converges.
]

#example[
  Determine whether the series
  $
    sum_(n=1)^oo ((-1)^n n)/(n+1)
  $
  is convergent or divergent.
]
#my-solution-block[
  Observe that the alternating series test cannot be applied here since $n/(n+1)$ is _increasing_ for $n gt.eq 1$, not decreasing. We can see this by noticing
  $
    dv(, x) (x/(x+1)) & = (x+1-x)/((x+1)^2) = 1/(x+1)^2 >0
  $
  for all $x$.

  However, this is a good time to remember we should be checking the divergence test at the start of these problems, notice
  $
    lim_(n arrow oo) ((-1)^n n)/(n+1)
  $
  does not exist (the odd $n$ terms go to -1 and the even $n$ terms go to 1). So, the series
  $
    sum_(n=1)^oo ((-1)^n n)/(n+1)
  $
  diverges by the divergence test.
]

#emph-block[
  11.4a Section Summary:
  - We looked at identifying alternating series and applying the alternating series test.
]

