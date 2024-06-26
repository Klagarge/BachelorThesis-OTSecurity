#import "@preview/cetz:0.2.2": *

#canvas({
  import draw: *
  
  let col = red.darken(20%)
  let step(txt, name, pos) = {
    content(
      pos,
      text(txt, fill: white, weight: "bold", font: "Noto Sans"),
      name: name,
      anchor: "west",
      padding: 5pt,
      frame: "rect",
      stroke: none,
      fill: col
    )
    //on-layer(-1, rect(name + ".north-west", name + ".south-east", fill: col, stroke: none))
  }

  let op(op, name, pos) = {
    content(
      pos,
      text(op, fill: col, weight: "bold", font: "Noto Sans"),
      name: name,
      frame: "circle",
      stroke: col,
      padding: 3pt
    )
  }

  let link(..pts) = {
    line(..pts.pos(), stroke: col, mark: (end: ">", fill: col))
  }

  step("MD5", "md5", (0, 0))
  step("RSA", "rsa", (rel: (1, 0), to: "md5.east"))
  link("md5", "rsa.west")
  op("+", "plus1", (rel: (1, 0), to: "rsa.east"))
  link("rsa", "plus1")

  link((-1, -.5), (-.5, -.5), (-.5, 0), "md5")

  content(
    (-1, -.5),
    text("P", fill: col, weight: "bold", font: "Noto Sans"),
    anchor: "south-west",
    padding: 3pt
  )
})