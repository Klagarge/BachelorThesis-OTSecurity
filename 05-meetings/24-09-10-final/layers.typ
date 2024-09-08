#let layer(..args) = {
  let c = (
    l1: white,
    l2: white,
    l3: white,
    l4: white,
    l5: white,
    l6: white,
    l7: white,
  )
  
  for arg in args.pos() {
    if arg == 1 {
      c.l1 = gray.lighten(40%)
    } else if arg == 2 {
      c.l2 = gray.lighten(40%)
    } else if arg == 3 {
      c.l3 = gray.lighten(40%)
    } else if arg == 4 {
      c.l4 = gray.lighten(40%)
    } else if arg == 5 {
      c.l5 = gray.lighten(40%)
    } else if arg == 6 {
      c.l6 = gray.lighten(40%)
    } else if arg == 7 {
      c.l7 = gray.lighten(40%)
    }
  }

  table(
    columns: 2,
    rows: 7,
    align: left,
    table.cell(fill: c.l7)[7], table.cell(fill: c.l7)[Application],
    table.cell(fill: c.l6)[6], table.cell(fill: c.l6)[Presentation],
    table.cell(fill: c.l5)[5], table.cell(fill: c.l5)[Session],
    table.cell(fill: c.l4)[4], table.cell(fill: c.l4)[Transport],
    table.cell(fill: c.l3)[3], table.cell(fill: c.l3)[Network],
    table.cell(fill: c.l2)[2], table.cell(fill: c.l2)[Data Link],
    table.cell(fill: c.l1)[1], table.cell(fill: c.l1)[Physical]
  )
}

#layer(4, 5)