// template_notes.typ


// theorem and example and definition blocks
#import "@preview/theorion:0.6.0": *
// #import cosmos.simple: *
#import cosmos.fancy: *
// #import cosmos.rainbow: *
// #import cosmos.clouds: *
// #show: show-theorion

// Create a tip block with green styling and light bulb icon
// Useful for helpful suggestions and tips
#let my-solution-block = note-block.with(
  fill: rgb("#1A7F37"),
  title: theorion-i18n-map.at("solution"),
  icon-name: "key",
)


// next package:
#import "@preview/diverential:0.3.0": *


#let acc(letter) = {
  math.equation(eval("$" + letter + "$"), alt: letter, block: false)
}


// put under imports
#let template = doc => {
  set page(header: "Math 1226 Completed Notes")
  show: show-theorion
  doc
}
