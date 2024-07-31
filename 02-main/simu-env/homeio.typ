// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

#let homeio = (
  price: [\~300.-],
  security: [by third soft],
  customization: [no],
  cross-platform: [no]
)

= Home I/O  <subj:simu-env-homeio>
Home I/O is also developed by Real Games and simulates a House (#label("fig-simu-env-homeio")) equipped with extensive home automation features. This software is available at a lower organizational licence cost and could be of interest to ETE students. Home I/O offers a REST API for interfacing with all sensors and actuators. Similar to Factory I/O, it runs well on Linux using Wine.

#figure(
  image("home-io.jpg", width: size-fig.simu-env),
  caption: [Home I/O scene]
) <fig-simu-env-homeio>

== Scenario idea
In this scenario, a #gls("plc") manages the alarm and access systems, including the main door and garage. The garage door can be opened using a wireless remote, which could be the target of a wireless replay attack. An external presence detector on the main door could be used for the #gls("dos") attack. #gls("mitm") attacks could be executed on the Modbus/#gls("tcp") communication between the PLC and the alarm system, aiming to deactivate the alarm system.