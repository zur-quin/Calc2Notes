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
  -
]


#emph-block[
  7.4b Section Summary:
  -
]

