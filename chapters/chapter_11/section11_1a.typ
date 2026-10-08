#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(10)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.1a")
    ]
  }
}
= Sequences and Series
== Sequences

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.1 Learning Objectives
  - Understand how to write a sequence and find their formula if they have one
  - Find the limit of a sequence using limit laws and theorems
  - Determine whether sequences converge or diverge using theorems
  - Determine whether a sequence is increasing or decreasing, and whether it is bounded
]

#definition[Sequence][
  A *sequence* is a list of numbers $a_1,a_2,a_3,...,a_n,...$ in a definite order.

  The $a_i$ are called the *terms (or values)* of the sequence.
]

Consider the sequence
$
  1,1,2,3,5,8,13,...
$
What is $a_1$?
$
  underbrace(1, a_1),1,2,3,5,8,13,...
$
This is the first term in the list, so it is $a_1=1$.

What is $a_6$?
$
  1,1,2,3,5,underbrace(8, a_6),13,...
$
This is the sixth term in the list, so it is $a_6=8$.

#definition[
  The integer $n$ is called the *index* of $a_n$. It indicates what term in the sequence you are considering.

  We can think of the sequence $a_1,a_2,...a_n,...$ as a function that sends the positive integer $n$ to the $n^"th"$ value in the sequence, $a_n$.
  $
    f(n) = a_n, " so " & f(1) = a_1 \
                       & f(2) = a_2 \
                       & f(3) = a_3 \
                       & "  " dots.v
  $

  The length of a sequence refers to the *number of terms* in the sequence. Sequences can be either infinite or finite.
]

#note-block[
  Notation: We typically denote sequences with some kind of parentheses or brackets.
  $
    (a_n)_(n=1)^infinity, " " [a_n]_(n=1)^infinity, " ", {a_n}_(n=1)^infinity
  $
  all refer to the sequence
  $ (a_1,a_2,a_3,...,a_n,...) $
  where $a_i$ is the $i^"th"$ term in the sequence.

  Note: the indexing does not have to start at $n=1$, and sometimes the index labeling is left off (something like just "$(a_n)$" for example).
]

#example[
  List the first 6 terms of the following sequences
  + $(a_n)_(n=1)^infinity = (sqrt(n))_(n=1)^infinity$
  + $(b_n)_(n=3)^infinity = (cos(pi n))_(n=3)^infinity$
]
#my-solution-block[
  + $(a_n)_(n=1)^infinity = (sqrt(n))_(n=1)^infinity$
  $
    a_1=1, a_2 = sqrt(2), a_3 = sqrt(3), a_4 = 2, a_5 = sqrt(5), a_6 = sqrt(6)
  $
  + $(b_n)_(n=3)^infinity = (cos(pi n))_(n=3)^infinity$
  $
    b_3 = cos(3pi) = -1, b_4=cos(4 pi) = 1, b_5=-1, b_6 = 1, b_7=-1, b_8=1
  $
  Just because the indexing starts at $n=3$, doesn't change how we read the first 6 terms.
]

#example[
  Write a rule that specifies the values of the sequence
  $
    #sequence(letter: auto-alt($b$)) = (-1/2 , 2/3, - 3/4, 4/5, ...).
  $
]
#my-solution-block[
  Notice, the numerator is the index, and the denominator is one larger than the index. So, accounting for the alternating $plus.minus$ signs,
  $
    b_n = (-1)^n n/(n+1).
  $
]

#definition[
  A *recurrence relation* for a sequence $a_0, a_1, a_2,...$ is a formula that relates each value $a_k$ to certain predecessors $a_(k-1), a_(k-2),...$.
]
#example[
  Define a sequence $c_0,c_1,c_2,...$ recursively as follows: For all integers $k gt.eq 2$,
  + $c_k = c_(k-1) + k c_(k-2) + 1$, we call this the recurrence relation
  + $c_0=1$ and $c_1=2$, we call this the initial conditions

  Find $c_2,c_3,c_4$.
]
#my-solution-block[
  $
    c_2 & = c_1 + 2 dot c_0 + 1 = 2+2(1)+1 = 5 \
    c_3 & = c_2+ 3dot c_1+ 1 = 5+3(2)+1=12 \
    c_4 & = c_3+ 4dot c_2+ 1 = 12+4(5)+1=33 \
  $
]

#definition[
  The sequence #sequence(short: true) *converges* to the number $L$ if $lim_(n arrow infinity) = L$.

  If no such number $L$ exists, we say that #sequence(short: true) *diverges*.

  We say the sequence #sequence(short: true) *diverges to (minus) infinity* if $lim_(n arrow infinity) a_n = plus.minus infinity$
]
What does this mean?

If we go back to thinking about a sequence as a function that maps integers to real numbers, then we can essentially think of the terms in the sequence as being part of a continuous function with the same behavior as the sequence at integers. Then we can look at the limit of the function.
//todo: plots

#theorem[
  If $display(lim_(x arrow infinity)=L)$ and $f(n)=a_n$ when $n$ is an integer, then
  $
    lim_(n arrow infinity) a_n = L.
  $
]

#example[
  Does the sequence $display(((n^2+3n+1)/(2n^2+1))_(n=1)^infinity)$ converge?
]
#my-solution-block[
  If suffices to check that $lim_(x arrow infinity) (x^2+3x+1)/(2x^2+1)$ converges, so we can look at this and use regular limit techniques.
  $
    lim_(x arrow infinity) (x^2+3x+1)/(2x^2+1) & " has IFL " infinity/infinity \
                                               & =^"LH" lim_(x arrow infinity) (2x+3)/(4x) " has IFL " infinity/infinity \
                                               & =^"LH" lim_(x arrow infinity) (2)/(4) \
                                               & = 1/2
  $
  Because the function where $f(n)=a_n$ converges to $1/2$, the sequence $display(#sequence() = ((n^2+3n+1)/(2n^2+1))_(n=1)^infinity)$ converges $1/2$ as well.
]

#emph-block[
  11.1a Section Summary:
]

