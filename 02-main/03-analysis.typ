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
#todo([
  Attacks in the context of OT security are numerous and can be classified in different categories. The most common attacks are the following:
])

#subject("attacks/sniffing", heading-offset: 2)
#subject("attacks/spoofing", heading-offset: 2)
#subject("attacks/dos", heading-offset: 2)
#subject("attacks/replay", heading-offset: 2)
#subject("attacks/mitm", heading-offset: 2)

= Communication medium
#todo([
  Those attacks can be performed on different communication medium. This is an important difference between #gls("it") and #gls("ot")
])

#subject("comm/modbus", heading-offset: 2)
#subject("comm/canbus", heading-offset: 2)

#subject("comm/digimesh", heading-offset: 2)
#subject("comm/zigbee", heading-offset: 2)
#subject("comm/wmbus", heading-offset: 2)


= Conclusion
#todo("")
