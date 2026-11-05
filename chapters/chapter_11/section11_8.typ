#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.8")
      #counter(heading).update(10)
      = Sequences and Series
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Power Series
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
      == Power Series
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
      == Power Series
    ]
  }
}
// any functions and templating you want for just this chapter can go here

#emph-block[
  11.8 Learning Objectives
  - Identify power series
  - Use previous techniques to determine whether the series converges or diverges
  - Understand how the center and coefficients affect the convergence of power series
  - Identify the radius of convergence for series that converge on an interval
]

=== Motivation
Do the following series converge or diverge? How do you know?
#set enum(spacing: 2em)
+ #auto-alt($display(sum_(n=0)^oo (2/3)^n)$) \
  converges because it is geometric with #auto-alt($a=1$) and #auto-alt($abs(r)=2/3<1$)
+ #auto-alt($display(sum_(n=0)^oo (-4)^n)$) \
  diverges because it is geometric with #auto-alt($a=1$) and #auto-alt($abs(r)=4>1$)
+ #auto-alt($display(sum_(n=0)^oo 44(1/100)^n)$) \
  converges because it is geometric with #auto-alt($a=44$) and #auto-alt($abs(r)=1/100 <1$)

Observe that #auto-alt($r$) is changing in these scenarios, so we can represent these with a variable #auto-alt($x$)...
=== Power Series

#definition[Power Series][
  A *power series* is a series of the form: #auto-alt($ sum_(n=0)^oo c_n x^n $) where #auto-alt($x$) is a variable, and #auto-alt($c_n$) are constants called the *coefficients* of the series.

  We can also write power series as #auto-alt($display(sum_(n=0)^oo c_n (x-a)^n)$) where #auto-alt($a$) is a constant we call the center. \
]

#note-block[
  - Notice #auto-alt($a$) does not have a dependency on #auto-alt($n$), so it is the same for every term in the series.
  - Here #auto-alt($c_n$) depends on which term in the series, #auto-alt($n$) we are currently adding, so #auto-alt($c_0$) may be different from #auto-alt($c_1$) etc.
  - You could write this as #auto-alt($ sum_(n=1)^oo c_n x^(n-1) $) if you like, but we won't. We will just start these at 0.
  - Power series is named because the terms are all some number times a power of #auto-alt($x$).
]

- Examples of power series
  - #auto-alt($display(sum_(n=1)^oo (x^n )/n = x + x^2/2 + x^3/3 + x^4/4+...)$) is a power series where the first coefficient #auto-alt($c_0=0$), the center #auto-alt($a=0$), and #auto-alt($c_n=1/n$) for #auto-alt($n >=1$).
  - #auto-alt($display(sum_(n=0)^oo 3(x-1)^n = 3 + 3(x-1) + 3(x-1)^2 + ...)$) is a power series where #auto-alt($c_n=3$) for all #auto-alt($n>=0$) and center #auto-alt($a=1$). (The sum started at 0 this time, like we expected, so we did not have to write the first coefficient was 0 like the last example)
  - #auto-alt($display(sum_(n=0)^oo (n+1)!x^n = 1 + 2x + 6 x^2 + 24 x^3 + ...)$) is a power series where #auto-alt($c_n=(n+1)!$) and center #auto-alt($a=0$).

- What affects the convergence or divergence of this series?
  - The value of #auto-alt($x$) and the values of the sequence #sequence(letter: auto-alt($c$)) impacts the convergence or divergence. #auto-alt($x$) is just a number, but if #auto-alt($c_n$) depends on #auto-alt($n$) and is not just a number, then the series cannot be considered like geometric.

- If #auto-alt($x=0$), does the series #auto-alt($sum_(n=0)^oo c_n x^n$) converge?
  - If #auto-alt($x=0$), we have #auto-alt($sum_(n=0)^oo c_n x^n = c_0+c_1dot 0 + 0 + 0 + 0 + 0 + ... = c_0$) so the series always converges when #auto-alt($x=0$).

- Similarly, if we have the series #auto-alt($sum_(n=0)^oo c_n (x-a)^n$), it always converges for #auto-alt($x=a$). This is why #auto-alt($a$) is called the center of the series.

#definition[Power Series as a Function][
  A power series is like a function #auto-alt($ f(x) = sum_(n=0)^oo c_n (x-a)^n $) whose domain is all values of #auto-alt($x$) where the series converges.
]
#note-block[
  For #auto-alt($ f(x) = sum_(n=0)^oo c_n (x-a)^n, $)	#auto-alt($x=a$) is always in the domain of #auto-alt($f(x)$).
]

