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

= Attacks <sec:analysis-attacks>
Attacks in the context of OT security are numerous and can be classified in different categories. This thesis covers some attack as following bust a lot of other exist. 

#subject("attacks/sniffing", heading-offset: 2)
#subject("attacks/spoofing", heading-offset: 2)
#pagebreak()
#subject("attacks/dos", heading-offset: 2)
#subject("attacks/replay", heading-offset: 2)
#subject("attacks/mitm", heading-offset: 2)

#pagebreak()
= Communications medium <sec:analysis-comm>
Those attacks can be performed on different communication medium. This is an important difference between #gls("it") and #gls("ot"). On #gls("ot") Security, the communication is a very sensible part. During long time, no security was implemented or even possible to be implemented. 

#subject("comm/modbus", heading-offset: 2)
//#subject("comm/canbus", heading-offset: 2)

//#subject("comm/digimesh", heading-offset: 2)
//#subject("comm/zigbee", heading-offset: 2)
#subject("comm/wmbus", heading-offset: 2)

= Simulation environments <sec:analysis-simu-env>
As this thesis is part of the preparation of a new laboratory, the simulation environment have to be more than just a abstract communication. The idea is to have a real physical controller and a simulate process. An simulated environment still be necessary as a full physical environment is too expensive and such less flexible that a simulated one.

#subject("simu-env/factoryio", heading-offset: 2)
//#pagebreak()
#subject("simu-env/homeio", heading-offset: 2)
#subject("simu-env/minecraft", heading-offset: 2)

= Conclusion <sec:analysis-conclusion>
This chapter presented some of attacks that can be performed on #gls("ot") systems. The communication medium that were discussed during the preparatory phase of this work were also presented. Finally, the simulation environments that could be used in the laboratory were presented.

With this information, a decision has been made by M. Rieder and M. Clausen for the choice of the simulation environment. The choice was made for Home I/O as it can also be use by ETE students.

The attacks would be a Replay attack on a Wireless control or sensor, a #gls("dos") attack on an external sensor with valid data (surcharged the controller, not the communication medium) and finally a #gls("mitm") attack on the Modbus/TCP communication. This last attack would be in two phase. The first one will be performed on a basic Modbus/TCP communication without any encryption. The second one will be performed on a Modbus/TCP communication with encryption with symetrical key exchanged by #gls("d-h").

The wired communication will be done on a Modbus as it is a very common protocol in #gls("ot") systems. It was part of the brief for this Thesis.

For the Replay attack on a wireless control or sensor, the idea is to use the #gls("flipper") to record a message and replay it. This attack will be perform only on physical layer. The #gls("flipper") can only perform this type of attack on a very basic wireless protocol. This device is not able to perform replay attack on a frequency hopping protocol. The wireless protocol must have a modulation #gls("ook"), #gls("ask") (270 or 650 kHz of Banwith) or 2 #gls("fsk").
It's why some protocol like Zigbee or DigiMesh can't be used for this attack and have not been explored in depth.

#gls("wmbus") is a single canal #gls("2gfsk") protocol that can be perfect for replay attack with #gls("flipper"). As a typical #gls("wmbus") T-mode application is an electricity or water meter, it could be relevant to have thi type of meter in the simulation, which will be the target of the replay attack.\
If the #gls("wmbus") implementation will be too difficult, a plan B can be considered based on a simple #gls("ook") modulation on 433 MHz. 