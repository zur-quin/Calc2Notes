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
  Find a power series representation for $ln(1+x)$. Find its radius of convergence.
]
#my-solution-block[
  We need to relate this to spmething like $1/(1-u)$ in some way. Observe that $dv(, x) (ln(1+x) ) = 1/(1+x) = 1/(1-(-x))$. So,
  $
    ln(1+x) & = integral 1/(1+x) dif x \
            & = integral 1/(1-(-x)) dif x \
            & = integral(sum_(n=0)^oo (-x)^n) dif x \
            & = C + sum_(n=0)^oo ((-1)^n integral x^n dif x) \
            & = C + sum_(n=0)^oo ((-1)^n x^(n+1))/(n+1)
  $
  Now we have to find $C$, using a point we know. Let $x=0$, then $ln(1+0)=0$ and this should match the power series at $x=0$, so
  $
    0 & = C+ sum_(n=0)^oo ((-1)^n 0^(n+1))/(n+1) \
      & = C + 0 \
  $
  So $C=0$.
  Thus,
  $
    ln(1+x) = sum_(n=0)^oo ((-1)^n x^(n+1))/(n+1).
  $
  To find the radius of convergence, we can apply the ratio test
  $
    L & = lim_(n arrow oo) abs((x^(n+2))/(n+2) dot (n+1)/x^(n+1)) \
      & = lim_(n arrow oo) abs(x) dot (n+1)/(n+2) \
      & = abs(x) dot 1
  $
  So ratio test guarantees convergence when $abs(x)<1$, $R=1$ then. We don't need to check endpoints since it only asks for the radius.
]

#example[
  Find a power series representation for $arctan(x)$. Find its radius of convergence.
]

#my-solution-block[
  Again, we have to figure out how to relate this function to something like $1/(1-u)$. We know $integral 1/(1+x^2) dif x = arctan(x)+C$, so
  $
    arctan(x) & = integral 1/(1+x^2) dif x \
              & = integral 1/(1-(-x^2)) dif x \
              & = integral sum_(n=0)^oo (-x^2)^n dif x \
              & = integral sum_(n=0)^oo (-1)^n (x^(2n)) dif x \
              & = sum_(n=0)^oo (-1)^n integral x^(2n) dif x \
              & = C + sum_(n=0)^oo (-1)^n x^(2n+1)/(2n+1)
  $
  Now for finding $C$, we know $arctan(0)=0$, so
  $
    0 & = C + sum_(n=0)^oo (-1)^n 0^(2n+1)/(2n+1) \
      & = C
  $
  so $C=0$.
  Then, a power series representation for $arctan(x)$ is $sum_(n=0)^oo (-1)^n x^(2n+1)/(2n+1)$.

  Again, we can use ratio test to find the radius of convergence
  $
    L & = lim_(n arrow oo) abs(x^(2(n+1)+1)/(2(n+1)+1) dot (2n+1)/(x^(2n+1))) \
      & = lim_(n arrow oo) abs(x^(2n+3)/(2n+3) dot (2n+1)/(x^(2n+1))) \
      & = lim_(n arrow oo) abs(x^2) (2n+1)/(2n+3) \
      & = abs(x^2)
  $
  So the ratio test guarantees convergence when $L=abs(x) < 1$. Which is the same as $abs(x) < 1$ so $R=1$.
]

*Recall:* we have 2 methods of estimating error when approximating series using finite sums.
#theorem[Estimating Series' Error][
  For $R_n = |S-S_n|$ where $S$ is the series value and $S_n$ is the $n^"th"$ partial sum we have
  + If $a_n=f(n)$, where $f$ is a continuous, positive, eventually decreasing function and $sum a_n$ converges, then the remainder $R_n$ satsfies $ integral_(n+1)^oo f(x) dif x <= R_n <= integral_n^oo f(x) dif x. $
  + If $a_n = (-1)^(n+1) b_n$, $b_n >= b_(n+1)$ for $n >= N$, and $lim_(n arrow oo) b_n = 0$, then $ R_n <= b_(n+1). $
]

#example[
  Find a power series representation of $display(1/(1+x^5))$
]
#my-solution-block[
  To find the power series represenation we have to connect the function to something like $1/(1-u)$...
  $1/(1+x^5) = 1/(1-(-x^5))$ so
  $
    1/(1+x^5) & = 1/(1-(-x^5)) \
              & = sum_(n=0)^oo (-x^5)^n \
              & = sum_(n=0)^oo (-1)^n x^(5n)
  $
]

#example[
  Using your answer to the previous example, approximate $display(integral_0^0.3 1/(1+x^5) dif x)$ correct to within $10^(-5)$.
]
#my-solution-block[
  Since $1/(1+x^5) = sum_(n=0)^oo (-1)^n x^(5n)$, the integral
  $
    integral 1/(1+x^5) dif x & = sum_(n=0)^oo (-1)^n integral x^(5n) dif x \
                             & = C + sum_(n=0)^oo (-1)^n (x^(5n+1))/(5n+1)
  $
  Since we are approximating a definite integral, $C$ does not matter, we can use $C=0$.
  $
    integral_0^0.3 1/(1+x^5) dif x & = sum_(n=0)^oo (-1)^n (x^(5n+1))/(5n+1) |_(x=0)^0.3 \
                                   & = sum_(n=0)^oo (-1)^n ((0.3)^(5n+1))/(5n+1)
  $
  Notice that $sum_(n=0)^oo (-1)^n ((0.3)^(5n+1))/(5n+1)$ is an alternating series with $b_n = ((0.3)^(5n+1))/(5n+1) > 0$. (Exercise show that $b_n$ is decreasing and $lim_(n arrow oo) b_n = 0$) Then, but the alternating series estimation theorem
  $
    R_n < b_(n=1) < 10^(-5)
  $
]



#emph-block[
  11.9b Section Summary:

]

