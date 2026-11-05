// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.9b")
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
      == Representations of Functions as Power Series
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
      == Representations of Functions as Power Series
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
    ]
  }
}
// #counter(heading).step(level: 3)
// #counter(heading).step(level: 3)

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.9 Learning Objectives
  - Use the idea of geometric series to write functions as power series
  - Find the derivative and integral of power series
  - Use derivatives and integrals to find power series of more complex functions
]

#example[
  Find a power series representation for #auto-alt($ln(1+x)$). Find its radius of convergence.
]
#my-solution-block[
  We need to relate this to something like #auto-alt($1/(1-u)$) in some way. Observe that #auto-alt($dv(, x) (ln(1+x) ) = 1/(1+x) = 1/(1-(-x))$). So,
  #auto-alt(
    $
      ln(1+x) & = integral 1/(1+x) dif x \
              & = integral 1/(1-(-x)) dif x \
              & = integral(sum_(n=0)^oo (-x)^n) dif x \
              & = C + sum_(n=0)^oo ((-1)^n integral x^n dif x) \
              & = C + sum_(n=0)^oo ((-1)^n x^(n+1))/(n+1)
    $,
  )
  Now we have to find #auto-alt($C$), using a point we know. Let #auto-alt($x=0$), then #auto-alt($ln(1+0)=0$) and this should match the power series at #auto-alt($x=0$), so
  #auto-alt(
    $
      0 & = C+ sum_(n=0)^oo ((-1)^n 0^(n+1))/(n+1) \
        & = C + 0 \
    $,
  )
  So #auto-alt($C=0$).
  Thus,
  #auto-alt(
    $
      ln(1+x) = sum_(n=0)^oo ((-1)^n x^(n+1))/(n+1).
    $,
  )
  To find the radius of convergence, we can apply the ratio test
  #auto-alt(
    $
      L & = lim_(n arrow oo) abs((x^(n+2))/(n+2) dot (n+1)/x^(n+1)) \
        & = lim_(n arrow oo) abs(x) dot (n+1)/(n+2) \
        & = abs(x) dot 1
    $,
  )
  So ratio test guarantees convergence when #auto-alt($abs(x)<1$), #auto-alt($R=1$) then. We don't need to check endpoints since it only asks for the radius.
]

#example[
  Find a power series representation for #auto-alt($arctan(x)$). Find its radius of convergence.
]

#my-solution-block[
  Again, we have to figure out how to relate this function to something like #auto-alt($1/(1-u)$). We know #auto-alt($integral 1/(1+x^2) dif x = arctan(x)+C$), so
  #auto-alt(
    $
      arctan(x) & = integral 1/(1+x^2) dif x \
                & = integral 1/(1-(-x^2)) dif x \
                & = integral sum_(n=0)^oo (-x^2)^n dif x \
                & = integral sum_(n=0)^oo (-1)^n (x^(2n)) dif x \
                & = sum_(n=0)^oo (-1)^n integral x^(2n) dif x \
                & = C + sum_(n=0)^oo (-1)^n x^(2n+1)/(2n+1)
    $,
  )
  Now for finding #auto-alt($C$), we know #auto-alt($arctan(0)=0$), so
  #auto-alt(
    $
      0 & = C + sum_(n=0)^oo (-1)^n 0^(2n+1)/(2n+1) \
        & = C
    $,
  )
  so #auto-alt($C=0$).
  Then, a power series representation for #auto-alt($arctan(x)$) is #auto-alt($sum_(n=0)^oo (-1)^n x^(2n+1)/(2n+1)$).

  Again, we can use ratio test to find the radius of convergence
  #auto-alt(
    $
      L & = lim_(n arrow oo) abs(x^(2(n+1)+1)/(2(n+1)+1) dot (2n+1)/(x^(2n+1))) \
        & = lim_(n arrow oo) abs(x^(2n+3)/(2n+3) dot (2n+1)/(x^(2n+1))) \
        & = lim_(n arrow oo) abs(x^2) (2n+1)/(2n+3) \
        & = abs(x^2)
    $,
  )
  So the ratio test guarantees convergence when #auto-alt($L=abs(x) < 1$). Which is the same as #auto-alt($abs(x) < 1$) so #auto-alt($R=1$).
]

