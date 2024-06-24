// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

#let factoryio = (
  price: [\~4300.-],
  security: [by third soft],
  customization: [yes],
  cross-platform: [no]
)

= Factory I/O  <subj:simu-env-factoryio>
#todo([
  This is a realistic simulation software that can be used to simulate a factory. It's expensive (\~4300.- lifetime for 10 students). It's possible to create custom scenes. Factory I/O might be interesting for Power & Control. The software can only communicate with Modbus over TCP. The simulation doesn't include anything about security. It has to be implemented by a third soft that interface with Factory I/O to add a security layer. We tested it on Linux, and it works quite well with wine.

  == Scenario
  The scenario would be that the PLC controls the #link("https://www.youtube.com/watch?v=ZpwXXEYDZsY")[palletizer scene]. A Wireless sensor could indicate the presence of a truck to be loaded. The Wireless replay attack could be done on this sensor. The DoS attack could be done on the same sensor. The MitM attacks could be made on the Modbus/TCP communication between the PLC and the palletizer, and the goal would be to control the clamp.
])