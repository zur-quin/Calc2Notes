#import "./../../template_notes.typ": *
#show: template


// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(7)
#context {
  //if individual pdfs
  if target() == "paged" and sys.inputs.at("individualchs", default: "false") == "true" {
    [ #set document(title: "Section 8.3")
    ]
  }
}
= Even More Integral Applications
#counter(heading).step(level: 2)
#counter(heading).step(level: 2)
== Moments and Center of Mass


// any functions and templating you want for just this chapter can go here

#emph-block[
  8.3 Learning Objectives
  - Understand systems of individual masses and laminae
  - Find the moment of a system about a given axis
  - Find the center of mass of a system of #auto-alt($n$) masses
  - Find the centroid of a system with one continuous mass
]
=== Motivation
Suppose we have 2 masses (of different mass) supported on a massless rod (picture 2 heavy weights held up by a thin wire in comparison. The wire has essentially no weight compared to the weights). Where could we put a *fulcrum* so that the system is balanced?

In @AlexCalder Alexander Calder brings this concept to life through his art. He has created many pieces involving the balancing of weights held with wire as mobile sculptures, this one is called "Black and Yellow Dots in the Air". He was originally trained as a mechanical engineer, and had some sculptors in the family.

#figure(
  image(
    "figures/Alexander-Calder-Black-and-Yellow-Dots-in-the-Air-1960-1-510243535.jpg",
    alt: "an image of Alexander Calder's mobile titled Black and Yellow Dots in the Air",
    width: 50%,
  ),
  caption: "Black and Yellow Dots in the Air by Alexander Calder",
)<AlexCalder>

In the physics sense, we need to balance the torque about a specific point.

#figure(image(
  "figures/fulcrum.svg",
  alt: "sketch of 2 masses, m 1 and m 2, attached with wire a distance d 1 and d 2 away from a fulcrum. The x axis below is labeled x 1 at m1 and x 2 at m 2 and the fulcrum is labeled x bar",
))
In the 1 dimensional case, we need to balance the mass times the distance on both sides of our fulcrum. That is, if
#auto-alt(
  $
    m_1d_1 = m_2 d_2
  $,
)
the system will be balanced. From the sketch we see that #auto-alt($d_1=(overline(x)-x_1)$) and #auto-alt($d_2 = (x_2-overline(x))$), and doing a bit of algebra we can solve for #inline_eq($overline(x)$, "x bar"), the location to put the fulcrum.
#auto-alt(
  $
                 &&                           m_1 d_1 & = m_2 d_2 \
    arrow.double &&             m_1 (overline(x)-x_1) & = m_2 (x_2-overline(x)) \
    arrow.double &&          m_1 overline(x)- m_1 x_1 & = m_2 x_2 - m_2 overline(x) \
    arrow.double && m_1 overline(x) + m_2 overline(x) & = m_2 x_2 + m_1 x_1 \
    arrow.double &&             overline(x) (m_1+m_2) & = m_2 x_2 + m_1 x_1 \
    arrow.double &&                       overline(x) & = (m_1 x_1+m_2 x_2)/(m_1+m_2).
  $,
)

=== 1-Dimensional Moment and Center of Mass for Point Masses

#definition[Moment and Center of Mass][
  We say that the *moment* of a system about the origin is given by
  #auto-alt(
    $
      M = sum_(k=1)^n m_k x_k ,
    $,
  )
  for a system with #auto-alt($n$) objects, where #auto-alt($m_i$) represents each objects mass and #auto-alt($x_i$) represents the _signed_ distance from the origin.

  We say that each #auto-alt($m_i x_i$) is *a moment*.

  The location
  #auto-alt(
    $
      overline(x)=M/(display(sum_(k=1)^n) m_k) = (display(sum_(k=1)^n) m_k x_k)/(display(sum_(k=1)^n) m_k)
    $,
  )
  is called the system's *center of mass*. In other words, the moment divided by the total mass is the center of mass.
]
#example[
  Given point masses #auto-alt($m_1=8, m_2=4, " and " m_3=7$) located on the #xaxis at #auto-alt($a_1=3, x_2=-1, " and " x_3=6$), respectively, find the moment of the system about the #yaxis, and the center of mass.
]
#my-solution-block[
  The moment about the #yaxis is
  #auto-alt(
    $
      M = sum_(k=1)^3 m_k x_k = 8(3) + 4(-1) + 7(6) = 62.
    $,
  )
  The total mass is #auto-alt($m=8+4+7=19$).
  So the center of mass is at
  #auto-alt(
    $
      overline(x) = M/m=62/19.
    $,
  )
]

=== 2-Dimensional Moment and Center of Mass for Point Masses
Now we move to looking at point masses on a plane (instead of on a line). Consider the moments about the #xaxis and #yaxis for objects in two dimensions (and also #inline_eq($z"-axis"$, "z axis") if in 3-D).

#figure(image("figures/2dpointmasses.svg", alt: "Sketch of 3 points on a plane"))

Let #inline_eq($P_1=(x_1,y_1)$, "p 1 equals the point x 1 comma y 1"), #inline_eq($P_2_=(x_2_,y_2)$, "p 2 equals the point x 2 comma y 2"), and #inline_eq($P_3=(x_3,y_3)$, "p 3 equals the point x 3 comma y 3").

Then, how far is #auto-alt($P_1$) away from the #xaxis? It is #auto-alt($y_1$) away from the #xaxis! (Justify to yourself why the distance is the #acc("y") value and not the #acc("x") value of the point)

How far is #auto-alt($P_1$) away from the #yaxis? It is #auto-alt($x_1$) away from the #yaxis!

