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
  - Identify the different types of indeterminate forms a limit can take
  - Use L'Hospital's Rule for indeterminate forms #inline_eq($0/0$, "0 over 0") and #inline_eq($infinity/infinity$, "infinity over infinity")
  - Use techniques to rearrange limits of other indeterminate forms in order to use L'Hospital's Rule
]

#note-block[
  We are going on a tiny detour here back to chapter 4 and limit evaluation techniques so that we can build up some tools we will need in future sections. Specifically, we want to be able to evaluate integrals with infinity in the bounds or a vertical asymptote in the integrand (see section 7.8). Both of these techniques require us to evaluate limits. SO, we will spend 2 days going over L'Hospital's rule for taking integrals as #acc("x") goes to infinity.
]

=== Motivation
Find the following limit: #auto-alt($display(lim_(x arrow infinity) (ln|x|)/x^2)$)

Thinking back to limit rules, we can consider a limit of a ration as the ratio of the limits so long as they exist (and therefore are finite). Checking if this is possible, we see
#auto-alt(
  $
    lim_(x arrow infinity) ln(|x|) = infinity \
    " and " \
    lim_(x arrow infinity) x^2 = infinity
  $,
)
Neither of these limits exist, so we cannot use this good old limit rule, but if we check the graphs of these functions, it looks like the denominator grows much faster than the numerator. It sort of feels like the limit of the entire fraction should exist!

Thinking a bit more about how the function \"looks like the denominator grows much faster than the numerator\" we may start to think about derivatives. More on this in a moment.

Lastly, if we have a limit that looks like #auto-alt($infinity/infinity$) it could go to a few different values. In math, there are different sizes of infinity, but we don't really have a different way to write them (we kind of do but unless you're a math major we don't need to get into this). If the infinity on top of the fraction is larger, then the overall limit could be infinite; on bottom, then the overall limit could be 0 (and we also have to think about if they are approximately the same). There are other operations we can apply to #auto-alt($infinity$) that are similarly *indeterminate* depending on the relative sizes of the infinities.

#warning-block[Recall that when we take limits that go to #acc("infinity") we get a bit lazy with notation, #acc("infinity") is not a number so we cannot say it is equal to anything. However, when we say #auto-alt($lim_(x arrow infinity) x^2 = infinity$) what we mean is \"#auto-alt($"as " x arrow infinity, x^2 arrow infinity$)\". When we discuss indeterminate forms be very careful to never say \"something #inline_eq($=infinity/infinity$, "equals infinity over infinity")\" (or other indeterminate forms).]

#important-block[
  === Types of Indeterminate Forms of Limits
  The following are indeterminate forms for limits. If you get any of these when trying to evaluate a limit, you cannot conclude anything about the limit you want to take. Further action must be tried.

  #auto-alt(
    $
      (plus.minus infinity)/(plus.minus infinity) & "           " 0/0 & "           " infinity - infinity & "           " \ \
      plus.minus infinity dot 0 & "           " 1^infinity & "   " 0^0 & "           " infinity^0
    $,
  )
]

The following are NOT indeterminate forms.
- #auto-alt($-infinity-infinity$)    this goes to #auto-alt($-infinity$)
- #auto-alt($infinity dot infinity$)    this goes to #auto-alt($infinity$)
- #auto-alt($0 dot 0$)     this is still equal to 0, just like when you learned multiplication the first time

#theorem[L'Hospital's Rule][
  Suppose that #auto-alt($f$) and #auto-alt($g$) are differentiable on an open interval #acc("I") containing #acc("a"), and that #auto-alt($g'(x) eq.not 0$) on #acc("I") if #auto-alt($x eq.not a$). If either
  #auto-alt(
    $
      lim_(x arrow a) f(x)=lim_(x arrow a) g(x) = 0
    $,
  )
  or
  #auto-alt(
    $
      lim_(x arrow a) f(x)= lim_(x arrow a) g(x) = plus.minus infinity
    $,
  )
  then
  #auto-alt(
    $
      lim_(x arrow a) (f(x))/(g(x)) = lim_(x arrow a) (f'(x))/(g'(x))
    $,
  )
  assuming that the limit on the right side of this equation exists.
]
#remark-block[
  - While l'Hospital first published the calculus textbook with this result, it was his tutor, Johann Bernoulli, who first discovered it. L'Hospital was paying him, and so we still refer to it by his name, however. Also note, if you get far enough in any math or science class you may hear a lot about the Bernoulli Family!
  - The spelling of l'Hospital is more along the lines of how he would have spelt his name back in the 1600s, however you may see this name spelt in a more modern way as l'Hôpital in other sources.
]
#warning-block[
  After learning about l'Hospital's rule, some students forget the quotient rule for derivatives exists, and/or forget regular limit evaluation techniques. Take a moment to review those again and write out the differences between these and l'Hospital's rule. When do you use each, and how are they used?
  See sections 2.3 (Limit Laws) and 3.2 (Quotient Rule) if you feel you may need to review these distinctions.
]



#emph-block[
  4.4a Section Summary:
]

