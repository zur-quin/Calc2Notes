#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(11)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.6a")
      = Sequences and Series
    ]
  }
}
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
== Ratio and Root Tests for Series

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.4a Learning Objectives
  -
]

#emph-block[
  11.4a Section Summary:
]

