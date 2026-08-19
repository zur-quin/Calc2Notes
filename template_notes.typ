// template_notes.typ


// theorem and example and definition blocks
#import "@preview/theorion:0.6.0": *
// #import cosmos.simple: *
// #import cosmos.fancy: *
// #import cosmos.rainbow: *
// #import cosmos.clouds: *
// #show: show-theorion

#let theorem(..args) = context {
  if target() == "paged" {
    import cosmos.fancy: *
    theorem(..args)
  } else {
    import cosmos.clouds: *
    theorem(..args)
  }
}

#let exercise(..args) = context {
  if target() == "paged" {
    import cosmos.fancy: *
    exercise(..args)
  } else {
    import cosmos.clouds: *
    exercise(..args)
  }
}

#let corollary(..args) = context {
  if target() == "paged" {
    import cosmos.fancy: *
    corollary(..args)
  } else {
    import cosmos.clouds: *
    corollary(..args)
  }
}

#let property(..args) = context {
  if target() == "paged" {
    import cosmos.fancy: *
    property(..args)
  } else {
    import cosmos.clouds: *
    property(..args)
  }
}

#let example(..args) = context {
  if target() == "paged" {
    import cosmos.fancy: *
    example(..args)
  } else {
    import cosmos.clouds: *
    example(..args)
  }
}

#let definition(..args) = context {
  if target() == "paged" {
    import cosmos.fancy: *
    definition(..args)
  } else {
    import cosmos.clouds: *
    definition(..args)
  }
}

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
#let coord(xcoord, ycoord) = {
  math.equation(eval("$(" + xcoord + "," + ycoord + ")$"), alt: xcoord + "comma" + ycoord, block: false)
}
#let closedint(a, b) = {
  math.equation(eval("$[" + a + "," + b + "]$"), alt: "the closed interval from " + a + " to " + b, block: false)
}
#let openint(a, b) = {
  math.equation(eval("$(" + a + "," + b + ")$"), alt: "the open interval from " + a + " to " + b, block: false)
}


// put under imports
#let template = doc => {
  set page(header: "Math 1226 Completed Notes")
  show: show-theorion
  doc
}
