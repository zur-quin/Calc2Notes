// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(10)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.1b")
      = Sequences and Series
      #counter(heading).update(11)
      == Sequences
    ]
  } else if (
    sys.inputs.at("html-frames", default: "false") == "true"
      and sys.inputs.at("individualchs", default: "false") == "true"
  ) {
    [ // if single html still print the stuff
      = Sequences and Series
      #counter(heading).update(11)
      == Sequences
    ]
  } else {
    // main html
    [
      #counter(heading).update(11)
      #counter(heading).step(level: 2)
    ]
  }
}
// #counter(heading).step(level: 3)
// #counter(heading).step(level: 3)

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.1b Learning Objectives
  - Understand how to write a sequence and find their formula if they have one
  - Find the limit of a sequence using limit laws and theorems
  - Determine whether sequences converge or diverge using theorems
  - Determine whether a sequence is increasing or decreasing, and whether it is bounded

]

#theorem[Squeeze Theorem for Sequences][
  If #auto-alt($a_n lt.eq b_n lt.eq c_n$) for all #auto-alt($n gt.eq N$) where #auto-alt($N$) is a positive integer, and #auto-alt($ lim_(n arrow infinity) a_n = L = lim_(n arrow infinity) c_n, $) then we must have #auto-alt($ lim_(n arrow infinity) b_n = L $)
]

#example[
  Does the sequence #auto-alt($display(((cos(n))/n)_(n=1)^infinity)$) converge?
]
#my-solution-block[
  First, notice #auto-alt($-1 lt.eq cos(n) lt.eq 1$). So, #auto-alt($ (-1)/n lt.eq (cos(n))/n lt.eq (1)/n. $) Since both #auto-alt($(1/n)_(n=1)^infinity$) and #auto-alt($((-1)/n)_(n=1)^infinity$) both converge to 0, then by the squeeze theorem, the sequence #auto-alt($((cos(n))/n)_(n=1)^infinity$) converges to 0 as well.
]

#theorem[Limits of Continuous Functions][
  If #auto-alt($lim_(n arrow infinity) a_n = L$) and a function, #auto-alt($f$), is continuous at #auto-alt($L$), then #auto-alt($ lim_(n arrow infinity) f(a_n) = f(lim_(n arrow infinity) a_n) = f(L). $)
]

#example[
  Does the sequence #auto-alt($display(sin(pi/2 + 1/n)_(n=1)^infinity)$) converge?
]

#my-solution-block[
  Because the function #auto-alt($f(x) = sin(x)$) is a continuous function, then by the theorem:
  #auto-alt(
    $
      lim_(n arrow infinity) sin(pi + 1/n) & = sin(lim_(n arrow infinity) pi/2 + 1/n) \
                                           & = sin(pi/2) \
                                           & = 1
    $,
  )
  So the sequence #auto-alt($display(sin(pi/2 + 1/n)_(n=1)^infinity)$) converges to 1.
]

#theorem[
  If #auto-alt($display(lim_(n arrow infinity) |a_n| = 0)$), then #auto-alt($display(lim_(n arrow infinity) a_n = 0)$).
]

#example[
  Does #auto-alt($(((-1)^n)/n)_(n=1)^infinity$) converge?
]
#my-solution-block[
  Observe that
  #auto-alt(
    $
      lim_(n arrow infinity) abs(((-1)^n)/n) = lim_(n arrow infinity) 1/n = 0,
    $,
  )
  so #auto-alt($lim_(n arrow infinity) ((-1)^n)/n = 0$) and the sequence #auto-alt($(((-1)^n)/n)_(n=1)^infinity$) converges to 0 as well.
]

#definition[
  A sequence #sequence() is said to be *increasing* if #auto-alt($a_(n+1) gt.eq a_n$) for each #auto-alt($n$).

  A sequence #sequence() is said to be *decreasing* if #auto-alt($a_(n+1) lt.eq a_n$) for each #auto-alt($n$).

  A sequence that is either always increasing or always decreasing is called *monotonic*.
]

