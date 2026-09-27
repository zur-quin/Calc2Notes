#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(7)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 8.5")
    ]
  }
}
= Even More Integral Applications
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
== Probability

// any functions and templating you want for just this chapter can go here

#emph-block[
  8.5 Learning Objectives
]

#emph-block[
  8.5 Section Summary:
]

