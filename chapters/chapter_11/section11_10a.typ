#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.10a")
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
      == Taylor and Maclaurin Series
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
=== Motivation: Linearization of a function
Recall the linearization of a function
#definition[Linearization of a function][
  For a (continuous near #auto-alt($a$)) function #auto-alt($f$), the linearization of #auto-alt($f$) centered at #auto-alt($a$) is the tangent line to the function at the point #auto-alt($(a,f(a))$). Precisely, in _point slope_ form (#auto-alt($y=m(x-x_1)+y_1$))
  #auto-alt(
    $
      L(x) = f'(a)(x-a) + f(a)
    $,
  )
  #figure(image(
    "figures/Linearization.svg",
    alt: "graph of a generic function and its linearization. The graph highlights that they match at x equals a in value and derivative.",
  ))
]
- The idea behind linearization is to come up with a simple function (a line #auto-alt($L$)) that matches #auto-alt($f$) in function value and first derivative.
- What's better than matching the function in function value and first derivative at #auto-alt($x=a$)?
  - Matching the function in value, first derivative, _and_ second derivative  at #auto-alt($x=a$).
- What's better than matching the function in value, first derivative, and second derivative  at #auto-alt($x=a$)?
  - Matching the function in value, first derivative, second derivative, _and_ third derivative  at #auto-alt($x=a$)...
- Then we build up from there! Going one more degree at a time, matching one extra derivative at #auto-alt($x=a$) each term!

=== Taylor Series and Maclaurin Series
We have been able to write the power series of some functions using algebraic manipulations to line it up with #auto-alt($1/(1-u)$) type things. However, we may want to represent other functions with power series.

Suppose that #auto-alt($f$) can be represented with a power series. Then,
#auto-alt(
  $
    f(x) = sum_(n=0)^oo c_n (x-a)^n = c_0 + c_1(x-a) + c_2(x-a)^2 + c_3(x-a)^3 + c_4(x-a)^4 + ...
  $,
)
We already know that when we evaluate this at #auto-alt($x=a$) we get
#auto-alt(
  $
    f(a) = c_0
  $,
)
Now, taking the element-wise derivative we see that
#auto-alt(
  $
           f'(x) & = c_1 + 2 dot c_2 (x-a) + 3 dot c_3 (x-a)^2 + 4 dot c_4 (x-a)^3 + ... \
    " so " f'(a) & = c_1
  $,
)
Taking another derivative we see
#auto-alt(
  $
                    f''(x) & = 2 dot 1 dot c_2 + 3 dot 2 dot c_3 (x-a) + 4 dot 3 dot c_4 (x-a)^2 + ... \
              " so " f'(a) & = 2 c_1 \
    " or " c_1 = (f'(a))/2
  $,
)
Taking another derivative we see that
#auto-alt(
  $
           f'''(x) & = 3 dot 2 dot 1 dot c_3 + 4 dot 3 dot 2 dot c_4 (x-a) + ... \
    " so " f'''(a) & = 3! c_3 \
        " or " c_3 & = (f'''(a))/3!
  $,
)
Doing one more to really see the pattern,
#auto-alt(
  $
           f^((4)) (x) & = 4 dot 3 dot 2 dot 1 dot c_4 + 5 dot 4 dot 3 dot 2 dot c_5 (x-a) + ... \
    " so " f^((4)) (a) & = 4! c_4 \
            " or " c_4 & = (f^((4))(a))/4!
  $,
)
In general, the #auto-alt($n^"th"$) coefficient must be
#auto-alt(
  $
    c_n & = (f^((n))(a))/n!
  $,
)
#note-block[
  Note that we define #auto-alt($0! =1$) to make this true when #auto-alt($n=0$) as well.

  Side note: You can also justify this using another application of factorials: In combinatorics, the number of ways to arrange #auto-alt($n$) items in a list is #auto-alt($n!$). If you think about having 0 items to arrange in a list, there is only 1 way to do this, by not putting anything. So #auto-alt($0!=1$) makes sense "physically".
]

#theorem[
  _If_ a function #auto-alt($f$) has a power series representation, then
  #auto-alt(
    $
      f(x) = sum_(n=0)^oo (f^((n))(a))/n! (x-a)^n
    $,
  )
]
#note-block[
  - Note, this theorem does not say when a function has a power series representation.
  - Notation: Recall that #auto-alt($f^((n))(x)$) is the #auto-alt($n^"th"$) derivative of #auto-alt($f(x)$), and the parentheses are an important part of this notation. Use this for discussing more than the third or fourth derivative (#auto-alt($f'(x),f''(x),f'''(x)$) are reasonable...). Without the parentheses, #auto-alt($f^n (x)$) is an exponent, meaning #auto-alt($f^n (x) = (f(x)) dot (f(x)) dot (f(x)) dot (f(x)) ... dot (f(x)) = (f(x))^n$)
]

