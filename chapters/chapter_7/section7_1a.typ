// chapter_5.typ

#import "./../../template_notes.typ": *
#import "@preview/diverential:0.3.0": *
#show: template

// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(6)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 7.1a")]
  }
}


// any functions and templating you want for just this chapter can go here

// content
= Integration Techniques
== Integration by Parts

#emph-block[
  7.1a Learning Objectives
  - I understand how integration by parts compares to the product rule.
  - I understand when and how to use integration by parts.
  - I can choose an appropriate #acc("u") and #acc("v").
  - I can use integration by parts to reduce integrals.
]

Recall that #acc("u")-substitution corresponded to "undoing" the chain rule (when taking derivatives). What corresponds to the product rule?

Product Rule: #math.equation($dv(, x)[f(x) g(x)] = f(x) g'(x) + f'(x) g(x)$, alt: "d by d x of f of x times g of x is f of x times g prime of x plus f prime of x g of x", block: true)

Integrating both sides, and rearranging slightly, we end up with the following
#math.equation(
  $
                       dv(, x)[f(x) g(x)] & = f(x) g'(x) + f'(x) g(x) \
                            f(x) g(x) + C & = integral f(x) g'(x) dif x + integral f'(x) g(x) dif x \
    f(x) g(x) - integral f'(x) g(x) dif x & = integral f(x) g'(x) dif x \
  $,
  alt: "d by d x of f of x times g of x is f of x times g prime of x plus f prime of x g of x. This line becomes f of x times g or x plus c equals the integral of f of x times g prime of x d x plus the integral of f prime of x g of x d x. This line then becomes f of x times g or x minus integral of f prime of x g of x d x equals the integral of f of x times g prime of x d x ",
  block: true,
)
Relabeling the last line with a few substitutions #math.equation($u=f(x) arrow.double dif u = f'(x) dif x$, alt: "u equals f of x so d u equals f prime of x d x") and #math.equation($v=g(x) arrow.double dif v = g'(x) dif x$, alt: "v equals g of x so d v equals g prime of x d x") we end up with

#theorem[Integration by Parts][
  #math.equation(
    $ integral u dif v = u v - integral v dif u $,
    alt: "integral of u d v equals u v times integral v d u",
    block: true,
  )
]



#example[
  Find the antiderivative: #block_eq($integral x sin(x) dif x$, "integral of x sine of x d x").
]
#my-solution-block[
  We don't know a best method for picking #acc("u") and d#acc("v") yet, so let's try something and see what happens. Let
  #IBP(
    inline_eq($sin(x)$, "sine of x"),
    inline_eq($cos(x)dif x$, "cosine of x d x"),
    inline_eq($x dif x$, "x dif x"),
    vstep: inline_eq($\ &&&= (x^2)/2$, "which is x squared over 2"),
  )

  Then
  #block_eq(
    $
      integral x sin(x) dif x & = sin(x) (x^2)/2 - underbrace(integral (x^2)/2 cos(x) dif x, "this integral looks worse")
    $,
    "integral of x sine of x d x equals sine of x times x squared over 2 minus the integral of x squared over 2 times cosine of x d x. This integral looks worse.",
  )
  Try the other way around now
  #IBP(
    inline_eq($x$, "x"),
    inline_eq($dif x$, "d x"),
    inline_eq($sin(x)$, "sine of x"),
    vstep: inline_eq($\ &&&= -cos(x)$, "which is negative cosine of x"),
  )
  This gives us
  #block_eq(
    $
      integral x sin(x) dif x & = - x cos(x) - underbrace(integral -cos(x) dif x, "which we know") \
                              & = - x cos(x) + sin(x) + C
    $,
    "integral of x sine of x d x equals negative x times cosine of x minus the integral of negative cosine of x d x. Which we know. Then this all evaluates to negative x times cosine of x plus sine of x plus c.",
  )
]
#exercise[ Check the above answer by taking the derivative. Did you get what we start with?]

=== How to we choose which function to use for #acc("u")?
#note-block[
  Recall that #acc("u") is a function of which we can easily derive, but not necessarily integrate. We tend to pick things that simplify a lot when we take the derivative of them: logarithms have #inline_eq($dv(, x)log(x, b) = 1/(ln(b)x)$, "the derivative of log base b of x is one over natural log b times x"), inverse trig functions have become almost algebraic like #inline_eq($dv(, x)arcsin(x)=1/sqrt(1-x^2)$, "derivative of arcsine of x is 1 over the square root of the difference between 1 and x squared"), and polynomials which decrease in number of term and power the more you derive them. Alternatively, things that don't change very much like trig functions and exponential functions might be avoided for #acc("u").

  Here is a way to discern potential functions for #acc("u"), keeping in mind that you often have to try a few things as you get used to the process.
  + *I*: Inverse trig functions
  + *L*: logarithmic functions
  + *A*: algebraic functions (polynomials, rational functions)
  + *T*: trig functions
  + *E*: exponential functions
]

=== Indefinite Integrals
#example[
  Find #block_eq($integral 2 x e^x dif x.$, "2 x times e to the x d x")
]
#my-solution-block[
  If we consider taking the exponential term as our choice for #acc("u"), then when we take the derivative of this term, it stays exactly the same. On the other hand, if we let #inline_eq($u=2x$, "u = 2 x") then when we take the derivative we get something simpler. This leads us to want to try #inline_eq($u=2x$, "u = 2 x") first. (But we might have to try something else later)

  Then,
  #IBP(
    inline_eq($2x$, " 2 x"),
    inline_eq($2 dif x$, " 2 d x"),
    inline_eq(
      $e^x dif x$,
      "e to the x d x",
    ),
    vstep: inline_eq($=e^x$, "e to the x"),
  )
  gives us
  #block_eq(
    $integral 2 x e^x dif x & = 2 x e^x - integral 2 e^x dif x\
    & = 2 x e^x - 2 e^x + C$,
    "2 x times e to the x d x equals 2 x e to the x minus integral of 2 e to the x d x. This becomes 2 x e to the x minus 2 e to the x plus C",
  )
]

#example[Find #block_eq($integral e^sqrt(x) dif x$, "integral of e to the square root of x d x")]

#my-solution-block[
  This problem is a little tricky, it needs a substitution first, and then it can be integrated by parts. Let #inline_eq($w=sqrt(x)$, "w = square root of x") then to get d#acc("x") we can solve for #acc("x"): #inline_eq($w^2 = x$, "w squared = x") so #inline_eq($2w dif w = dif x$, "2 w d w equals d x"). Then the integral becomes
  #block_eq(
    $integral e^sqrt(x) dif x & = integral 2 w e^w dif w$,
    "integral of e to the square root of x d x equals integral of 2 w e to the w d w",
  )
  Which we solved in the previous problem. So,
  #block_eq(
    $integral e^sqrt(x) dif x = 2 sqrt(x) e^sqrt(x) - 2 e^sqrt(x) + C$,
    "integral of e to the square root of x d x equals 2 root x times e to the root x minus 2 e to the root x plus c",
  )
]

#exercise[Find #block_eq($integral x^2 e^x dif x.$, "integral of x squared e to the x d x")]
#tip-block[
  Hint: Try something.
]

#emph-block[
  7.1a Section Summary:
  - We learned how to "undo" the product rule, via integration by parts.
  - We learned to use substitution and integration by parts in the same problem.
  - We learned that sometimes you have to do integration by parts multiple times to get a final answer.
]