We can then think about the moment in the #acc("x") direction separate from the moment in the #acc("y") direction!

#definition[Moments in 2-D][
  The *total moment of the system about the #xaxis* is
  #auto-alt(
    $
      M_x = sum_(k=1)^n m_k y_k.
    $,
  )
  The *total moment of the system about the #yaxis* is
  #auto-alt(
    $
      M_y = sum_(k=1)^n m_k x_k.
    $,
  )
  The *center of mass for the system* is #inline_eq($(overline(x),overline(y))$, "the point x bar comma y bar") where
  #auto-alt(
    $
      overline(x) = (M_y)/(display(sum_(k=1)^n) m_k) = (display(sum_(k=1)^n) m_k x_k)/(display(sum_(k=1)^n) m_k) \
      overline(y) = (M_x)/(display(sum_(k=1)^n) m_k) = (display(sum_(k=1)^n) m_k y_k)/(display(sum_(k=1)^n) m_k) \
    $,
  )
]

#example[
  Suppose #auto-alt($m_1=1$) is located at #inline_eq($(2,3)$, "the point 2 comma 3"), #auto-alt($m_2=3$) is located at #inline_eq($3,-4$, "the point 3 comma negative 4"), and #auto-alt($m_3=4$) is located at #inline_eq($(-3,1)$, "the point negative 3 comma 1"). Calculate the moments #auto-alt($M_x " and " M_y$) and find the center of mass of the system.
]

#warning-block[
  #auto-alt($M_x$) is the moment about the #xaxis, meaning we are asking how far the points are from the #xaxis and use the #acc("y") values of the points for this! It gives the #acc("y") value of the center of mass point!

  The opposite is true for #auto-alt($M_y$).
]

#my-solution-block[
  First
  #auto-alt(
    $
      M_x = sum_(k=1)^3 m_k y_k = 1(3) + 3(-4) + 4(1) = -5
    $,
  )
  and
  #auto-alt(
    $
      M_y = sum_(k=1)^3 m_k x_k = 1(2) + 3(3) + 4(-3) = -1.
    $,
  )
  The total mass is #auto-alt($m=1+3+4=8$). Then
  #auto-alt(
    $
      overline(x) & = M_y/m = -1/8 \
      overline(y) & = M_x/m = -5/8 \
    $,
  )
  So, the center of mass is at #inline_eq($(-1/8,-5/8)$, "the point negative one eighth comma negative 5 eighths").
]

=== Center of Mass of a Lamina
#definition[
  A solid flat object, called a *lamina*, of uniform density #acc("rho") which occupies a region #mathcalR of the plane, has a center of mass called the *centroid* of #mathcalR.
]

How do we find the centroid of a lamina?

Suppose we have a simple region #mathcalR defined under the curve #auto-alt($f(x)$) between #acc("a") and #acc("b"). Then using our usual method of taking finite sums to approximate what we want and taking the limit we cut the interval up into #acc("n") sub-intervals with width #auto-alt($Delta x$) and height #auto-alt($f(x_i)$) where #auto-alt($x_i$) is the value between each sub-interval. Then the mass of each strip is
//todo picture
#auto-alt(
  $
    "mass" & = "density" dot "area" \
       m_i & = rho A(x_i) \
       m_i & = rho f(x_i) Delta x
  $,
)
The moment about the #xaxis (and remembering to think about how far away from the #xaxis things are uses #acc("y") values, and how the strip is kind of like a point mass at the half of the height) is
#auto-alt(
  $
    M_x approx sum_(i=1)^n m_i y_i & = sum_(i=1)^n (rho f(x_i) Delta x) (1/2 f(x_i)) \
                                   & = rho/2 sum_(i=1)^n (f(x_i))^2 Delta x \
  $,
)
And taking the limit as #acc("n") goes to infinity we have
#auto-alt(
  $
    M_x & = integral_a^b rho/2 (f(x))^2 dif x
  $,
)
Next, the moment about the #yaxis is
#auto-alt(
  $
    M_y approx sum_(i=1)^n m_i x_i & = sum_(i=1)^n (rho f(x_i) Delta x)(x_i) \
                                   & = rho sum_(i=1)^n (f(x_i) x_i Delta x)
  $,
)
And taking the limit as #acc("n") goes to infinity we have
#auto-alt(
  $
    M_y = integral_a^b rho f(x)x dif x
  $,
)
Lastly, the total mass is what we get from adding up all the #auto-alt($m_i$) and taking the limit as #acc("n") goes to infinity so
#auto-alt(
  $
    m= integral_a^b rho f(x) dif x
  $,
)
For a lamina made up of a region #mathcalR under the curve #auto-alt($f(x)$) on #closedint("a", "b") the centroid is the point
#auto-alt(
  $
    (overline(x),overline(y)) = ((display(integral_a^b) rho f(x)x dif x)/(display(integral_a^b) rho f(x) dif x),"  " (display(integral_a^b) rho/2 (f(x))^2 dif x)/(display(integral_a^b) rho f(x) dif x))
  $,
)

#exercise[
  Suppose we have a lamina of density #auto-alt($rho$) whose shape is defined by the area between two curves. How would we find its centroid?
]
//todo image

#exercise[
  Use the vocabulary we have discussed in this section to describe how Alexander's art in @AlexCalder balances. How might you go about creating a similar piece?
]

#emph-block[
  8.3 Section Summary:
  - We looked at the moments and center of mass of point masses in 1 and 2 dimensions.
  - We extended this idea to the centroid of a continuous mass called a lamina defined by the region under a curve.
]

