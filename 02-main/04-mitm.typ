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

#import "/02-main/attacks/mitm/chronos-drawings.typ": *

// Vue d'enssemble de home io, description, plan, hall, porte et capteur, automate
// Exigence de mitm, modification sans détection
// Comment fonctionne Modbus
// 2 étapes sans chiffrement, puis certificat

// 1. TCP
// comment fonctionne TCP
// Stack
// on the fly
// 

= Simulation Environnement
#subject(
  "simu-env/homeio-details",
  heading-offset: 1
)

= Requirements
#todo[
  - Exigence de mitm
  - Modification sans détection
  - Comment fonctionne Modbus
  - 2 étapes sans chiffrement, puis certificat
]
This scenario is based on a #gls("mitm") attack, the attacker must adopt a man-in-the-middle position. In other words, all packets must pass through it. For that, the attacker can use a nice tool named Ettercap (@stack:mitm-ettercap). This tool allowed you to performed easily and #gls("arp", long: false) poisoning attack.

An #gls("arp", long: true) poisoning attack involves to send fake #gls("arp") message over the network. These message tell the target that the IP adress of other party is located at the attacker's #gls("mac") address like shown on @fig-arp-poisoning. The packets are then sent to the attacker, who can manipulate them before sending them back (or not) to the legitimate recipient.

#figure(
  align(center,
    chronos.diagram(arp-spoofing-sync, width: 80%)
  ),
  caption: [#gls("arp", long: false) poisoning],
) <fig-arp-poisoning>

To use Ettercap, the attacker must know the IP address of the controller and the home io. It can be done by sniffing the network directly with Ettercap or tool like `Wireshark`, nmap, hping3, etc. Once the IP addresses are known, the attacker can launch the following command to start the #gls("arp", long: false) poisoning attack :
#[
  #figure(
    align(left,
      ```bash
      ettercap -T -i eth0 -M arp /IP_CONTROLLER// /IP_HOMEIO//
      ```
    ),
    caption: [Ettercap command],
  ) <code:mitm-ettercap>
]

This command in @code:mitm-ettercap start Ettercap in text mode (`-T`) on the interface eth0 (`-i eth0`) and perform an #gls("arp") poisoning attack (`-M arp`). The IP addresses of the controller and the home io are given by `/IP_CONTROLLER//` and `/IP_HOMEIO//`. An graphical interface is also available but have to be installed as an extra package. 


== Tools
Here are all the tools that are used for this scenario : 
#import "/04-resources/stack/stack.typ" as stack
#[
  #set text(size: 9pt)
  #table(
    columns: 7,
    stroke: none,
    align: center + horizon,
    (stack.fig.kali)(size-fig.stack-mitm, "mitm-kali"),
    //(stack.fig.wireshark)(size-fig.stack-mitm, "mitm-wireshark"),
    (stack.fig.ettercap)(size-fig.stack-mitm, "mitm-ettercap"),    
    (stack.fig.iptables)(size-fig.stack-mitm, "mitm-iptables"),
    (stack.fig.python)(size-fig.stack-mitm, "mitm-python"),
    (stack.fig.scapy)(size-fig.stack-mitm, "mitm-scapy"),
    (stack.fig.golang)(size-fig.stack-mitm, "mitm-golang"),
  )
]
#(stack.def.kali)(<stack:mitm-kali>)
//#(stack.def.wireshark)(<stack:mitm-wireshark>)
#(stack.def.ettercap)(<stack:mitm-ettercap>)
#(stack.def.iptables)(<stack:mitm-iptables>)
#(stack.def.python)(<stack:mitm-python>)
#(stack.def.scapy)(<stack:mitm-scapy>)
#(stack.def.golang)(<stack:mitm-golang>)

== Closer look on Modbus
#todo[
  - Request-Response
  - Modbus TCP
  - 
]

= Attack on Modbus/TCP
== Closer look on TCP
== Modify packet on the fly

= Implement Modbus/TLS
== Closer look on TLS
#todo([
  - encryption
  - certificat
  - handshake
  - 
])


