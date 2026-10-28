// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.6b")
      #counter(heading).update(10)
      = Sequences and Series
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Ratio and Root Tests for Series
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
      == Ratio and Root Tests for Series
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
    ]
  }
}
#counter(heading).step(level: 3)
// #counter(heading).step(level: 3)

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.6 Learning Objectives
  - Know when and how to use the Ratio Test
  - Know when and how to use the Root Test
  - Understand why the ratio test is inconclusive when the ratio is 1
  - Understand why the root test is inconclusive when the root is 1
]

#example[
  Try to use ratio test to determine the convergence of the series
  $
    sum_(n=1)^infinity ((2n+1)/(3n+1))^n
  $
]

=== Root Test



#emph-block[
  11.6b Section Summary:

]

