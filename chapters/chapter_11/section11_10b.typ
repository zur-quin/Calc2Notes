#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.10b")
      #counter(heading).update(10)
      = Sequences and Series
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Taylor and Maclaurin Series
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
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Taylor and Maclaurin Series
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
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
    ]
  }
}
// any functions and templating you want for just this chapter can go here

#emph-block[
  11.10 Learning Objectives
  - Find the Taylor Series Expansion of a function
  - Find the Maclaurin Series Expansion of a function
  - Find the function represented by the Taylor or Maclaurin Series
  - Use known Maclaurin Series Expansion of functions to describe complicated functions
]

=== Maclaurin Series of Common Functions
You should be able to recognize (or re-derive) the following functions and their series. The first 3 are derived from 11.8 techniques (using geometric series and/or #auto-alt($1/(1-x) = sum_(n=0)^oo x^n$)). The others come from #auto-alt($c_n = (f^((n))(a))/(n!)$).
#table(
  columns: (1fr, 1fr, 2fr, 1fr),
  align: center + horizon,
  table.header([*Function*], [*Series*], [*First Few Terms*], [*Interval of Convergence*]),
  auto-alt($ 1/(1-x) $),
  auto-alt($ sum_(n=0)^oo x^n $),
  auto-alt($1 + x + x^2 + x^3 + x^4 + ...$),
  auto-alt($ (-1,1) $),

  auto-alt($ arctan(x) $),
  auto-alt($ sum_(n=0)^oo (-1)^n (x^(2n+1))/(2n+1) $),
  auto-alt($x - x^3/3 + x^5/5 - x^7/7 + ...$),
  auto-alt($ (-1,1] $),

  auto-alt($ ln(1+x) $),
  auto-alt($ sum_(n=0)^oo (-1)^n (x^(n+1))/(n+1) $),
  auto-alt($x - x^2/2 + x^3/3 - x^4/4 + ...$),
  auto-alt($ (-1,1) $),

  auto-alt($ e^x $),
  auto-alt($ sum_(n=0)^oo x^n/n! $),
  auto-alt($1 + x + x^2/2! + x^3/3! + x^4/4! + ...$),
  auto-alt($ (-oo,oo) $),
  // auto-alt($ b^x $), auto-alt($ sum_(n=0)^oo (b (ln(b))^n )/n! x^n $), auto-alt($(-oo,oo)$),
  auto-alt($ cos(x) $),
  auto-alt($ sum_(n=0)^oo ((-1)^n x^(2n))/((2n)!) $),
  auto-alt($1 - x^2/2! + x^4/4! - x^6/6! + ...$),
  auto-alt($ (-oo,oo) $),

  auto-alt($ sin(x) $),
  auto-alt($ sum_(n=0)^oo ((-1)^n x^(2n+1))/((2n+1)!) $),
  auto-alt($x - x^3/3! + x^5/5! - x^7/7! + ...$),
  auto-alt($ (-oo,oo) $),
)

#exercise[
  Derive the above Maclaurin series expansions and intervals of convergence for the above series. You will need ratio test for some of these.
]
#exercise[
  Some of the functions above are "odd" (#auto-alt($f(-x)=-f(x)$)) or "even" (#auto-alt($f(x)=f(-x)$)) functions. Which are odd and even. What do you notice about the powers on the Maclaurin series expansions of these functions?
]
#exercise[
  Sketch (by hand or desmos) a graph of #auto-alt($y=cos(x)$) and the second order Taylor Polynomial (centered at 0) of #auto-alt($cos(x)$) (#auto-alt($T_2(x) = 1-x^2$)) (Sum the series only until you have a degree 2 polynomial, then ignore the other terms) on the same graph. What do you observe?

  Sketch a graph of #auto-alt($y=sin(x)$) and the first order Taylor Polynomial (centered at 0) of #auto-alt($sin(x)$). What do you observe?

  How can your observations help you remember the Maclaurin series expansions for #auto-alt($sin(x)$) and #auto-alt($cos(x)$)?
]

