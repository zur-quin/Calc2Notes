#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(11)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.2a")
    ]
  }
}
#counter(heading).step(level: 2)
== Series

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.2a Learning Objectives
  -
]

#emph-block[
  11.2a Section Summary:
]

