#import "./../../template_notes.typ": *
#import "@preview/exm:0.1.0": *

#show: template

#set page(
  paper: "us-letter",
  header: align(right)[Name:#blank(150pt, "")],
  // footer: rect(fill: aqua)[Footer],
  number-align: center,
)

#set document(title: "7.5 Integration Techniques Group Work")
#title()

#set document(title: "7.5 Integration Techniques Group Work")

+ #question(ansheight: 270pt)[Compute #auto-alt($display(integral cos(sqrt(x)) dif x)$)][]

+ #question(ansheight: 270pt)[Compute #auto-alt($display(integral (2 tan^3(x))/(cos(x)+ cos(x)cos(2x)) dif x)$)][]

+ #question(ansheight: 270pt)[Compute #auto-alt($display(integral 1/(x+x sqrt(x)) dif x)$)][]

+ #question(ansheight: 270pt)[Compute #auto-alt($display(integral 1/(sqrt(1-x^2)+1-x^2) dif x)$)][]