*Recall:* we have 2 methods of estimating error when approximating series using finite sums.
#theorem[Estimating Series' Error][
  For #auto-alt($R_n = |S-S_n|$) where #auto-alt($S$) is the series value and #auto-alt($S_n$) is the #auto-alt($n^"th"$) partial sum we have
  + If #auto-alt($a_n=f(n)$), where #auto-alt($f$) is a continuous, positive, eventually decreasing function and #auto-alt($sum a_n$) converges, then the remainder #auto-alt($R_n$) satisfies #auto-alt($ integral_(n+1)^oo f(x) dif x <= R_n <= integral_n^oo f(x) dif x. $)
  + If #auto-alt($a_n = (-1)^(n+1) b_n$), #auto-alt($b_n >= b_(n+1)$) for #auto-alt($n >= N$), and #auto-alt($lim_(n arrow oo) b_n = 0$), then #auto-alt($ R_n <= b_(n+1). $)
]

#example[
  Find a power series representation of #auto-alt($display(1/(1+x^5))$)
]
#my-solution-block[
  To find the power series representation we have to connect the function to something like #auto-alt($1/(1-u)$)...
  #auto-alt($1/(1+x^5) = 1/(1-(-x^5))$) so
  #auto-alt(
    $
      1/(1+x^5) & = 1/(1-(-x^5)) \
                & = sum_(n=0)^oo (-x^5)^n \
                & = sum_(n=0)^oo (-1)^n x^(5n)
    $,
  )
]

#example[
  Using your answer to the previous example, approximate #auto-alt($display(integral_0^0.3 1/(1+x^5) dif x)$) correct to within #auto-alt($10^(-5)$).
]
#my-solution-block[
  Since #auto-alt($1/(1+x^5) = sum_(n=0)^oo (-1)^n x^(5n)$), the integral
  #auto-alt(
    $
      integral 1/(1+x^5) dif x & = sum_(n=0)^oo (-1)^n integral x^(5n) dif x \
                               & = C + sum_(n=0)^oo (-1)^n (x^(5n+1))/(5n+1)
    $,
  )
  Since we are approximating a definite integral, #auto-alt($C$) does not matter, we can use #auto-alt($C=0$).
  #auto-alt(
    $
      integral_0^0.3 1/(1+x^5) dif x & = sum_(n=0)^oo (-1)^n (x^(5n+1))/(5n+1) |_(x=0)^0.3 \
                                     & = sum_(n=0)^oo (-1)^n ((0.3)^(5n+1))/(5n+1)
    $,
  )
  Notice that #auto-alt($sum_(n=0)^oo (-1)^n ((0.3)^(5n+1))/(5n+1)$) is an alternating series with #auto-alt($b_n = ((0.3)^(5n+1))/(5n+1) > 0$). (Exercise show that #auto-alt($b_n$) is decreasing and #auto-alt($lim_(n arrow oo) b_n = 0$)) Then, but the alternating series estimation theorem
  #auto-alt(
    $
      R_n < b_(n+1) < 10^(-5)
    $,
  )
  Observe that #auto-alt($ b_(n+1)=((0.3)^(5(n+1)+1))/(5(n+1)+1) approx (0.3^(5n+6))/(5n+6) $) and we can use a calculator or excel to find that #auto-alt($n=2$) is the first #auto-alt($n$) value to have #auto-alt($b_n+1 < 10^(-5)$).

  So we can approximate the series (and hence the integral) with only 2 terms to get within #auto-alt($10^(-5)$) of the correct answer!
  #auto-alt(
    $
      integral_0^0.3 1/(1+x^5) dif x approx sum_(n=0)^(2) (-1)^n ((0.3)^(5n+1))/(5n+1) = (3/10) - 1/6 (3/10)^6
    $,
  )
]



#emph-block[
  11.9b Section Summary:
  - We continued to use #auto-alt($sum_(n=0)^oo x^n = 1/(1-x)$) to write power series of other functions.
  - We discussed the error in approximating an integral using a series. (Note you won't be tested on error approximations, but they are actually the most important results you get from this class)
]

