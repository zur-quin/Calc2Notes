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
    [ #set document(title: "Section 7.1")]
  }
}


// any functions and templating you want for just this chapter can go here

// content
= Integration Techniques
== Integration by Parts

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

#IBP(
  inline_eq($sin(x)$, "sine of x"),
  inline_eq($cos(x)dif x$, "cosine of x d x"),
  inline_eq($x dif x$, "x dif x"),
  vstep: inline_eq($\ &&&= (x^2)/2$, "which is x squared over 2"),
)

// u,du,dv,v
// #IBP($$,$$,$$,$$)

#emph-block[
  7.1 Learning Objectives
  - I understand how integration by parts compares to the product rule.
  - I understand when and how to use integration by parts.
  - I can choose an appropriate #acc("u") and #acc("v")
  - I can use integration by parts to reduce integrals.
]




#emph-block[
  7.1 Section Summary:
  - We learned how to "undo" the product rule, via integration by parts.
  -
]

