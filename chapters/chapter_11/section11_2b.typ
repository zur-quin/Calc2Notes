// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(10)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.1b")
      = Sequences and Series
      #counter(heading).update(11)
      #counter(heading).step(level: 2)
      == Sequences
    ]
  } else if (
    sys.inputs.at("html-frames", default: "false") == "true"
      and sys.inputs.at("individualchs", default: "false") == "true"
  ) {
    [ // if single html still print the stuff
      = Sequences and Series
      #counter(heading).update(11)
      #counter(heading).step(level: 2)
      == Sequences
    ]
  } else {
    // main html
    [
      #counter(heading).update(11)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
    ]
  }
}
// #counter(heading).step(level: 3)
// #counter(heading).step(level: 3)

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.1b Learning Objectives

]



#theorem[Divergence Theorem (Test for Divergence)][
  If the series $display(sum_(n=1)^infinity)$ is convergent, then $display(lim_(n arrow infinity) a_n = 0)$.

  Therefore,
  - If $display(lim_(n arrow infinity)) a_n eq.not 0$, then $display(sum_(n=1)^infinity a_n)$ is divergent.
  - If $display(lim_(n arrow infinity) a_n = 0)$, then the series may converge or diverge. The test is inconclusive.
]

#example[
  Use the divergence test to determine the divergence of the following series if applicable.
  $
    sum_(k=1)^infinity (k^2)/(k^2-2k+5)
  $
]
#my-solution-block[
  Looking at the limit of the terms we have
  $
    lim_(k arrow infinity) (k^2)/(k^2-2k+5) =^"LH" lim_(k arrow infinity) (2k)/(2k-2) =^"LH" lim_(k arrow infinity) 2/2 = 1 eq.not 0
  $
  Thus, by the Divergence Theorem, the series diverges.
]

#example[
  Use the divergence test to determine the divergence of the following series if applicable.
  $
    sum_(n=1)^infinity ln((n^2+1)/(2n^2+1))
  $
]
#my-solution-block[
  Looking at the limit of the terms we have
  $
    lim_(n arrow infinity) ln((n^2+1)/(2n^2+1)) & = ln(lim_(n arrow infinity) (n^2+1)/(2n^2+1)) \
                                                & =^"LH" ln(lim_(n arrow infinity) (2n)/(4n)) \
                                                & = ln(1/2) eq.not 0 \
  $
  Thus, by the Divergence Theorem, the series diverges.
]




#emph-block[
  11.1b Section Summary:

]

