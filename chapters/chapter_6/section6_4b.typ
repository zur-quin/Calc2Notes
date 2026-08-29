// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template

// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(6)
#context {
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [#counter(heading).update(5)
      = Applications of Integrals
      #set document(title: "Section 6.4")]
  }
}
#context counter(heading).step(level: 2)
#context counter(heading).step(level: 2)
#context counter(heading).step(level: 2)

// any functions and templating you want for just this chapter can go here

== Work
#emph-block[
  6.4 b Learning Objectives:
  - I can understand the definitions of work and force.
  - I understand how to use integration to describe work.
  - I can describe the work done when pumping fluids out of containers of varying shapes.
]

#emph-block[
  6.4 b Section Summary:
]
