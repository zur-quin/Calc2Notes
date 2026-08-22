// chapter_5.typ

#import "./../../template_notes.typ": *
#show: template

// set up heading numbering
#set heading(numbering: "1.")
#counter(heading).update(6)
#set document(title: "Section 6.3")
#context counter(heading).step(level: 2)
#context counter(heading).step(level: 2)

// any functions and templating you want for just this chapter can go here


== Volumes by Cylindrical Shells
#emph-block[
  6.3 Learning Objectives:
  - I can use shell method to find the volume of solids of rotation.
  - I can identify scenarios when shell or washer method is required for a problem based on its geometry.
]

#exercise[
  Spend 5-10 minutes trying to set up the integral for using washer method for the following problem. Then stop and analyze why this is particularly difficult.

  Rotate the region enclosed by the #acc("x")-axis and the parabola #math.equation($y = 3x - x^2$, alt: "y equals 3 x minus x squared") around the line #math.equation($x = -1$, alt: "x equals negative 1").
]
#my-solution-block[
  Note the plot of this region below
  #align(center, image("figures/shellmotivation.svg", alt: "todo"))
  helps illustrate the difficulty. Simply put: We have no easy way of determining the radii, #math.equation($r" and "R$, alt: "little r and big r").
]

In the disk and washer method, the cross-sections taken were circular and perpendicular to the axis of rotation. We will introduce a new method, using a new shape for cross-sections, which are taken parallel to the axis of rotation.

Consider the following cookie cutters.
#align(center, image(
  "figures/cookiecutter.jpg",
  alt: "a set of metal circular cookie cutters of varying sizes, all stacked within one another.",
  width: 45%,
))

For the next method, we will think of finding the area of a concentric shells making up the shape, then integrating from the center of the shells to the edge to "add" up all the areas that go into the volume.



#emph-block[
  6.3 Section Summary:
]

