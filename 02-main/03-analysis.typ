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
Numerous attacks can occur in the context of OT security and can be classified into different categories. This thesis covers some attack as following, though many others exist. 

#subject("attacks/sniffing", heading-offset: 2)
#subject("attacks/spoofing", heading-offset: 2)
#subject("attacks/dos", heading-offset: 2)
#subject("attacks/replay", heading-offset: 2)
#subject("attacks/mitm", heading-offset: 2)

//#pagebreak()
= Communications medium <sec:analysis-comm>
Different communication mediums are vulnerable to these attacks, highlighting the critical distinction between #gls("it") and #gls("ot") security. In #gls("ot") security, communication is a highly sensitive aspect, and historically, security measures were minimal or non-existent.

#subject("comm/modbus", heading-offset: 2)
//#subject("comm/canbus", heading-offset: 2)

//#subject("comm/digimesh", heading-offset: 2)
//#subject("comm/zigbee", heading-offset: 2)
#subject("comm/wmbus", heading-offset: 2)

= Simulation environments <sec:analysis-simu-env>
As this thesis is part of the preparation of a new laboratory, the simulation environment must extend beyond abstract communication. The objective is to have a real physical controller interfaced with a simulated process. A simulated environment remains necessary because a fully physical setup is prohibitively expensive and far less flexible than a simulated one.

#subject("simu-env/factoryio", heading-offset: 2)
//#pagebreak()
#subject("simu-env/homeio", heading-offset: 2)
#subject("simu-env/minecraft", heading-offset: 2)

= Conclusion <sec:analysis-conclusion>
This section presented various attacks that can be performed on #gls("ot") systems. The communication mediums discussed during the preparatory phase of this work were also outlined. Additionally, potential simulation environments for laboratory use were evaluated.

Based on this information, M.Rieder and M. Clausen have decided on the simulation environment. The chosen platform is Home I/O, as it can be utilized by ETE students.

The planned attacks include a replay attack on a wireless control or sensor, a #gls("dos") attack on an external sensor with valid data (overloading the controller rather than the communication medium) and a #gls("mitm") attack on the Modbus/#gls("tcp", long: false) communication. The #gls("mitm") attack will be conducted in two phases. The first phase will involve an unencrypted Modbus/TCP communication while the second phase will involve encrypted Modbus/#gls("tcp", long: false) communication with symmetrical key exchanged by #gls("d-h").

Wired communication will be carried out using Modbus, a widely used protocol in #gls("ot") systems, which aligns with the brief for this thesis. 

For the Replay attack on a wireless control or sensor, the idea is to use the #gls("flipper") to record and replay a message. This attack will be performed only on the physical layer. The #gls("flipper") can only execute such ab attack on basic wireless protocols, as it cannot perform a replay attack on frequency hopping protocols. The wireless protocol must employ #gls("ook"), #gls("ask") (with 270 or 650 kHz Bandwidth) or #gls("2fsk") modulation.
Consequently, protocols like Zigbee or DigiMesh are not suitable for this attack and were not explored in depth.

#gls("wmbus") is a single canal #gls("2gfsk") protocol, is well-suited for replay attacks using the #gls("flipper"). Given that typical #gls("wmbus") T-mode application include electricity or water meters, incorporating such meters into the simulation would be relevant with a replay attack targeting these devices. \
If the #gls("wmbus") implementation proves it challenging, a contingency plan involves using a simple #gls("ook") modulation at 433 MHz. 