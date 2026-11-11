#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 11.11a")
      #counter(heading).update(10)
      = Sequences and Series
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Applications of Taylor Polynomials
    ]
  } else if (
    sys.inputs.at("html-frames", default: "false") == "true"
      and sys.inputs.at("individualchs", default: "false") == "true"
  ) {
    [ // if single html still print the stuff
      #counter(heading).update(10)
      = Sequences and Series
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      == Applications of Taylor Polynomials
    ]
  } else {
    // main html
    [
      #counter(heading).update(11)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
      #counter(heading).step(level: 2)
    ]
  }
}

// any functions and templating you want for just this chapter can go here

#emph-block[
  11.11 Learning Objectives
  - Understand how to use Taylor Polynomials to estimate functions, limits, and more.
  - Understand Taylor's inequality to discuss the error when approximating functions with Taylor Series.
]

#example[
  How many non-zero terms of the Maclaurin series for #auto-alt($cos(x)$) do you need to estimate #auto-alt($cos(0.25)$) to within #auto-alt($10^(-16)$) (below machine precision)?
]
#my-solution-block[
  #auto-alt(
    $
      cos(0.25) & = sum_(n=0)^oo (-1)^n (0.25)^(2n)/(2n)! \
                & = 1 - 1/2 (0.25)^2 + 1/4! (0.25)^4 - 1/6! (0.25)^6 + ...
    $,
  )
  Note, this is an alternating series, so we can use the alternating series estimation theorem. The error is bounded by #auto-alt($abs(b_(n+1))$), so we need to find #auto-alt($n$) when
  #auto-alt(
    $
      abs((-1)^(n+1) (0.25)^(2(n+1))/(2(n+1))!) < 10^(-16)
    $,
  )
  #auto-alt($n=5$) has #auto-alt($abs((-1)^(n+1) (0.25)^(2(n+1))/(2(n+1))!) approx 1.24435 times 10^(-16)$) and #auto-alt($n=6$) has #auto-alt($abs((-1)^(n+1) (0.25)^(2(n+1))/(2(n+1))!) approx 4.27319 times 10^(-20)$) so #auto-alt($n=6$) is the stopping point we should use. Then (since we start at #auto-alt($n=0$)) we need seven non-zero terms to find #auto-alt($cos(0.25)$) with error less than #auto-alt($10^(-16)$).
]

#exercise[
  Open and experiment with the following Desmos pages to see what taking more terms in a Taylor Polynomial to approximate a function does.

  https://www.desmos.com/calculator/8f41372722

  https://www.desmos.com/calculator/67cc7057d1
]

#example[
  Prove (using series) #auto-alt($e^(i x) = cos(x) + i sin(x)$). Use this to show #auto-alt($e^(i pi) + 1 = 0$).
]
#my-solution-block[
  First,
  #auto-alt(
    $
                e^x & = sum_(n=0)^oo x^n/n! \
      "so " e^(i x) & = sum_(n=0)^oo (i x)^n/n!
    $,
  )
  Recall: #auto-alt($i = sqrt(-1)$), so #auto-alt($i^2 = -1$), #auto-alt($i^3=-i$), #auto-alt($i^4=1$), #auto-alt($i^5=i$), #auto-alt($i^6= -1$) and so on. As well, since #auto-alt($e^x$) is equal to it's Taylor series everywhere (check #auto-alt($R_n (x) arrow 0$)) we can rearrange the terms. So,
  #auto-alt(
    $
      e^(i x) & = sum_(n=0)^oo (i x)^n/n! \
              & = 1 + (i x) + (i x)^2/2 + (i x)^3/3! + (i x)^4/4! + (i x)^5/5! + (i x)^6/6! + ... \
              & = 1 + i x + (i^2 x^2)/2 + (i^3 x^3)/3! + (i^4 x^4)/4! + (i^5 x^5)/5! + ( i^6 x^6)/6! + ... \
              & = 1 + i x - (x^2)/2 - (i x^3)/3! + (x^4)/4! + (i x^5)/5! - (x^6)/6! +... \
              & = 1 - (x^2)/2 + (x^4)/4! - (x^6)/6! + ... + i x - (i x^3)/3! + (i x^5)/5! +... \
              & = 1 - (x^2)/2 + (x^4)/4! - (x^6)/6! + ... + i (x - ( x^3)/3! + ( x^5)/5! +...) \
              & = cos(x) + i sin(x)
    $,
  )
  So, #auto-alt($e^(i pi) = cos(pi) + i sin(pi) = -1 + 0$), thus #auto-alt($e^(i pi) + 1 = -1 + 1 = 0$).
]

#emph-block[
  11.11b Section Summary:
  - We used Maclaurin series to approximate function values.
  - We used series to prove the important relation #auto-alt($e^(i pi)+1=0$).
]