#example[
  Find the values of #auto-alt($x$) for which the series #auto-alt($display(sum_(n=0)^oo (-1)^n x^n)$) converges.
]
One effective way to find the values of #auto-alt($x$) where a power series converges is with the Ratio Test. This will be a common approach when determining when (what values of #auto-alt($x$)) power series converge.
#my-solution-block[
  By ratio test, if we want the series to converge we would have
  #auto-alt(
    $
      L=lim_(n arrow oo) abs(((-1)^(n+1) x^(n+1))/((-1)^n x^n)) = lim_(n arrow oo) abs(x) = abs(x)
    $,
  )
  Ratio test says that when #auto-alt($L<1$) we have convergence, #auto-alt($L>1$) divergence, and it is inconclusive when #auto-alt($L=1$). So we can start to build up when this series converges. When #auto-alt($L=abs(x)>1$) it diverges, when #auto-alt($L=abs(x) <1$) it converges, and when #auto-alt($L=abs(x)=1$) we have to use a different test.

  #auto-alt($abs(x)=1$) means #auto-alt($x=-1,1$). So, checking when #auto-alt($x=1$) the series is equivalent to #auto-alt($sum_(n=0)^oo (-1)^n$) which diverges by the Divergence Test since #auto-alt($lim_(n arrow oo) (-1)^n$) diverges.

  Checking when #auto-alt($x=-1$), the series is equivalent to #auto-alt($ sum_(n=0)^oo (-1)^n (-1)^n = sum_(n=0)^oo (-1)^(2n) = sum_(n=0)^oo 1^n = sum_(n=0)^oo 1 $) by exponent rules. Also by the divergence test, #auto-alt($lim_(n arrow oo) 1 = 1 != 0$), so the series diverges when #auto-alt($x=-1$).

  Therefore, the power series converges exactly when #auto-alt($x$) is in #auto-alt($(-1,1)$).
]
In this example, #auto-alt($(-1,1)$) is called the *interval of convergence* of the power series.

#definition[Radius of Convergence and Interval of Convergence][
  For a given power series #auto-alt($display(sum_(n=0)^oo c_n (x-a)^n)$) _exactly one_ of the following statements is true:
  + The series only converges when #auto-alt($x=a$). Then #auto-alt($R=0$) is the radius of convergence. The interval of convergence is just the single point #auto-alt($x=a$).
  + The series converges for all real numbers #auto-alt($x$). Then #auto-alt($R=oo$) is the radius of convergence and #auto-alt($(-oo,oo)$) is the interval of convergence.
  + There is a positive real number #auto-alt($R$) where the series converges for #auto-alt($-R+a<x<a+R$) and diverges for #auto-alt($x>a+R$) and #auto-alt($x < a-R$).

  In all cases, the constant #auto-alt($R$) is called the *radius of convergence* for the series #auto-alt($display(sum_(n=0)^oo c_n (x-a)^n)$), and the *interval of convergence* for the series is the interval consisting of all values of #auto-alt($x$) for which the series converges.

  In case 3, when #auto-alt($R>0$) is finite, a power series could converge or diverge at either endpoint of the interval of convergence. So the interval of convergence for the series is one of the following:
  #auto-alt(
    $
      (a-R, a+R),[a-R, a+R),(a-R, a+R], " or" [a-R, a+R]
    $,
  )
]

#figure(image(
  "figures/radiusofconvergence.svg",
  alt: "a shaded number line showing that the power series converges within R units of the center a, and diverges outside this region. It also points out that the series may converge or diverge at the boundaries, a plus R and a minus R",
))

