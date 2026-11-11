#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.11a")
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
      #counter(heading).step(level: 2)
      == Applications of Taylor Polynomials
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
      #counter(heading).step(level: 2)
      == Applications of Taylor Polynomials
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
      == Applications of Taylor Polynomials
    ]
  }
}

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.11 Learning Objectives
  - Understand how to use Taylor Polynomials to estimate functions, limits, and more.
  - Understand Taylor's inequality to discuss the error when approximating functions with Taylor Series.
]

=== Approximating Functions with Taylor Polynomials
The practically applicable part of this section is approximating the series with $n^"th"$ partial sums, or Taylor Polynomials.
#theorem[
  The *truncated Taylor series* is a Taylor polynomial of degree $n$, $T_n$. The $n^"th"$ degree Taylor plynomial centered at $x=a$ is given by
  $
    T_n (x) & = sum_(k =0)^n (f^((k)) (a))/k! (x-a)^k \
            & = f(a) + f'(a) (x-a) + (f''(a))/2! (x-a)^2 + (f'''(a))/3! (x-a)^3 + ... + (f^((n)) (a))/n! (x-a)^n
  $
  The remainder, $R_n (x)$, of this Taylor series is defined by
  $
    R_n (x) = f(x) - T_n (x)
  $
  If $f(x) = T_n (x) + R_n (x)$ and
  $
    lim_(n arrow oo) R_n (x) = 0
  $
  for $|x-a|<R$, then $f$ is equal to the sum of its Taylor series on the interval $|x-a|<R$.

]
In section 11.10 we were assuming that $lim_(n arrow oo) R_n (x) =0$.

Long story short, functions don't have to match their Taylor series representations. Most the functions we will see, will match their Taylor series representation, but we need to be aware that this is not always the case. For example, the following function does not match its Taylor series.

#exercise[
  Consider the function
  $
    f(x) = cases(
      e^(-1/x) "if" x > 0,
      0 "if" x lt.eq 0
    )
  $
  $f$ has continuous derivatives of any order at every real value of $x$. The derivatives are given by
  $
    f^((n)) (x) = cases((p_n (x))/x^(2n) f(x) " if " x > 0, 0 " if " x lt.eq 0)
  $
  where the $p_n$ is a polynomial of degree $n-1$ that is not relevant to this problem. You can assume that the derivatives are continuous at $x=0$, and if you want to go through this in office hours that is fine with me.

  However, the Taylor series approximation of $f$ does not equal $f$. To see this, find the Taylor series expansion for $f$ centered at $x=0$, and graph $f(x)$. Are they the same? (The Taylor series expansion should be _very_ easy to graph, if it isn't, you probably made a mistake.)
]


#warning-block[
  Talking about functions that don't match their Taylor series expansions starts to get into some very interesting but very complicated math. Don't stress too much if this is weird. We have to get some particularly strange functions to make them not match their Taylor series expansion. If you are a math major, this starts to get into some very fun topics.

  And remember, you won't be tested on 11.11 material, but this is the coolest/most important topic in calculus. It might be worth understanding what makes this all so cool.

  Here's a more practical example.
]


#example[
  Historically, there have been many ways to calculate digits of $pi$. Since the $14^"th"$ century, the most prominent method has been utilizing power series. In the $14^"th"$ century, an Indian mathematician named Madhava correctly approximated $pi$ to 11 decimal places. Use the Taylor series representation for $f(x)=arctan(x)$ to approximate $pi$ to 11 decimal places. How many terms of the series are needed to get this accurate of an approximation? (How would you like to do this calculation without a calculator to 11 digits of accuracy?)
]

#my-solution-block[
  We have shown that $arctan(x) = sum_(n=0)^oo (-1)^n (x^(2n+1))/(2n+1)$ for $x " in " (-1,1]$. This means, since $arctan(sqrt(3)/3) = pi/6$ and $sqrt(3)/3 approx 0.57 " is in " (-1,1]$ that
  $
    pi & = 6 arctan(sqrt(3)/3) \
       & = 6 sum_(n=0)^oo (-1)^n ((sqrt(3)/3)^(2n+1))/(2n+1) \
       & = (6 sqrt(3))/3 sum_(n=0)^oo (-1)^n ((1/sqrt(3))^(2n))/(2n+1) \
       & = (2 sqrt(3)) sum_(n=0)^oo (-1)^n/(3^n (2n+1)) \
  $
  This is an alternating series, so using the alternating series estimation theorem, to get 11 digits correct we want
  $
    b_(n+1) = (2 sqrt(3))/(3^(n+1) (2n+3)) & < 1/(10^11) \
                         2 sqrt(3) (10^11) & < 3^(n+1) (2n+3).
  $
  Checking a few values of $n$ we can (eventually) see that $n=20$ this is true. Starting at $n=0$ we need to add 21 terms to approximate $pi$ to 11 decimal places. Specifically we need to do $ 2 sqrt(3) sum_(n=0)^20 ((-1)^n)/(3^n (2n+1)) approx 3.14159265359 $
  to get 11 correct digits.
]
#note-block[
  If you were to use $arctan(1)=pi/4=sum_(n=0)^oo ((-1)^n)/(2n+1)$ instead, it would take about 200 trillion terms to get this level of accuracy. This highlights the importance of having $x$ being close to the center of the Taylor series.
]
This is just using the alternating series estimation theorem, but can we be more specific for Taylor series what the error will be?

#theorem[Taylor's Inequality][
  If $display(f^((n+1)) (x) lt.eq M)$ for $abs(x-a)<d$, then the remainder $R_n (x)$ of the Taylor series satisfies the inequality $ R_n (x) lt.eq M/(n+1)! abs(x-a)^(n+1) $
]
#note-block[
  - The expression for the remainder is related to the next term in the Taylor series expansion! This is a very cool result.
  - The error depends on a bound for the derivatives of $f$ near $x=a$
  - The error also depends on how close $x$ is to $a$, the closer $x$ is to $a$, the lower the error.
]

#example[
  Prove $ sin(x) = sum_(n=0)^oo (-1)^n (x^(2n+1))/(2n+1)! $ for all $x$ in $(-oo,oo)$.
]
#my-solution-block[
  We need to show that $lim_(n arrow oo) R_n (x) = 0$, where $R_n (x) lt.eq M/(n+1)! abs(x-a)^(n+1)$.
  The function is $f(x) = sin(x)$, $a=0$, and
  $
       f(0) & =sin(0)=0 \
      f'(0) & = cos(0) = 1 \
     f''(0) & = -sin(0) = 0 \
    f'''(0) & = -cos(0) = -1 \
        ...
  $
  So $-1 lt.eq f^((n)) (0) lt.eq 1=M$
  We know $f$ is equal to its Taylor seris on the interval $|x-a|<R$ if $R_n (x) arrow 0$. Then, by squeeze theorem (for limits)
  $
    0 lt.eq R_n (x) lt.eq M/(n+1)! |x-a|^(n+1)
  $
  and $lim_(n arrow oo) 0 = 0$ and for $|x-a|<d$,
  $
    lim_(n arrow oo) M/(n+1)! |x-a|^(n+1) = lim_(n arrow oo)
  $
]

#emph-block[
  11.11a Section Summary:
]

