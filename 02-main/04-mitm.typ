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

= Simulation Environnement
#subject(
  "simu-env/homeio-details",
  heading-offset: 2
)

= Requirements <subj:attack:mitm-requirements>
This scenario is based on a #gls("mitm") attack, the attacker must adopt a man-in-the-middle position. In other words, all packets must pass through it. As Modbus/#gls("tcp") is an #gls("ip") based protocol, the attacker can use a nice tool named Ettercap (@stack:mitm-ettercap). This tool allowed you to performed easily and #gls("arp", long: false) poisoning attack.

An #gls("arp", long: true) poisoning attack involves to send fake #gls("arp") message over the network. These message tell the target that the IP adress of other party is located at the attacker's #gls("mac") address like shown on @fig-arp-poisoning. The packets are then sent to the attacker, who can manipulate them before sending them back (or not) to the legitimate recipient. This attack take place at layer 3 of the OSI model #cite(<ISO-OSI_model-74981-1>).

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
      sudo ettercap -T -i eth0 -M arp /IP_CONTROLLER// /IP_HOMEIO//
      ```
    ),
    caption: [Start an ARP poisoning with Ettercap],
  ) <code:mitm-ettercap>
]

This command in @code:mitm-ettercap start Ettercap in text mode (`-T`) on the interface eth0 (`-i eth0`) and perform an #gls("arp") poisoning attack (`-M arp`). The IP addresses of the controller and the home io are given by `/IP_CONTROLLER//` and `/IP_HOMEIO//`. An graphical interface is also available but have to be installed as an extra package. 

To perform this attack, the iptables (@stack:mitm-iptables) will also be used to redirect packet to a python script (@stack:mitm-python) that will modify the packet on the fly. The python script will use the scapy (@stack:mitm-scapy) library to modify the packet. The scapy library is a powerful tool that can be used to craft or decode packets of a wide number of protocols. The second part of this attack (see on @subj:attack:mitm-modbus-tls) will use a go (@stack:mitm-golang) script.


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
// #(stack.def.kali)(<stack:mitm-kali>)
// //#(stack.def.wireshark)(<stack:mitm-wireshark>)
// #(stack.def.ettercap)(<stack:mitm-ettercap>)
// #(stack.def.iptables)(<stack:mitm-iptables>)
// #(stack.def.python)(<stack:mitm-python>)
// #(stack.def.scapy)(<stack:mitm-scapy>)
// #(stack.def.golang)(<stack:mitm-golang>)

== Closer look on Modbus <subj:comm:modbus-details>
#subject(
  "comm/modbus-details",
  heading-offset: 2
)

= Attack on Modbus/TCP
To modify a packet, the first step is to be on a #gls("mitm") position. This is done by using #gls("arp", long: false) poisoning as describe in @subj:attack:mitm-requirements. Once the attacker get all packets, they have to be redirect to the Python (@stack:mitm-python) script for modification on the fly. To do that the attacker can use iptable to add a rules on his firewall. The idea is to put all the packets on a queue so that the Python script can retrieve and analyse them one by one. @code:mitm-iptable show how to use iptable (@stack:mitm-iptables) to put on queue `1` all packet destinated to the subnet `192.168.0.0./16`.
#[
  #figure(
    align(left,
      ```bash
      sudo iptables -I OUTPUT -d 192.168.0.0/16 -j NFQUEUE --queue-num 1
      ```
    ),
    caption: [Put packets on queue 1 with Iptables],
  ) <code:mitm-iptable>
]


== Closer look on TCP
#subject(
  "crypto/tcp",
  heading-offset: 3
)
== Modify packet on the fly
Modifications are proceed with a Python (@stack:mitm-python) script. This script will use the scapy (@stack:mitm-scapy) library to modify the packet. The scapy library is a powerful tool that can be used to craft or decode packets of a wide number of protocols.
Scapy is really usefull to modify packet on the fly. With this library, it's easy to separate layers on the packet. To get the IP content of the IP layer, simply use ```python  scapy_packet = IP(pck.get_payload())```. Check if it's #gls("tcp") and get the #gls("tcp") payload with ```python  payload = bytes(scapy_packet.payload.payload)```. 

This binary payload is the modbus message that can be checked and modified if needed. If the port is 1502, the message come from the controller and go to the server. This mean the attacker should only look if it is a request about a door sensor or the motion sensor. If it is, the attacker must save the transaction id of this request. 

If the source port is 1502, the message come from the server and go to the controller. This mean the attacker should only look if it is a response about a previous transaction id saved. If it is, the attacker can look the response and modify it if needed.

= Implement Modbus/TLS <subj:attack:mitm-modbus-tls>
== Closer look on TLS
#todo([
  - encryption
  - certificat
  - handshake
  - 
])

= Conclusion
