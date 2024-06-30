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
Factory I/O, developed by Real Games, is a realistic simulation software designed to emulate a factory environment. It allows for the creation of custom scenes, providing flexibility for various industrial scenarios. 
However, the software comes with an expensive licence, which must be considered when selecting the simulation environment. Factory I/O could also be beneficial for the Power & Control specialization. This software can interface with modbus over #gls("tcp"), but an additional third-party software is required to implement a security layer. While Factory I/O is only available on Windows, it operates effectively on Linux using Wine.

#figure(
  image("factoryio-palletizer.png", width: size-fig.simu-env),
  caption: [Factory I/O palletizer scene]
) <fig-simu-env-factoryio-palletizer>

== Scenario idea
In this scenario, a #gls("plc") could control the #link("https://www.youtube.com/watch?v=ZpwXXEYDZsY")[palletizer scene] (@fig-simu-env-factoryio-palletizer). A wireless sensor could indicate the presence of a truck to be loaded. The wireless replay attack could target this sensor. The #gls("dos") attack could be executed on the same sensor. The #gls("mitm") attack could be conducted on the Modbus/#gls("tcp") communication between the #gls("plc") and the palletizer, with the objective of gaining control over the clamp.