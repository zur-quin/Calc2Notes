#import "./../../template_notes.typ": *
#import "@preview/exm:0.1.0": *

#show: template

#set page(
  paper: "us-letter",
  header: align(right)[Name:#blank(150pt, "")],
  // footer: rect(fill: aqua)[Footer],
  number-align: center,
)

#set document(title: "Series tests for convergence")
#title()
Determine if the following series converge or diverge. If applicable, determine if the series are absolutely convergent, conditionally convergent, or divergent (this is applicable if you have some #auto-alt($a_n<0$). If possible, determine what the series converges to.)

*_Some hints and brief methods for you to check your work. These are not complete solutions._*
#columns(2, gutter: 8pt)[
  + #question(ansheight: 150pt)[#auto-alt($display(sum_(m=1)^oo 1/m^2)$)][This series converges by #auto-alt($p$)-test.]

  + #question(ansheight: 150pt)[#auto-alt(
      $display(sum_(n=1)^oo 1/2^n)$,
    )][This is a geometric series, and it converges to 1.]

  + #question(ansheight: 150pt)[#auto-alt(
      $display(sum_(q=1)^oo (-3)^q)$,
    )][Series diverges because of either divergence test, ratio test, geometric series test, or root test.]

  + #question(ansheight: 150pt)[#auto-alt(
      $display(sum_(n=1)^oo ln(n/(3n+1)))$,
    )][Series diverges because of divergence test.]

  + #question(ansheight: 150pt)[#auto-alt(
      $display(sum_(k=1)^oo (k^(2k))/((1+2k^2)^k))$,
    )][By root test, the series is absolutely convergent.]

  + #question(ansheight: 150pt)[#auto-alt(
      $display(sum_(m=1)^oo (m^3)/(5^m))$,
    )][By ratio test, the series is absolutely convergent.]

  + #question(ansheight: 140pt)[#auto-alt(
      $display(sum_(j=1)^oo (-1)^j 1/(j+2))$,
    )][Using alternating series test and a comparison test, we can show this series is conditionally convergent.]

  + #question(ansheight: 140pt)[#auto-alt(
      $display(sum_(n=1)^oo (-1)^(n-1) sqrt(n)/(n+1))$,
    )][Using alternating series test and a comparison test, we can show this series is conditionally convergent.]

  + #question(ansheight: 140pt)[#auto-alt(
      $display(sum_(r=1)^oo (-1)^(r+1))$,
    )][This series diverges by divergence test or geometric series test.]

  + #question(ansheight: 60pt)[#auto-alt(
      $display(sum_(b=1)^oo b/(b^3+5))$,
    )][This series converges, can show with a comparison test (Direct works on this one, you might try that for practice, but limit should also work)]

  + #question(ansheight: 140pt)[#auto-alt(
      $display(sum_(k=1)^oo (k^3 - k + 1)/(root(3, k^9+k^5)))$,
    )][Using limit comparison test, this series diverges. You may find divergence test useful here too.]

  + #question(ansheight: 140pt)[#auto-alt(
      $display(sum_(j=1)^oo (cos(3j))/(1+1.2)^j)$,
    )][This series is absolutely convergent. We can compare #auto-alt($display(sum_(j=1)^oo abs(cos(3j))/(1+1.2)^j)$) to #auto-alt($display(sum_(j=1)^oo 1/(1+1.2)^j)$) to discuss its convergence.]

  + #question(ansheight: 140pt)[#auto-alt(
      $display(sum_(n=2)^oo 1/(n(ln(n))^2))$,
    )][By integral comparison test, this series converges.]

  + #question(ansheight: 60pt)[#auto-alt(
      $display(sum_(k=1)^oo ((-1)^k (k+1)3^k)/((k+2)!))$,
    )][By ratio test, this series is absolutely convergent.]

]
