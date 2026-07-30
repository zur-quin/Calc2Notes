// main_notes.typ

// put all useful functions and variables you will use across chapters in template
#import "template_notes.typ": *

#show: template

#set document(title: "Math 1226 Notes")

// some additional formatting
#set page(numbering: "1")

// #show: show-theorion


// but don't define functions or variables there!
// chapters will not see it

// Now the chapters themselves as some Typst content
#include "chapters/chapter_5.typ"
#pagebreak(weak: true)
#include "chapters/chapter_6.typ"
#pagebreak(weak: true)