#definition[Taylor Series][
  The series
  #auto-alt(
    $
      f(x) = sum_(n=0)^oo (f^((n))(a))/n! (x-a)^n
    $,
  )
  is called the *Taylor Series of #auto-alt($f$) centered at #auto-alt($a$)*.
]
This series is named after Brook Taylor, who wrote a paper using Taylor Series in 1715, but the importance of it wasn't noticed until 1772 when Lagrange stumbled across it.

#definition[
  If #auto-alt($a=0$), then we say the series
  #auto-alt(
    $
      f(x) = sum_(n=0)^oo (f^((n))(a))/n! x^n
    $,
  )
  is the *Maclaurin Series of #auto-alt($f$)*.
]
This series is named after Colin Maclaurin, who did a lot of important mathematics using a specialized form of Taylor's series (at #auto-alt($a=0$)). I had fun reading his Wikipedia page, and learning that we have already seen another result of Maclaurin's! And that is Simpson's Rule! (behind the scenes Simpson's Rule comes from integrating a truncated Maclaurin series to approximate the integral!) Also, Maclaurin was a child prodigy who held the record for youngest math professor for centuries until Alia Sabur became a university professor when she was only 18 years old!

#example[
  Find the Maclaurin series, and its interval of convergence, for the function #auto-alt($f(x) = e^x$).
]
#my-solution-block[
  We start these problems by finding the first few derivatives evaluated at the center, and try to write a pattern. Note #auto-alt($a=0$) for Maclaurin series, and we have
  #auto-alt(
    $
        f(x) & = e^x, &        f(0) & = e^0=1 \
       f'(x) & = e^x, &       f'(0) & = e^0 = 1 \
      f''(x) & = e^x, &      f''(0) & = e^0 = 1 \
             & dots.v & f^((n)) (0) & = 1 " for all "n
    $,
  )
  Then we plug the derivatives into
  #auto-alt(
    $
      f(x) & = sum_(n=0)^oo (f^((n))(a))/n! x^n \
           & = sum_(n=0)^oo (1)/n! x^n \
       e^x & = sum_(n=0)^oo x^n/n! \
    $,
  )
  Now, we find the interval of convergence. By ratio test,
  #auto-alt(
    $
      L & = lim_(n arrow oo) abs(x^(n+1)/(n+1)! dot n!/x^n) \
        & = lim_(n arrow oo) abs((x^(n)x)/((n+1)n!) dot n!/x^n) \
        & = lim_(n arrow oo) abs(x)/(n+1) \
        & = 0
    $,
  )
  So the series converges for all #auto-alt($x$) values, so the radius of convergence is #auto-alt($R=oo$) and the interval of convergence is #auto-alt($(-oo,oo)$).
]

