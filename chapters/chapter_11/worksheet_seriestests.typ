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
#columns(2, gutter: 8pt)[
  + #question(ansheight: 154pt)[#auto-alt($display(sum_(m=1)^oo 1/m^2)$)][]

  + #question(ansheight: 154pt)[#auto-alt($display(sum_(n=1)^oo 1/2^n)$)][]

  + #question(ansheight: 154pt)[#auto-alt($display(sum_(q=1)^oo (-3)^q)$)][]

  + #question(ansheight: 154pt)[#auto-alt($display(sum_(n=1)^oo ln(n/(3n+1)))$)][]

  + #question(ansheight: 154pt)[#auto-alt($display(sum_(k=1)^oo (k^(2k))/((1+2k^2)^k))$)][]

  + #question(ansheight: 154pt)[#auto-alt($display(sum_(m=1)^oo (m^3)/(5^m))$)][]

  + #question(ansheight: 140pt)[#auto-alt($display(sum_(j=1)^oo (-1)^j 1/(j+2))$)][]

  + #question(ansheight: 140pt)[#auto-alt($display(sum_(n=1)^oo (-1)^(n-1) sqrt(n)/(n+1))$)][]

  + #question(ansheight: 140pt)[#auto-alt($display(sum_(r=1)^oo (-1)^(r+1))$)][]

  + #question(ansheight: 60pt)[#auto-alt($display(sum_(b=1)^oo b/(b^3+5))$)][]

  + #question(ansheight: 140pt)[#auto-alt($display(sum_(k=1)^oo (k^3 - k + 1)/(root(3, k^9+k^5)))$)][]

  + #question(ansheight: 140pt)[#auto-alt($display(sum_(j=1)^oo (cos(3j))/(1+1.2)^j)$)][]

  + #question(ansheight: 140pt)[#auto-alt($display(sum_(n=2)^oo 1/(n(ln(n))^2))$)][]

  + #question(ansheight: 60pt)[#auto-alt($display(sum_(k=1)^oo ((-1)^k (k+1)3^k)/((k+2)!))$)][]

]
