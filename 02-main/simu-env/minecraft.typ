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
#todo([
  An other good idea would be to use the Electrical age world of Minecraft that was used in 2nd during previous Telecommunication course. The goal of this lab was to control a Factory and an energy system for produce the most as possible. It can be interesting for students to continue this lab to attack / secure the communication. On Minecraft, it is also possible to do security with Open Computer or even create an extension mod in Electrical age for Modbus over TLS (maybe more simple than using Open Computer on Lua).
year with Christopher Metra
  The scenario would be to reuse the PLC made in the last lab that controls everything. It can be interesting to build a physical HMI part that set Factory and Coal production in the same way as the HTML page we had in the last lab. A wind wireless sensor could be added. The Wireless replay attack and DoS attack could be done on this sensor. The MitM attacks could be made on the Modbus/TCP communication between the PLC and the Factory, and the goal would be to control the Factory.
])