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
This scenario centres on a #gls("mitm") attack, where the attacker must position themselves between the communication parties, ensuring that all packets pass through their system. Since Modbus/#gls("tcp") is an #gls("ip")-based protocol, the attacker can utilize a powerful tool called *Ettercap* (@stack:mitm-ettercap). Ettercap simplifies the execution of an #gls("arp", long: false) poisoning attack.

An #gls("arp", long: true) poisoning attack involves sending fraudulent#gls("arp") messages across the network, tricking the target into associating the #gls("ip") address of another party with the attackers #gls("mac") address, as illustrated in @fig-arp-poisoning.
As a result, the target's packets are sent to the attacker, who can them manipulate these packets before forwarding them (or not) to the intended recipient. This attack occurs at layer 3 of the OSI model #cite(<ISO-OSI_model-74981-1>).

#figure(
  align(center,
    chronos.diagram(arp-spoofing-sync, width: size-fig.arp-poisoning)
  ),
  caption: [#gls("arp", long: false) poisoning],
) <fig-arp-poisoning>

To use Ettercap, the attacker needs to know the #gls("ip") address of the controller and the Home I/O simulation. This information can be obtained by sniffing the network using Ettercap itself or other tools such as `Wireshark`, `nmap`, or `hping3`. Once the #gls("ip") addresses are identified, the attacker can initiate the #gls("arp", long: false) poisoning attack with the following command:
#[
  #figure(
    align(left,
      ```bash
      ettercap -T -i eth0 -M arp /IP_CONTROLLER// /IP_HOMEIO//
      ```
    ),
    caption: [Start an ARP poisoning with Ettercap],
  ) <code:mitm-ettercap>
]

This command, shown in @code:mitm-ettercap starta Ettercap in text mode (`-T`) on the `eth0` network interface (`-i eth0`) and performs an #gls("arp", long: false) poisoning attack (`-M arp`). The #gls("ip") addresses of the controller and the Home I/O simulation are specified by `/IP_CONTROLLER//` and `/IP_HOMEIO//`. A graphical user interface is also available but has to be installed as an extra package. 

To execute this attack, *Iptables* (@stack:mitm-iptables) will be used to redirect the packet to a *Ppython* (@stack:mitm-python) script that modifies them in real-time. This script employs the *Scapy* (@stack:mitm-scapy) library, a powerful tool for crafting, decoding and encoding packets from / to a wide range of protocols. The second part of this attack scenario (see @subj:attack:mitm-modbus-tls) will use a *Go* (@stack:mitm-golang) script.


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

== Closer look on Modbus <subj:comm:modbus-details>
#subject(
  "comm/modbus-details",
  heading-offset: 2
)

= Attack on Modbus/TCP
To modify a packet during a Modbus/#gls("tcp") attack, the first step is to establish a #gls("mitm") position. This is achieved using #gls("arp", long: false) poisoning as described in @subj:attack:mitm-requirements. Once the attacker is able to intercepts all the packets, they need to redirect them to a *Python* (@stack:mitm-python) script for real-time modification. This redirection can be accomplished by configuring *Iptables* (@stack:mitm-iptables) to add rules to the attacker's firewall. The idea is to place all the packets into a queue, enabling the *Python* script to retrieve and analyse them sequentially. @code:mitm-iptable demonstrates how to use *Iptables* (@stack:mitm-iptables) to enqueue all packets adressed to `192.168.0.0/16` sub-network into queue `1`.
#[
  #figure(
    align(left,
      ```bash
      iptables -I OUTPUT -d 192.168.0.0/16 -j NFQUEUE --queue-num 1
      ```
    ),
    caption: [Put packets on queue 1 with Iptables],
  ) <code:mitm-iptable>
]

#pagebreak()
== Closer look on TCP
#subject(
  "crypto/tcp",
  heading-offset: 3
)
== Modify packet on the flys
Packet modifications are carried out using a *Python* (@stack:mitm-python) script, leveraging the *Scapy* (@stack:mitm-scapy) library.
*Scapy* is particularly useful for on-the-fly modification.
With *Scapy* it is straightforward to dissect the different layers of a packet. To extract the #gls("ip") layer, one can use the statement ```python scapy_packet = IP(pck.get_payload())```. To check if the packet is #gls("tcp") and retrieve its payload, the function ```python payload = bytes(scapy_packet.payload.payload)``` can be used.

This binary payload contains the Modbus message, which can be inspected and altered as needed. If the destination port is 1502, the packet is from the controller heading to the server. In this case, the attacker should check if the request concerns a door sensor or the motion sensor and then save the transaction ID of this request.

If the source port is 1502, the packet is from the server and is destined for the controller. The attacker should then verify whether the response corresponds to a previously saved transaction ID and, if so, modify the response as necessary.

