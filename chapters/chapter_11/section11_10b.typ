#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.10b")
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
      #counter(heading).step(level: 2)
    ]
  }
}
// any functions and templating you want for just this chapter can go here

#emph-block[
  11.10 Learning Objectives
  -
]

=== Maclaurin Series of Common Functions
You should be able to recognize (or re-derive) the following functions and their series.
#table(
  columns: (1fr, 1fr, 1fr),
  align: center + horizon,
  table.header([*Function*], [*Series*], [*Interval of Convergence*]),
  $ e^x $, $ sum_(n=0)^oo x^n/n! $, $(-oo,oo)$,
  $ b^x $, $ sum_(n=0)^oo (b (ln(b))^n )/n! x^n $, $(-oo,oo)$,
  $ cos(x) $, $ sum_(*n=0)^oo ((-1)^n x^(2n))/((2n)!) $, $(-oo,oo)$,
)

#exercise[
  Derive the above Maclaurin series expansions and intervals of convergence for the above series.
]

#emph-block[
  11.10a Section Summary:
]

