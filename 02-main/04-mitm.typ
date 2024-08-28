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

= Simulation Environment
#subject(
  "simu-env/homeio-details",
  heading-offset: 2
)

= Requirements <subj:attack:mitm-requirements>
This scenario centres on a #gls("mitm") attack, where the attacker must position themselves between the communication parties, ensuring that all packets pass through their system. Since Modbus/#gls("tcp") is an #gls("ip")-based protocol, the attacker can utilize a powerful tool called Ettercap (@stack:mitm-ettercap). Ettercap simplifies the execution of an #gls("arp", long: false) poisoning attack.

An #gls("arp", long: true) poisoning attack involves sending fraudulent#gls("arp") messages across the network, tricking the target into associating the #gls("ip") address of another party with the attackers #gls("mac") address, as illustrated in @fig-arp-poisoning.
As a result, the target's packets are sent to the attacker, who can them manipulate these packets before forwarding them (or not) to the intended recipient. This attack occurs at layer 3 of the OSI model #cite(<ISO-OSI_model-74981-1>).

#figure(
  align(center,
    chronos.diagram(arp-spoofing-sync, width: size-fig.arp-poisoning)
  ),
  caption: [#gls("arp", long: false) poisoning],
) <fig-arp-poisoning>

To use Ettercap, the attacker need to know the #gls("ip") address of the controller and the Home I/O simulation. This information can be obtained by sniffing the network using Ettercap itself or other tools such as `Wireshark`, `nmap`, or `hping3`. Once the #gls("ip") addresses are identified, the attacker can initiate the #gls("arp", long: false) poisoning attack with the following command:
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

This command, shown in @code:mitm-ettercap start Ettercap in text mode (`-T`) on the `eth0` network interface (`-i eth0`) and perform an #gls("arp", long: false) poisoning attack (`-M arp`). The #gls("ip") addresses of the controller and the Home I/O simulation are specified by `/IP_CONTROLLER//` and `/IP_HOMEIO//`. An graphical interface is also available but have to be installed as an extra package. 

To execute this attack, `iptables` (@stack:mitm-iptables) will be used to redirect the packet to a python (@stack:mitm-python) script that modifies them in real-time. This script employs the scapy (@stack:mitm-scapy) library, a powerful tool for crafting or decoding packets from a wide range of protocols. The second part of this attack scenario (see on @subj:attack:mitm-modbus-tls) will use a go (@stack:mitm-golang) script.


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
To modify a packet during a Modbus/#gls("tcp") attack, the first step is to establish a #gls("mitm") position. This is achieved using #gls("arp", long: false) poisoning as described in @subj:attack:mitm-requirements. Once the attacker intercepts all the packets, they need to redirect them to a Python (@stack:mitm-python) script for real-time modification. This redirection can be accomplished by configuring iptables (@stack:mitm-iptables) to add rules to the attacker's firewall. The idea is to place all the packets into a queue, enabling the Python script to retrieve and analyse them sequentially. @code:mitm-iptable demonstrates how to use iptables (@stack:mitm-iptables) to enqueue all packets destined for the `192.168.0.0/16` subnet into queue `1`.
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
The packet modifications are carried out using a Python (@stack:mitm-python) script, leveraging the scapy (@stack:mitm-scapy) library.
Scapy is particularly useful for on-the-fly modification.
With Scapy it is straightforward to dissect the different layers of a packet. To extract the #gls("ip") layer, one can use the command ```python scapy_packet = IP(pck.get_payload())```. To check if the packet is #gls("tcp") and retrieve its payload, the command ```python payload = bytes(scapy_packet.payload.payload)``` can be used.

This binary payload contains the Modbus message, which can be inspected and altered as needed. If the destination port is 1502, the packet is from the controller heading to the server. In this case, the attacker should check if the request concerns a door sensor or the motion sensor and then save the transaction ID of this request.

If the source port is 1502, the packet is from the server and is destined for the controller. The attacker should then verify whether the response corresponds to a previously saved transaction ID and, if so, modify the response as necessary.


== Summary
The entire process is summarized in @fig-modbus-tcp-attack.

(1) Initially, under normal conditions, the controller sends a request to the server, the server responds, and the controller triggers the alarm if necessary.

(2) However, when the attacker initiates an #gls("arp") poisoning attack, all packets are routed through the attacker.

(3) This allows the attacker to perform a #gls("mitm") attack and modify the packets in real-time. In this scenario, the controller sends a request to the server, the attacker intercepts and alters the response, and the controller proceeds as if the modified response were legitimate.

#figure(
  align(center,
    chronos.diagram(mitm, width: 100%)
  ),
  caption: [Modbus/TCP attack scenario],
) <fig-modbus-tcp-attack>

= Implement Modbus/TLS <subj:attack:mitm-modbus-tls>
While clear communication can work, it falls short when it comes to security. To safeguard Modbus/#gls("tcp") communication, it is essential to add an encryption layer. Modbus over #gls("tls") is a secure version of Modbus/#gls("tcp"), encrypting the communication between the controller and the server. With Modbus/#gls("tls") in place, the attacker is unable to intercept and modify the packets in real-time, as they are protected by encryption.

== Closer look on TLS <subj:crypto:tls>
#subject(
  "crypto/tls",
  heading-offset: 3
)



= Conclusion
