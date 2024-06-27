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
Home I/O (@fig-simu-env-homeio) is also made by Real Games. It simulates an House with a lot of domotic. This software have a cheap organization license. Home I/O might also be interesting for ETE students. This software have a REST API for interfaced with all sensor and actuatores. Like Factory I/O, it work quite well on Linux with wine.

== Scenario idea
The scenario would be that the PLC controls the alarm and access system with main door and garage. The garage door could be open by a wireless remote. The Wireless replay attack could be done on this remote. An external presence detector on in front of the main door could be used for the DoS attack. The MitM attacks could be made on the Modbus/TCP communication between the PLC and the alarm system, and the goal would be to deactivate the alarm system.

#figure(
  image("home-io.jpg", width: size-fig.simu-env),
  caption: [Home I/O scene]
) <fig-simu-env-homeio>