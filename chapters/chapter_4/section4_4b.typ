#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(3)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 4.4")
      = Limits
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == L'Hospital's Rule
      #counter(heading).step(level: 3)
      #counter(heading).step(level: 3)
      === Limit Examples (Continued)
    ]
  } else if (
    sys.inputs.at("html-frames", default: "false") == "true"
      and sys.inputs.at("individualchs", default: "false") == "true"
  ) {
    [ // if single html still print the stuff
      = Limits
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == L'Hospital's Rule
      #counter(heading).step(level: 3)
      #counter(heading).step(level: 3)
      === Limit Examples (Continued)
    ]
  }
}

// any functions and templating you want for just this chapter can go here

#emph-block[
  4.4b Learning Objectives
  - Understand how to transform any indeterminate form into one we can use l'Hospital's rule on
  - More limit practice/reminders before next section
]

Evaluate the limits. Remember to list where and why you can use l'Hospital's rule if you do so.

#example[
  #auto-alt(
    $
      lim_(x arrow infinity) (x^2+1)/(x^3+2x)
    $,
  )
]
#my-solution-block[
  #auto-alt(
    $
      lim_(x arrow infinity) (x^2+1)/(x^3+2x) & " has IFL infinity/infinity " \
      & =^"LH" lim_(x arrow infinity) (2x)/(3x^2+2) " (still has IFL " infinity/infinity) \
      & =^"LH" lim_(x arrow infinity) (2)/(6x) \
      & =^#hide("LH") 0
    $,
  )
]

#example[
  #auto-alt(
    $
      lim_(x arrow 1^+) 1/ln(x) - 1/(x-1)
    $,
  )
]
#my-solution-block[
  #auto-alt(
    $
      lim_(x arrow 1^+) 1/ln(x) - 1/(x-1) " has IFL "infinity-infinity
    $,
  )
  We cannot do l'Hospital's rule without rearranging to #auto-alt($o/o$) or #auto-alt($infinity/infinity$) first. Looking at the form of this, one thing we can try is adding (subtracting) the fractions together...Let's see if that helps us at all.

  #auto-alt(
    $
      lim_(x arrow 1^+) 1/ln(x) - 1/(x-1) & = lim_(x arrow 1^+) 1/ln(x) (x-1)/(x-1) - 1/(x-1) (ln(x))/ln(x) \
                                          & = lim_(x arrow 1^+) (x-1)/(ln(x)(x-1)) - ln(x)/(ln(x)(x-1)) \
                                          & = lim_(x arrow 1^+) (x-1-ln(x))/(ln(x)(x-1)) " has IFL " 0/0 \
                                          & =^"LH" lim_(x arrow 1^+) (1-1/x)/(1/x (x-1) + ln(x)) \
                                          & =^#hide("LH") lim_(x arrow 1^+) (1-1/x)/(1-1/x + ln(x)) " still has IFL " 0/0 \
                                          & =^"LH" lim_(x arrow 1^+) (1/x^2)/(1/x^2 + 1/x) \
                                          & =^#hide("LH") 1/(2)
    $,
  )
]
#tip-block[
  Another tool we have to manipulate an expression from one IFL to another is to combine things into 1 fraction!
]

#note-block[
  *Recall:* If f(x) is continuous and #auto-alt($lim_(x arrow a) g(x)$) exists, then
  #auto-alt(
    $
      lim_(x arrow a) f (g(x)) = f(lim_(x arrow a) g(x))
    $,
  )
]

#example[
  #auto-alt(
    $
      lim_(x arrow 0^+)(1+sin(4x))^(cot(x))
    $,
  )
]
#my-solution-block[
  #auto-alt(
    $
      lim_(x arrow 0^+)(1+sin(4x))^(cot(x)) " has IFL " 1^infinity
    $,
  )
  This is not one of the indeterminate forms we can use l'Hospital's rule on. We don't really want #auto-alt($infinity$) in the exponent, the 2 forms we can do LH on are #auto-alt($0/0$) and #auto-alt($infinity/infinity$), and neither have exponents. What are some things that can take an exponent and move it somewhere else? That's right! Logarithms! We can't just take #auto-alt($ln$) of something, so we use the fact that #auto-alt($e^(ln(x))=x$). Then,
  #auto-alt(
    $
      lim_(x arrow 0^+)(1+sin(4x))^(cot(x)) & = lim_(x arrow 0^+) e^display(ln((1+sin(4x))^(cot(x)))) \
                                            & = e^display((lim_(x arrow 0^+) ln((1+sin(4x))^(cot(x)))))
    $,
  )
  This notation is really cumbersome though, so before we continue, we just look at the exponent. We have to come back and remember #auto-alt($e$) at the end though.

  Consider just the exponent now,
  #auto-alt(
    $
      lim_(x arrow 0^+) ln((1+sin(4x))^(cot(x))) & = lim_(x arrow 0^+) cot(x)ln((1+sin(4x)))
    $,
  )
  This now has indeterminate form of #auto-alt($infinity dot 0$) so we can try using #auto-alt($f(x) = 1/(1/f(x))$) again,
  #auto-alt(
    $
      lim_(x arrow 0^+) ln((1+sin(4x))^(cot(x))) & = lim_(x arrow 0^+) cot(x)ln(1+sin(4x)) \
                                                 & = lim_(x arrow 0^+) ln(1+sin(4x))/tan(x) " has IFL " 0/0 \
                                                 & =^"LH" lim_(x arrow 0^+) (4cos(4x))/(1+sin(4x))/(sec^2(x)) \
                                                 & = (4/1)/1 = 4
    $,
  )
  But wait! This is not our final answer! Recall
  #auto-alt(
    $
      lim_(x arrow 0^+)(1+sin(4x))^(cot(x)) & = lim_(x arrow 0^+) e^display(ln((1+sin(4x))^(cot(x)))) \
                                            & = e^4
    $,
  )
]
#exercise[
  Show #auto-alt($ lim_(x arrow infinity) (1+1/x)^x = e $)
]

#emph-block[
  4.4b Section Summary:
  - We computed more limits with other indeterminate forms besides #auto-alt($0/0$) and #auto-alt($infinity/infinity$)
]

