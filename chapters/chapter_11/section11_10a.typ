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
  For a (continuous near $a$) function $f$, the linearization of $f$ centered at $a$ is the tangent line to the function at the point $(a,f(a))$. Precisely, in _point slope_ form ($y=m(x-x_1)+y_1$)
  $
    L(x) = f'(a)(x-a) + f(a)
  $
  todo: graph of linearization
]
- The idea behind linearization is to come up with a simple function (a line $L$) that matches $f$ in function value and first derivative.
- What's better than matching the function in function value and first derivative at $x=a$?
  - Matching the function in value, first derivative, _and_ second derivative  at $x=a$.
- What's better than matching the function in value, first derivative, and second derivative  at $x=a$?
  - Matching the function in value, first derivative, second derivative, _and_ third derivative  at $x=a$...
- Then we build up from there! Going one more degree at a time, matching one extra derivative at $x=a$ each term!

=== Taylor Series and Maclaurin Series
We have been able to write the power series of some functions using algebraic manipulations to line it up with $1/(1-u)$ type things. However, we may want to represent other functions with power series.

Suppose that $f$ can be represented with a power series. Then,
$
  f(x) = sum_(n=0)^oo c_n (x-a)^n = c_0 + c_1(x-a) + c_2(x-a)^2 + c_3(x-a)^3 + c_4(x-a)^4 + ...
$
We already know that when we evaluate this at $x=a$ we get
$
  f(a) = c_0
$
Now, taking the element-wise derivative we see that
$
         f'(x) & = c_1 + 2 dot c_2 (x-a) + 3 dot c_3 (x-a)^2 + 4 dot c_4 (x-a)^3 + ... \
  " so " f'(a) & = c_1
$
Taking another derivative we see
$
                  f''(x) & = 2 dot 1 dot c_2 + 3 dot 2 dot c_3 (x-a) + 4 dot 3 dot c_4 (x-a)^2 + ... \
            " so " f'(a) & = 2 c_1 \
  " or " c_1 = (f'(a))/2
$
Taking another derivative we see that
$
         f'''(x) & = 3 dot 2 dot 1 dot c_3 + 4 dot 3 dot 2 dot c_4 (x-a) + ... \
  " so " f'''(a) & = 3! c_3 \
      " or " c_3 & = (f'''(a))/3!
$
Doing one more to really see the pattern,
$
         f^((4)) (x) & = 4 dot 3 dot 2 dot 1 dot c_4 + 5 dot 4 dot 3 dot 2 dot c_5 (x-a) + ... \
  " so " f^((4)) (a) & = 4! c_4 \
          " or " c_4 & = (f^((4))(a))/4!
$
In general, the $n^"th"$ coefficient must be
$
  c_n & = (f^((n))(a))/n!
$

#theorem[
  _If_ a function $f$ has a power series representation, then
  $
    f(x) = sum_(n=0)^oo (f^((n))(a))/n! (x-a)^n
  $
]

#definition[Taylor Series][
  The series
  $
    f(x) = sum_(n=0)^oo (f^((n))(a))/n! (x-a)^n
  $
  is called the *Taylor Series of $f$ centered at $a$*.
]
This series is named after Brook Taylor, who wrote a paper using Taylor Series in 1715, but the importance of it wasn't noticed until 1772 when Lagrange stumbled across it.

#definition[
  If $a=0$, then we say the series
  $
    f(x) = sum_(n=0)^oo (f^((n))(a))/n! x^n
  $
  is the *Maclaurin Series of $f$*.
]
This series is named after Colin Maclaurin, who did a lot of important mathematics using a specialized form of Taylor's series (at $a=0$). I had fun reading his Wikipedia page, and learning that we have already seen another result of Maclaurin's! And that is Simpson's Rule! (behind the scenes Simpson's Rule comes from integrating a truncated Maclaurin series to approximate the integral!) Also, Maclaurin was a child prodigy who held the record for youngest math professor for centuries until Alia Sabur became a university professor when she was only 18 years old!

#example[
  Find the Maclaurin series, and its radius of convergence, for the function $f(x) = e^x$.
]

#example[
  Find the Taylor Series Expansion for $f(x) = cos(x)$ centered at $x=pi$, and find its radius of convergence.
]

=== Maclaurin Series of Common Functions


#exercise[
  Derive the above Maclaurin series expansions and intervals of convergence for the above series.

]

#emph-block[
  11.10a Section Summary:
]

