// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(6)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 7.7")
      = Integration Techniques
    ]
  }
}

#counter(heading).update(7)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
== Approximate Integration


// any functions and templating you want for just this chapter can go here

#emph-block[
  7.7 Learning Objectives
  - I understand how to use constant, linear, and quadratic functions to approximate integrals.
  - I understand the geometric interpretation of Simpson's Rule.
  - I understand how the type of approximation used affects the accuracy of our answer.
]

=== Motivation
The fundamental theorem of calculus guarantees that any continuous function has an antiderivative. And we have talked a *lot* about how to compute antiderivatives and integrals by hand. However, it turns out there are even more antiderivatives that we simply can't write in terms of functions we know even if they exist in theory. This isn't always just a case of "we haven't tried the right technique," it's just that there are some continuous functions that have antiderivatives, and those antiderivatives just aren't any nice named function we have. And these come up a lot! Unfortunately, integrals and antiderivatives have a lot of applications (some we have seen, some we will see soon, and more you may encounter in the wild) that are really important to all sorts of modeling, engineering, and other science applications.

Take for example $integral e^(x^2) dif x$ and $integral sqrt(1+x^3) dif x$. We cannot write these antiderivatives in terms of functions we know. But, from the FTC, we know the antiderivatives exist because $integral_a^x d^(t^2) dif t$ and $integral_a^x sqrt(1+t^3) dif t$ have continuous integrands.

#note-block[
  The way I talk about this section may make you think it is less important. It is sort of a tricky thing to test on in a timed environment without a calculator. However, this is one of biggest sections to pay attention to and take away from this class if you are any kind of engineer, computer scientist, or other STEM major. There are full classes based on just the topics in this section, and it is an incredibly important field. Being able to approximate integrals quickly and efficiently is very important.
]

#emph-block[
  7.7 Section Summary:
]

