// chapter_5.typ

#import "./../../template_notes.typ": *
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

#emph-block[
  7.1 Learning Objectives
  - I can extend the idea of area under a curve to area between curves.
]


#emph-block[
  7.1 Section Summary:
  - We learned how to find the area between curves, either in the #acc("x") or #acc("y") direction.
]

