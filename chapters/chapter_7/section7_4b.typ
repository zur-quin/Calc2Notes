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
    [ #set document(title: "Section 7.4b")
      = Integration Techniques
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Partial Fraction Decomposition
      #counter(heading).step(level: 3)
      #counter(heading).step(level: 3)
      === Integrals Needing Partial Fraction Decomposition (Continued)
    ]
  } else if (
    sys.inputs.at("html-frames", default: "false") == "true"
      and sys.inputs.at("individualchs", default: "false") == "true"
  ) {
    [ // if single html still print the stuff
      #counter(heading).update(7)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 3)
      #counter(heading).step(level: 3)
      === Integrals Needing Partial Fraction Decomposition (Continued)
    ]
  } else {
    // main html
    [
      #counter(heading).update(7)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 3)
      #counter(heading).step(level: 3)
      #counter(heading).step(level: 3)
    ]
  }
}

// any functions and templating you want for just this chapter can go here

// content
#emph-block[
  7.4b Learning Objectives
  - I can use partial fraction decomposition to help me solve integrals.
]

#example[
  Compute the following antiderivative
  $
    integral (3e^(2x) - 5 e^(3x))/((3e^x-1)(e^x-1)^2) dif x
  $
]

#note-block[
  If you feel like you need to review exponent rules do that, note
  $
    e^(3x)=e^(2x) e^x
  $
  for example.
]

#my-solution-block[
  First, it looks like $e^x$ is everywhere, so we will do a quick $u$-substitution with $u=e^x$. Then $dif u = e^x dif x$
  $
    integral (3e^(2x) - 5 e^(3x))/((3e^x-1)(e^x-1)^2) dif x & = integral (3e^(x) - 5 e^(2x))/((3e^x-1)(e^x-1)^2) e^x dif x \
                                                            & = integral (3u - 5 u^2)/((3u-1)(u-1)^2) dif u \
  $
  Now, this integral needs a partial fraction decomposition
]

#example[
  Compute the following antiderivative
  $
    integral (x^4+2x^2 + 1)/(x-1) dif x
  $
]

#emph-block[
  7.4b Section Summary:
  - We solved a lot of integrals using partial fraction decomposition.
]

