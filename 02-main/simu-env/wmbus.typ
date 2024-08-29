// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
}
// END OF HEADER


#let body = [
  The orginial idea was to do a replay attack on a #gls("wmbus") system as shown on @fig:simu-env-wmbus-implementation.
  A real world situation could be a malicious person recording the data emitted by an electrical meter during two weeks of holidays. Then they could replay thoses weeks to reduce their electrical bill.
]

#let fig = [
  #figure(
    image("/02-main/simu-env/wmbus_implementation.drawio.svg", width: 5.5cm),
    caption: [Replay scenario implementation]
  ) <fig:simu-env-wmbus-implementation>
]

#wrap-content(
  fig,
  body,
  align: top + right,
)