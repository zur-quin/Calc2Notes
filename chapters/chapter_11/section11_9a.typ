#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.9a")
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
      == Representations of Functions as Power Series
    ]
  }
}

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.9 Learning Objectives
  - Use the idea of geometric series to write functions as power series
  - Find the derivative and integral of power series
  - Use derivatives and integrals to find power series of more complex functions
]

=== Motivation
The short story is *Polynomials Rule! Other functions drool!* But read on for a few more details.

In practical applications, _polynomials_ are our favorite type of functions.
- To derive/integrate them it is just power rule (one of the easier rules for both),
- Plugging numbers into polynomials is way easier than into other functions (can you tell me what $sin(3)$ is without a calculator? can you tell me what $3^2+ 4 dot 3 + 5$ is without a calculator?),
- Graphing polynomials is something a precalc class spends a lot of time on so it is something we consider easy at this point but other functions have other rules and are harder to deal with,
- (Getting into the gory details) Evaluating (in a computer) polynomials is possible using additions and multiplications, but evaluating other functions is not (they just use what we are about to discuss...approximations!),
- The domain of polynomials is all real numbers,
- Polynomials just have a lot of great properties that we often wish other functions had...

Since power series resemble _polynomials_, if we can represent certain functions we know as power series, a world of possibilities opens up.

Eventually (11.11 or other application based classes) we use an approximation (sum only to $N$ instead of $oo$) of the power series of a function in place of the actual function. This is how your calculator knows what $sin(3)$ is!

=== Jumping off from Geometric Series

Recall for a geometric series we can write either $ sum_(n=1)^oo a r^(n-1) " or " sum_(n=0)^oo a r^n, $ and for a convergent geometric series the sum is exactly $ sum_(n=0)^oo a r^n = a/(1-r) $.

#example[
  Using the geometric series test, when does $display(sum_(n=0)^oo x^n)$ converge and what value does it converge to (when it converges)?
]
#my-solution-block[
  $
    sum_(n=0)^oo x^n
  $
  is like a geometric series with $a=1$ and $r=x$. Geometric series converge when $abs(r)<1$, so we need $abs(x)<1$ for this to converge.

  We can double-check that for $x=plus.minus 1$ that the series diverges using the divergence theorem, since $lim_(n arrow oo) (plus.minus 1)^n != 0$. _This means we won't need to check endpoints when we use the geometric series test to find the interval of convergence for power series!_

  Then, when $abs(x)<1$ and the series converges, we know that
  $
    sum_(n=0)^oo x^n = a/(1-r) = 1/(1-x)
  $
]
This is an important result! Let's write this as a theorem to reference later.

#theorem[
  $
    sum_(n=0)^oo x^n = 1/(1-x)
  $
  for $abs(x)<1$.
  The power series given above has radius of convergence $R=1$ and interval of convergence $(-1,1)$.
]
Make a flash card or remember the above! This will be the basis for all of our ideas in 11.9!

We will use this fact to help us build up power series representations of other functions like in the following example.
#example[
  Express $ 1/(1+x^2) $ as the sum of a power series and find its interval of convergence.
]
#my-solution-block[
  We need to write this function as something that looks like $1/(1-u)$ to use the theorem above. Notice, we specifically need to be subtracting something in the denominator, so
  $
    1/(1+x^2) = 1/(1-(-x^2))
  $
  Then, the thing we are subtracting gets plugged into the power series representation of the function, so
  $
    1/(1+x^2) = 1/(1-(-x^2)) = sum_(n=0)^oo (-x^2)^n
  $
  We can rewrite this as $sum_(n=0)^oo (-1)^n x^(2n)$ if we want. Looking at $sum_(n=0)^oo (-x^2)^n$ it is easier to see that by the geometric series test we need $abs(-x^2)<1$.
  $
              abs(-x^2) & <1 \
    arrow.double -1 < x & < 1
  $
  The interval of convergence is $(-1,1)$, and we don't need to check endpoints because we used geometric series test.
]

