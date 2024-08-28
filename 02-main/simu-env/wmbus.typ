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
  Orginial idea was to do a replay attack on a #gls("wmbus") system as shown on @fig:simu-env-wmbus-implementation.
  Like the electrical meter where an attacker measure the power consumption of two weeks of hollidays. Then replay thoses weeks and can optionnaly add some graphical card for mining bitcoins. 
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