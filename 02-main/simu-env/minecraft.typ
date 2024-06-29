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
Another suitable approach would be to use the Electrical Age world of Minecraft (@fig-simu-env-minecraft-eln-world) which was previously utilized in a Telecommunication course. The goal of this lab was to control a Factory and an energy system to maximize production. Continuing this lab could provide valuable opportunities for students to explore and secure communication systems. In Minecraft, security can be implemented using Open Computers or by creating an extension mod for Modbus over #gls("tls"), which might be simpler than using Lua with Open Computers.

#figure(
  image("minecraft-eln-world.png", width: size-fig.simu-env),
  caption: [Minecraft Electrical Age scene]
) <fig-simu-env-minecraft-eln-world>

== Scenario idea
The scenario involves reusing the #gls("plc") from the previous lab, which controls various operations. A physical #gls("hmi") could be constructed to manage the factory and coal production, similar to the HTLM interface used in the previous lab. A wind wireless sensor could be added to the setup. Wireless replay and #gls("dos") attack could be targeting this sensor. The #gls("mitm") attacks could be executed on the Modbus/#gls("tcp") communication between the #gls("plc") and the Factory, with the goal of gaining control over the Factory operations.