#example[
  Use the Maclaurin series of #auto-alt($sin(x)$) to evaluate #auto-alt($display(integral (sin(x))/x dif x)$).
]
#note-block[
  Notice that we can't compute this integral manually using techniques from this class. Not even a double integration by parts step will let us evaluate this! Switching this to a series problem lets us actually compute the integral however!
]
#my-solution-block[
  Since #auto-alt($ sin(x) = sum_(n=0)^oo ((-1)^n x^(2n+1))/((2n+1)!) $) we have
  #auto-alt(
    $
      integral (sin(x))/x dif x & = integral 1/x sum_(n=0)^oo ((-1)^n x^(2n+1))/((2n+1)!) dif x \
                                & = integral sum_(n=0)^oo ((-1)^n x^(2n+1-1))/((2n+1)!) dif x \
                                & = sum_(n=0)^oo ((-1)^n integral x^(2n) dif x)/((2n+1)!) \
                                & = C + sum_(n=0)^oo ((-1)^n x^(2n+1))/((2n+1)(2n+1)!) \
    $,
  )
]

#example[
  Using the Maclaurin series of #auto-alt($sin(x)$), evaluate the following limit #auto-alt($ lim_(x arrow 0) (2 sin(x^2) - 2 x^2 + 1/3 x^6)/(x^(10)) $)
]
#warning-block[
  Since #auto-alt($x arrow 0$) instead of #auto-alt($x arrow oo$), we cannot look at the dominating terms for this limit. Turning to series lets us evaluate this limit!
]
#my-solution-block[
  Notice
  #auto-alt(
    $
      sin(x^2) & = sum_(n=0)^oo ((-1)^n (x^2)^(2n+1))/((2n+1)!) \
               & = sum_(n=0)^oo ((-1)^n x^(4n+2))/((2n+1)!) \
               & = x^2 - (x^6)/6 + (x^10)/120 + sum_(n=3)^oo ((-1)^n x^(4n+2))/((2n+1)!) \
    $,
  )
  so
  #auto-alt(
    $
      lim_(x arrow 0) (2 sin(x^2) - 2 x^2 + 1/3 x^6)/(x^(10)) & = lim_(x arrow 0) (2 (sum_(n=0)^oo ((-1)^n x^(4n+2))/((2n+1)!) ) - 2 x^2 + 1/3 x^6)/(x^(10)) \
      & = lim_(x arrow 0) (2 (x^2 - (x^6)/6 + (x^10)/120 + sum_(n=3)^oo ((-1)^n x^(4n+2))/((2n+1)!) ) - 2 x^2 + 1/3 x^6)/(x^(10)) \
      & = lim_(x arrow 0) (2x^2 - (x^6)/3 + (x^10)/60 + sum_(n=3)^oo ((-1)^n 2 x^(4n+2))/((2n+1)!) - 2 x^2 + 1/3 x^6)/(x^(10)) \
      & = lim_(x arrow 0) ((x^10)/60 + sum_(n=3)^oo ((-1)^n 2 x^(4n+2))/((2n+1)!) )/(x^(10)) \
      & = lim_(x arrow 0) (1)/60 + sum_(n=3)^oo ((-1)^n 2 x^(4n+2-10))/((2n+1)!) \
      & = 1/60
    $,
  )
]

#example[
  Find the sum of the series
  #auto-alt(
    $
      sum_(n=0)^oo ((-1)^n pi^(2n+1))/(3^(2n+1) (2n+1)!)
    $,
  )
]
#my-solution-block[
  This is not a geometric series, so our only other way to evaluate this series is to match it up with a series we know. Because #auto-alt($sin(x) = sum_(n=0)^oo ((-1)^n x^(2n+1))/((2n+1)!)$) we can see
  #auto-alt(
    $
      sum_(n=0)^oo ((-1)^n pi^(2n+1))/(3^(2n+1) (2n+1)!) & = sum_(n=0)^oo ((-1)^n (pi/3)^(2n+1))/((2n+1)!) \
                                                         & = sin(pi/3) \
                                                         & = sqrt(3)/2
    $,
  )
]

#emph-block[
  11.10a Section Summary:
  - We went over common Maclaurin series that you can identify. (Make flashcards for these series now and/or be able to re-derive them quickly.)
  - We used the Taylor series/Maclaurin series of functions to compute integrals and limits that we couldn't evaluate otherwise.
]