#example[
  Determine the radius of convergence and the interval of convergence for the series #auto-alt($ sum_(n=0)^oo (2x-3)^n/(n!) $)
]
#my-solution-block[
  We will start with the ratio test,
  #auto-alt(
    $
      L=lim_(n arrow oo) abs(((2x-3)^(n+1))/((n+1)!) dot (n!)/((2x-3)^n)) = lim_(n arrow oo) abs(2x-3)/(n+1)
    $,
  )
  For any value of #auto-alt($x$), the limit as #auto-alt($n arrow oo$) makes this limit #auto-alt($L=0$). Therefore, this series converges for all #auto-alt($x$). So, the radius of convergence is #auto-alt($r=oo$) and the interval of convergence is #auto-alt($(-oo,oo)$).
]
#note-block[
  Say in the above example, that the radius was not #auto-alt($R=oo$), but #auto-alt($R=5$). We would then need to find the center of the power series in order to determine the interval of convergence. Because of the #auto-alt($(2x-3)$) it is a little trickier, but we set this equal to 0 and solve for #auto-alt($a$):
  #auto-alt(
    $
      2a-3=0 arrow.double 2a=3 arrow.double a=3/2
    $,
  )
  The center would be #auto-alt($3/2$), and the interval would start as #auto-alt($(3/2-5,3/2+5)$). Then we would have to test each end point separately.

  We will see this process in the next example.
]

#example[
  Determine the radius of convergence and the interval of convergence for the series #auto-alt($ f(x)=sum_(n=0)^oo (x-1)^n/(5^n (n+1)) $)
]
#my-solution-block[
  We will once again start with the ratio test,
  #auto-alt(
    $
      L & = lim_(n arrow oo) abs((x-1)^(n+1)/(5^(n+1) ((n+1)+1)) dot (5^n (n+1))/(x-1)^n) \
        & = lim_(n arrow oo) abs(x-1)(n+1)/(5 (n+2)) \
        & = 1/5 abs(x-1)
    $,
  )
  This converges when #auto-alt($L<1$), or when
  #auto-alt(
    $
               1/5 abs(x-1) & < 1 \
      arrow.double abs(x-1) & < 5
    $,
  )
  Thus, the radius of convergence is #auto-alt($R=5$). Since this power series is centered at #auto-alt($x=1$), then the end points of the interval are #auto-alt($x=-4, " and "x=6$). We need to check these values separately.

  When #auto-alt($x=-4$), the series is
  #auto-alt(
    $
      f(-4)=sum_(n=0)^oo (-4-1)^n/(5^n (n+1)) & = sum_(n=0)^oo ((-1)^n (5)^n)/(5^n (n+1)) \
                                              & = sum_(n=0)^oo ((-1)^n)/((n+1))
    $,
  )
  Because this is an alternating series, we can apply the alternating series test. Notice #auto-alt($1/(n+1)$) is decreasing and #auto-alt($lim_(n arrow oo) 1/(n+1)=0$), so by the alternating series test, #auto-alt($sum_(n=0)^oo ((-1)^n)/((n+1))$) converges, so #auto-alt($-4$) is in the domain of #auto-alt($f$).

  When #auto-alt($x=6$), the series is
  #auto-alt(
    $
      f(6) = sum_(n=0)^oo (6-1)^n/(5^n (n+1)) & = sum_(n=0)^oo ((5)^n)/(5^n (n+1)) \
                                              & = sum_(n=0)^oo (1)/((n+1))
    $,
  )
  Let #auto-alt($b_n = 1/n$) and #auto-alt($a_n = 1/(n+1)$), both have positive terms for #auto-alt($n >1$), then
  #auto-alt(
    $
      lim_(n arrow oo) b_n/a_n & = lim_(n arrow oo) (1/n)/(1/(n+1)) \
                               & = lim_(n arrow oo) (n+1)/n = 1 > 0 checkmark
    $,
  )
  By limit comparison test, since #auto-alt($sum a_n$) diverges (harmonic series), so too does #auto-alt($sum 1/(n+1)$). Then, #auto-alt($x=6$) is not in the domain of #auto-alt($f$).

  Finally, putting everything together, the interval of convergence is #auto-alt($[-4,6)$).
]

#note-block[
  The general process for doing this is
  #set enum(spacing: auto)
  + Apply a series convergence test to find when the power series converges, almost always ratio test.
  + Get the inequality down to #auto-alt($abs(x-a)<R$), potentially dividing by any constant in front of #auto-alt($x$) to do so. Then this is the radius of convergence #auto-alt($R$).
  + Find left and right endpoints #auto-alt($a-R", and "a+R$).
  + Plug in the left and right endpoints separately, and use other series convergence tests to figure out if the resulting series converges or diverges.
  + Write the interval of convergence, including the endpoint if the respective series converged or excluding it if it diverged.

]

#emph-block[
  11.8 Section Summary:
  - We defined what a power series was.
  - We used ratio test and other series convergence tests to determine the interval of convergence (#auto-alt($x$) values when the series converges) and radius of convergence.
]

