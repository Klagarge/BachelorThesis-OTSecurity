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
Factory I/O is made by Real Games. It's a realistic simulation software that can be used to simulate a factory. It's possible to create custom scenes. This software have an expensive license that as to be considered for choosen the simulation environment. Factory I/O might be also interesting for Power & Control. This software can be interfaced with modbus over #gls("tcp") but a third software is needed to add a security layer. The software is only available on Windows, but it works quite well with wine on Linux.

== Scenario idea
A scenario could be that the PLC controls the #link("https://www.youtube.com/watch?v=ZpwXXEYDZsY")[palletizer scene] (@fig-simu-env-factoryio-palletizer). A Wireless sensor could indicate the presence of a truck to be loaded. The Wireless replay attack could be done on this sensor. The DoS attack could be done on the same sensor. The MitM attacks could be made on the Modbus/TCP communication between the PLC and the palletizer, and the goal would be to control the clamp.

#figure(
  image("factoryio-palletizer.png", width: size-fig.simu-env),
  caption: [Factory I/O palletizer scene]
) <fig-simu-env-factoryio-palletizer>