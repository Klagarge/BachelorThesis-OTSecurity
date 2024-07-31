// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

#let minecraft = (
  price: [-],
  security: [Open Computer \ or new mod],
  customization: [full],
  cross-platform: [yes]
)

= Minecraft  <subj:simu-env-minecraft>
Another suitable approach would be to use the Electrical Age world in Minecraft (#label("fig-simu-env-minecraft-eln-world")) which was previously featured in the Telecommunication course. The goal of this lab was to control a factory and energy system to maximize production. Continuing this laboratory could provide valuable opportunities for students to explore and secure communication systems. In Minecraft, security can be implemented using the Open Computers mod or by creating an extension mod for Modbus over #gls("tls"), which might be simpler than using Lua with Open Computers.

#figure(
  image("minecraft-eln-world.png", width: size-fig.simu-env),
  caption: [Minecraft Electrical Age scene]
) <fig-simu-env-minecraft-eln-world>

== Scenario idea
The scenario involves reusing the #gls("plc") from the previous lab, which controls various operations. A physical #gls("hmi") could be constructed to manage the factory and coal production, similar to the HTML interface used in the previous lab. A wind wireless sensor could be added to the setup. Wireless replay and #gls("dos") attacks could target this sensor. #gls("mitm") attacks could be executed on the Modbus/#gls("tcp") communication between the #gls("plc") and the factory, with the goal of gaining control over the factory's operations.