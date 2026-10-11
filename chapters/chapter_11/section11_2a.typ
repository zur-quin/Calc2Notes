#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(11)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.2a")
      = Sequences and Series
    ]
  }
}
#counter(heading).step(level: 2)
== Series

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.2a Learning Objectives
  - Understand what a series means in relation to sequences
  - Identify types of series (geometric and harmonic)
  - Determine when a series converges or diverges
]

Suppose we have a sequence, #sequence(), and we want to add up all the terms. How do we sum an infinite number of values? (the short story is: very carefully, and one term at a time)

#definition[Series][
  Given a sequence of numbers #sequence(short: true), and expression of the form
  #auto-alt(
    $
      a_1 + a_2 + a_3 + a_4 + ... + a_n + ...
    $,
  )
  is an *infinite series*.

  The sequence #sequence(letter: auto-alt($s$), short: true) is defined by
  #auto-alt(
    $
      s_1 & = a_1 \
      s_2 & = a_1 + a_2 \
      s_3 & = a_1 + a_2 + a_3 \
          & " "dots.v \
      s_n & = a_1 + a_2 + a_3 + ... + a_n = sum_(k=1)^n a_k \
          & " "dots.v \
    $,
  )
  is the *sequence of partial sums* of the series, the number #auto-alt($s_n$) being the *#auto-alt($n^"th"$) partial sum*.

  If the new sequence, #sequence(letter: auto-alt($s$), short: true), of partial sums converges to a limit #auto-alt($L$), we say that the _series_ *converges* and that its sum is #auto-alt($L$). In this case, we also write,
  #auto-alt(
    $
      a_1 + a_2 + ... + a_n + ... = lim_(n arrow infinity) s_n = lim_(n arrow infinity) sum_(k=1)^n a_k = sum_(k=1)^infinity a_k = L.
    $,
  )

  If the sequence of partial sums of the series does not converge, we say that the series *diverges*.
]

#example[
  Determine the convergence of the series #auto-alt($display(sum_(k=1)^infinity (-1)^k)$) using partial sums.
]
#my-solution-block[
  The _sequence_ this series comes from is #auto-alt($a_1=-1, a_2 = 1, a_3 = -1, a_4 = 1, ...$) This means the _sequence of partial sums_ for the series is
  #auto-alt(
    $
      s_1 & = -1 \
      s_2 & = -1 + 1 = 0 \
      s_3 & = -1 + 1 -1 = -1 \
      s_4 & = -1 + 1 -1 + 1 = 0 \
          & " "dots.v \
    $,
  )
  The sequence of partial sums, #sequence(letter: auto-alt($s$), short: true), diverges, so the series, #auto-alt($sum_(k=1)^infinity (-1)^k$), diverges.
]

#example[
  Determine the convergence of the *telescoping series* #auto-alt($display(sum_(n=1)^infinity 1/(n(n+1)))$) using partial sums.
]

#my-solution-block[
  We can rewrite #auto-alt($1/(n(n+1))$) with partial fractions:
  #auto-alt(
    $
      1/(n(n+1)) & = A/n + B/(n+1) \
               1 & = A(n+1) + B n \
    $,
  )
  So the system we get is #auto-alt($A+B=0$) and #auto-alt($A=1$), so #auto-alt($B=-1$). Then
  #auto-alt(
    $
      1/(n(n+1)) & = 1/n - 1/(n+1)
    $,
  )
  This will help us write the sequence of partial sums. The #auto-alt($n^"th"$) partial sum is then
  #auto-alt(
    $
      s_n & = (1/1 - 1/2) + (1/2 - 1/3) + ... + (1/n - 1/(n+1)) \
          & = 1/1 + (- 1/2 + 1/2) + (- 1/3 + 1/3) + ... + (-1/n + 1/n) - 1/(n+1) \
          & = 1 - 1/(n+1).
    $,
  )
  Now we have a nice way to write the sequence of partial sums. The sequence of partial sums #auto-alt($#sequence(letter: auto-alt($s$)) = (1- 1/(n+1))_(n=1)^infinity$) converges since #auto-alt($ lim_(n arrow infinity) s_n = lim_(n arrow infinity) 1-1/(n+1)=1 $)
  So the series converges to 1:
  #auto-alt($ sum_(n=1)^infinity 1/(n(n+1)) = 1 $)

]

#example[
  Determine the convergence of the *harmonic series* #auto-alt($display(sum_(n=1)^infinity) 1/n$) using partial sums.
]
#my-solution-block[
  If #auto-alt($n$) is a power of 2, we get
  #auto-alt(
    $
      s_1 & = 1 = 1+0(1/2) \
      s_2 & = 1 + 1/2 =1+1(1/2) \
      s_4 & = 1 + 1/2 + 1/3 + 1/4 > 1 + 1/2 + 1/4 + 1/4 = 1 + 2(1/2) \
      s_8 & = 1 + 1/2 + 1/3 + 1/4 + 1/5 + 1/6 + 1/7 + 1/8 \
          & > 1 + 1/2 + (1/4 + 1/4) + (1/8 + 1/8 + 1/8 + 1/8) \
          & = 1 + 3(1/2)
    $,
  )
  This pattern continues, showing that #auto-alt($s_(2^n) gt.eq 1 + n/2$), so the sequence of partial sums is unbounded so it diverges. Thus, the harmonic series diverges.
]

#emph-block[
  11.2a Section Summary:
]