#definition[
  We say that the sequence #sequence() is *bounded above* if there exists a number #auto-alt($M$) such that #auto-alt($a_n lt.eq M$) for all #auto-alt($n$).

  Similarly, we note that the sequence #sequence() is *bounded below* if there exists a number #auto-alt($m$) such that #auto-alt($a_n gt.eq m$) for all #auto-alt($n$).

  We say that a sequence #sequence() is *bounded* if there exists a number #auto-alt($M$) such that #auto-alt($abs(a_n) < M$) for all #auto-alt($n$). That is, #sequence() is bounded above _and_ below.
]
#example[
  Determine if the sequence is increasing, decreasing, or neither. Determine whether the sequence is bounded:
  #auto-alt(
    $
      (n)_(n=1)^infinity
    $,
  )
]

#my-solution-block[
  #auto-alt(
    $
      (n)_(n=1)^infinity = (1,2,3,4,5,6,7,8,9,...)
    $,
  )
  This sequence is( monotonically) increasing, and bounded below by 0. However, it is not bounded (because it is not bounded above).
]


#example[
  Determine if the sequence is increasing, decreasing, or neither. Determine whether the sequence is bounded:
  #auto-alt(
    $
      (1/(2n+1))_(n=1)^infinity
    $,
  )
]
#my-solution-block[
  #auto-alt(
    $
      (1/(2n+1))_(n=1)^infinity = ( 1/3, 1/5, 1/7, 1/9, ...)
    $,
  )
  This sequence is( monotonically) decreasing. It is bounded above by #auto-alt($M=1/3$) and it is bounded below by #auto-alt($m=0$). Thus, this sequence is bounded.
]

#example[
  Determine if the sequence is increasing, decreasing, or neither. Determine whether the sequence is bounded:
  #auto-alt(
    $
      ((1-n)/(2+n))_(n=1)^infinity
    $,
  )
]

#my-solution-block[
  #auto-alt(
    $
      ((1-n)/(2+n))_(n=1)^infinity = (0,-1/4,-2/5,-3/6,-4/7,...)
    $,
  )
  These fractions are a bit harder to tell what's going on so we will also use other tools to help us analyze this one. First, notice that every value after the first is negative. So, the sequence is bounded above by #auto-alt($M=0$). Also notice the function #auto-alt($y=(1-x)/(2+x)$) has a horizontal asymptote at #auto-alt($y=-1$). We can see the fractions are indeed approaching #auto-alt($y=-1$) and that #auto-alt($y$) is decreasing on #auto-alt($[1,infinity)$) (so we know it doesn't pass the asymptote and come back up towards it), so the lower bound is #auto-alt($m=-1$). The sequence is decreasing (monotonically) and is bounded.
]

#example[
  Determine if the sequence is increasing, decreasing, or neither. Determine whether the sequence is bounded:
  #auto-alt(
    $
      ((-1)^n)_(n=1)^infinity
    $,
  )
]<ex:alt>

#my-solution-block[
  This sequence is bounded above by #auto-alt($M=1$) and below by #auto-alt($m=-1$), so it is bounded. It is not monotonic, it alternates between #auto-alt($1$) and #auto-alt($-1$).
]

#theorem[
  Every convergent sequence is bounded.
]
#warning-block[
  These statements are not 2 way! This theorem says if we start with a convergent sequence, then we can conclude that it is also bounded. Alternatively, if we start with a bounded sequence there is NO guarantee that the sequence is convergent (see @ex:alt)
]

#note-block[
  We can add a condition to the above theorem to make it go "both directions"...
]
#theorem[
  If a sequence #sequence() is both bounded AND monotonic, then the sequence converges.
]

#corollary[
  If a sequence is *unbounded*, then it diverges.
]


#emph-block[
  11.1b Section Summary:
  - We looked into theorems and more definitions around sequences and their convergence.
  - We can identify when sequences are monotonically increasing or decreasing and if they are bounded and use this information to (potentially) say more about if they converge or not.
]

