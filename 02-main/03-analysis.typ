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

= Attacks
Attacks in the context of OT security are numerous and can be classified in different categories. This thesis covers some attack as following bust a lot of other exist. 

#subject("attacks/sniffing", heading-offset: 2)
#subject("attacks/spoofing", heading-offset: 2)
#pagebreak()
#subject("attacks/dos", heading-offset: 2)
#subject("attacks/replay", heading-offset: 2)
#subject("attacks/mitm", heading-offset: 2)

#pagebreak()
= Communications medium
Those attacks can be performed on different communication medium. This is an important difference between #gls("it") and #gls("ot"). On #gls("ot") Security, the communication is a very sensible part. During long time, no security was implemented or even possible to be implemented. 

#subject("comm/modbus", heading-offset: 2)
#subject("comm/canbus", heading-offset: 2)

#subject("comm/digimesh", heading-offset: 2)
#subject("comm/zigbee", heading-offset: 2)
#subject("comm/wmbus", heading-offset: 2)

= Simulation environments
#todo([

])

#subject("simu-env/factoryio", heading-offset: 2)
#subject("simu-env/homeio", heading-offset: 2)
#subject("simu-env/minecraft", heading-offset: 2)

= Conclusion
#todo("")
