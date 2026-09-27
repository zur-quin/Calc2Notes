#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(3)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 4.4a")
    ]
  }
}
= Limits
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
== L'Hospital's Rule


// any functions and templating you want for just this chapter can go here

#emph-block[
  4.4a Learning Objectives
]

#emph-block[
  4.4a Section Summary:
]