#example[
  Express $display(x^4/(2x-3))$ as a power series and find its interval of convergence.
]
#my-solution-block[
  We can write
  $
    x^4/(2x-3) = x^4 dot 1/(2x-3) = x^4 dot 1/(-3(1-2/3 x)) = -x^4/3 dot 1/(1-2/3 x)
  $
  Which this has a $1/(1-u)$ type term now, where $u=2/3 x$.

  We can turn the $1/(1-u)$ part into a series,
  $
    x^4/(2x-3) = -x^4/3 dot 1/(1-2/3 x) & = -x^4/3 dot sum_(n=0)^oo (2/3 x)^n
  $
  This is not yet a power series (need to "distribute" the $-x^4/3$ into the sum still) this is where we take a second to talk about the interval of convergence since it is the $u^n$ step. For geometric series, this converges when $abs(r) = abs(2/3 x) < 1 arrow.double abs(x) < 3/2$. The radius of convergence is $R=3/2$, and since the series is centered at 0, the interval of convergence is $(-3/2,3/2)$.

  Continuing on with writing the power series,
  $
    x^4/(2x-3) & = -x^4/3 dot sum_(n=0)^oo (2/3 x)^n \
               & = sum_(n=0)^oo - 2^n/3^n x^n x^4/3 \
               & = sum_(n=0)^oo - 2^n/3^(n+1) x^(n+4) \
  $
]

If you want, skip this next note, but it is one of the reasons we have been doing all of chapter 11, so you may be interested. You don't need to know any of this stuff, but it may spark some more interest in the world of computational mathematics :)
#note-block[
  Tiny application side tangent, at this point if you have a function $f(x)=x^4/(2x-3)$ and you want to evaluate it in the interval $(-3/2,3/2)$, that the power series $sum_(n=0)^oo - 2^n/3^(n+1) x^(n+4)$ can be used in its place. In a practical application, you truncate this sum taking just the $N^"th"$ partial sum to do so, and get an approximation.

  _Why would you do this instead of just using the original function?_ Well, if you are trying to evaluate $f(x)=x^4/(2x-3)$ near $3/2$ (but just smaller than it), then the denominator here is very small. In the computer, this is like trying to divide by zero and any computational errors start to build up _a lot_ on this step (Not to mention that division is a much more "expensive" operation in computers). All of the operations in the power series can be turned into multiplication and addition/subtraction (3 in the denominator would by multiplication by 0.333 etc). This saves time (division takes longer than other operation) and is more accurate (when done right) and makes some functions possible to evaluate on a computer (we will be able to write $arctan(x)$ as a power series by the end of section 11.9).

  End side tangent, but this stuff is very cool and incredibly applicable to most sciences/engineering.
]

=== Differentiation and Integration of Power Series
Remember how taking derivatives and antiderivatives of polynomials is super easy? Well the same is true for power series, it's all power rule!

Finally, we have a way to make every Calc 1 student's dream come true: everything is always power rule!

#example[
  Find the power series representation of the derivative of $display(f(x) = sum_(n=0)^oo c_n (x-a)^n)$.
]

#my-solution-block[
  Note that $f(x)= c_0 + c_1(x-a) + c_2 (x-a)^2 + ...$ is differentiable  on the interval $(a-R, a+R)$ and
  $
     f(x) & = c_0 + c_1(x-a) + c_2 (x-a)^2 + ... \
    f'(x) & = 0 + c_1 + 2 c_2(x-a) + 3 c_3(x-a)^2 + ... \
          & = sum_(n=1)^oo n c_n (x-a)^(n-1) \
          & = sum_(n=0)^oo dv(, x)(c_n (x-a)^n)
  $
  This is sometimes called *term-by-term differentiation*.
]

#example[
  Find the power series representation of the antiderivative of $display(f(x) = sum_(n=0)^oo c_n (x-a)^n)$.
]
#my-solution-block[
  Note that $f(x)= c_0 + c_1(x-a) + c_2 (x-a)^2 + ...$ is differentiable (and thus continuous and so integrable) on the interval $(a-R, a+R)$ and
  $
                   f(x) & = c_0 + c_1(x-a) + c_2 (x-a)^2 + ... \
    integral f(x) dif x & = C + c_0 (x-a) + c_1((x-a)^2)/2 + c_2((x-a)^3)/3 + ... \
                        & = C+ sum_(n=0)^oo c_n ((x-a)^(n+1))/(n+1) \
                        & = C+ sum_(n=0)^oo integral c_n (x-a)^n dif x
  $
  This is sometimes called *term-by-term integration*.
]

Again, these are important results that we don't want to re-derive so we will write them as a theorem.
#theorem[
  Let $display(f(x) = sum_(n=0)^oo c_n (x-a)^n)$ with a radius of convergence $R>0$. Then,
  + $f'(x) = sum_(n=0)^oo dv(, x)(c_n (x-a)^n)$ with the same radius of convergence $R$.
  + $integral f(x) dif x = C + sum_(n=0)^oo integral c_n (x-a)^n dif x$ with the same radius of convergence $R$.
]
How do we find $C$ when we integrate a power series?


#emph-block[
  11.9a Section Summary:
]