#example[
  Find the Taylor series, and its interval of convergence, for the function #auto-alt($f(x) = b^x$) centered at #auto-alt($x=1$), where #auto-alt($b>1$).
]
#my-solution-block[
  First we write out as many derivatives as it takes to identify a pattern
  #auto-alt(
    $
            f(x) & = b^x,           &        f(1) & = b^1= b (ln(b))^0 \
           f'(x) & = ln(b) b^x,     &       f'(1) & = ln(b) b^1 = b (ln(b))^1 \
          f''(x) & = (ln(b))^2 b^x, &      f''(1) & = (ln(b))^2 b^1 = b (ln(b))^2 \
                 & dots.v \
      f^((n))(x) & = (ln(b))^n b^x, & f^((n)) (1) & = b (ln(b))^n " for all "n
    $,
  )
  Then, we plug this into
  #auto-alt(
    $
      f(x) & = sum_(n=0)^oo (f^((n))(a))/n! x^n \
       b^x & = sum_(n=0)^oo (b (ln(b))^n )/n! x^n \
    $,
  )
  Then, to discuss convergence we check ratio test again,
  #auto-alt(
    $
      L & = lim_(n arrow oo) abs((b (ln(b))^(n+1) x^(n+1))/(n+1)! dot n!/(b (ln(b))^n x^n)) \
        & = lim_(n arrow oo) abs((b (ln(b))^(n) ln(b) x^(n) x)/((n+1) n!) dot n!/(b (ln(b))^n x^n)) \
        & = lim_(n arrow oo) abs(( ln(b) x)/((n+1) )) \
        & = lim_(n arrow oo) ln(b)/(n+1) abs(x) = 0 < 1
    $,
  )
  Again, no matter the #auto-alt($x$) value, the limit is 0, so ratio test says the series converges. Then, the series has radius of convergence #auto-alt($R=oo$) and interval of convergence #auto-alt($(-oo,oo)$)
]

#example[
  Find the Taylor Series Expansion for #auto-alt($f(x) = cos(x)$) centered at #auto-alt($x=pi$), and find its radius of convergence.
]
#my-solution-block[
  Again we start with derivatives until we find a pattern
  #auto-alt(
    $
            f(x) & = cos(x),  &       f(pi) & = cos(pi) = -1 \
           f'(x) & = -sin(x), &      f'(pi) & = -sin(pi) = 0 \
          f''(x) & = -cos(x), &     f''(pi) & = -cos(pi) = 1 \
         f'''(x) & = sin(x),  &    f'''(pi) & = sin(pi) = 0 \
      f^((4))(x) & = cos(x),  & f^((4))(pi) & = cos(pi) = -1 <- "same as the first value, and will repeat" \
                 & dots.v \
    $,
  )
  Writing the pattern here is a little harder, let's write a few terms in the series
  #auto-alt(
    $
      f(x) = (-1(x-pi)^0)/1 + 0 + (1(x-pi)^2)/2! + 0 + (-1(x-a)^4)/4! + 0 + ...
    $,
  )
  We only have even terms in the exponent and factorial in the denominator, and even numbers can be represented by #auto-alt($2n$). So we have the Taylor Series centered at #auto-alt($x=pi$) is
  #auto-alt(
    $
      cos(x) = sum_(n=0)^oo ((-1)^(n+1) (x-pi)^(2n))/((2n)!)
    $,
  )
  By ratio test we can find the radius of convergence
  #auto-alt(
    $
      L & = lim_(n arrow oo) abs((x-pi)^(2(n+1))/((2(n+1))!) dot ((2n)!)/((x-pi)^(2n))) \
        & = lim_(n arrow oo) abs((x-pi)^(2n+2)/((2n+2)!) dot ((2n)!)/((x-pi)^(2n))) \
        & = lim_(n arrow oo) abs((x-pi)^(2)/((2n+2)(2n+1))) = 0 < 1
    $,
  )
  So again we have #auto-alt($R=oo$) and interval of convergence is #auto-alt($(-oo,oo)$).
]

#emph-block[
  11.10a Section Summary:
  - We found the Taylor Series and Maclaurin Series expansions of functions.
  - We used ratio test to find the radius and interval of convergence of these series.
]