#pagebreak()
== Summary
The entire process is summarized in @fig-modbus-tcp-attack.

(1) Initially, under normal conditions, the controller sends a request to the server, the server responds, and the controller triggers the alarm if necessary.

(2) However, when the attacker initiates an #gls("arp") poisoning attack, all packets are routed through the attacker.

(3) This allows the attacker to perform a #gls("mitm") attack and modify the packets in real-time. In this scenario, the controller sends a request to the server, the attacker intercepts and alters the response, and the controller proceeds as if the modified response was legitimate.

#figure(
  align(center,
    chronos.diagram(mitm, width: 100%)
  ),
  caption: [Modbus/TCP attack scenario],
) <fig-modbus-tcp-attack>

#pagebreak()
= Implement Modbus/TLS <subj:attack:mitm-modbus-tls>
While clear communication can work, it falls short when it comes to security. To safeguard Modbus/#gls("tcp") communication, it is essential to add an encryption layer. Modbus over #gls("tls") is a secure version of Modbus/#gls("tcp"), encrypting the communication between the controller and the server. With Modbus/#gls("tls") in place, the attacker is unable to intercept and modify the packets in real-time, as they are protected by encryption.

== Closer look on TLS <subj:crypto:tls>
#subject(
  "crypto/tls",
  heading-offset: 3
)

= Attack on Modbus/TLS
This thesis demonstrated how easily Modbus/#gls("tcp") packets can be intercepted and modified. However, when Modbus/#gls("tls") is employed, the packets are encrypted, making it seemingly impossible to perform a #gls("mitm") attack to take control of the system. This is only true if every step of the #gls("tls") implementation has been executed correctly.

The thesis also reveals that control can still be compromised if certificates are not properly verified. In test or debugging environments, it is common for certificates not to be signed by a #gls("ca"), rendering them invalid. As a result, certificate verification is often bypassed in such environments. However, it is crucial to ensure that certificates are signed and verified in a production environment. In the #gls("ot") world, it may be advisable for a company to maintain its own internal #gls("ca") to sign all certificates. This makes it easier to install the #gls("ca") on all company devices and ensure proper certificate verification.

To perform a #gls("mitm") attack on a Modbus/#gls("tls") installation that does not check certificates, the attacker must first establish a #gls("mitm") position. This can be done using the same #gls("arp") poisoning attack described in @subj:attack:mitm-requirements. During this thesis, considerable time was spent trying to modify the random values and certificates on the fly. This approach proved difficult because the #gls("tls") handshake (@fig:tls-handshake) must be fully implemented, and there are no tools specifically designed to modify only the #gls("tls") layer in real-time. While many tools exist for performing #gls("mitm") attacks in the #gls("it") world, such as `Burp suite`, `mitmproxy`, or `bettercap`, they are typically focused on the #gls("https") protocol.

A more effective approach would be to handle the entire connection rather than attempting to modify packets on the fly. The attacker can redirect the #gls("tls") traffic from both targets to their own server, where the traffic can be decrypted. To redirect the traffic, `iptables` (@stack:mitm-iptables) can be used, as demonstrated in @code:mitm-iptables-tls.

#[
  #figure(
    align(left,
      ```bash
      iptables -t nat -A PREROUTING -p tcp --dport 5802 -j REDIRECT --to-port 5803
      ```
    ),
    caption: [Redirect traffic to another port with Iptables],
  ) <code:mitm-iptables-tls>
]

This command redirects all #gls("tcp") traffic destined for port `5802` (used for #gls("tls") communication between the controller and Home I/O) to port `5803` (the port where the attacker's server is running).

The attacker can then set up their own Modbus/#gls("tls") server to decrypt the traffic and forward it to the Home I/O simulation. If desired, the attacker can modify the response before forwarding it back to the controller. It is easy to see a trace of such an attack because the attacker has to use a dummy certificate to create the symmetric encryption key. This certificate can be seen with tools like `Wireshark`


= Conclusion
In summary, this chapter has outlined the simulation environment, detailed the tools required for this scenario, and demonstrated how to implement a #gls("mitm") attack on both Modbus/#gls("tcp") and Modbus/#gls("tls") communications.

The thesis focused on a simple system composed of two door sensors and a motion sensor controlling an alarm. The attacker's primary goal was to gain control over this system to open the doors without triggering the alarm. The findings illustrate how easily this can be achieved when no security measures are in place. The attacker only needs access to the local network, which could potentially be obtained by compromising an external sensor.

Additionally, this thesis has shown how implementing Modbus/#gls("tls") can secure the system and highlighted the critical importance of verifying certificates to ensure robust protection.

Finally, with this scenario, many layers of the OSI model have been tackled. Layer 2 and 3 with ARP poisoning, layer 4 with the attack on Modbus/TCP and layer 5 and 6 with the attack on Modbus/TLS.