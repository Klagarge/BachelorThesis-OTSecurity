<h1 align="center">
  <br>
  <img src="./04-resources/logos/hei-en.svg" alt="HEI Logo Logo" width="300" height="200">
  <img src="./04-resources/logos/synd-light.svg" alt="HEI Logo Logo" width="300" height="200">
  <br>
  Bachelor Thesis - <u>OT Security</u> - Rémi Heredero
  <br>
</h1>

This repo hosts my Bachelor's thesis about OT Security.


# Table of contents

<p align="center">
<a href="#abstract">Abstract</a> • 
<a href="#content-of-the-thesis">Content of the Thesis</a> • 
<a href="#stack">Stack</a> • 
<a href="#credits">Credits</a> • 
<a href="#license">License</a>
</p>

# Abstract
This thesis examines the security of embedded systems in a world where the boundary between IT and OT become increasingly thinner. Traditionally, OT systems were physically isolated to ensure security. However, with the advent of the IoT, these systems are becoming more interconnected, making them more susceptible to cyberattacks.

In response to these evolving challenges, the University of applied Sciences Western Switzerland, HES-SO Valais Wallis overhauled its teaching laboratory dedicated to OT security. This lab will focus on practical, hands-on exercises to help students understand the unique challenges of securing embedded systems.

The primary objective of this thesis was to create realistic attack scenarios for use in these laboratories, with a focus on Modbus communication protocols and wireless systems. These scenarios are designed to help students identify vulnerabilities in OT systems and learn how to secure them effectively.

The thesis centres on two key attacks scenarios. The first is a Man-in-the-Middle attack on Modbus/TCP communication, demonstrating how an attacker can intercept and alter unencrypted messages. This scenario underlines the importance of implementing TLS and verifying digital certificates to mitigate such threats. The second scenario involves a replay attack on a wireless communication system, using the Flipper Zero device to capture and retransmit signals.

# Content of the Thesis

[(Back to top)](#table-of-contents)

- Introduction (P.3-4)
- Impact on Sustainability (P.5)
- Analysis (P.6-14)
  - Attacks (Sniffing, Spoofing, Denial of Service, Replay, Man in the Middle)
  - Communication media (Modbus, wireless M-bus)
  - Simulation environments (Factory I/O, Home I/O, Minecraft)
- Attack by Man in the Middle (P.15-24)
  - Environment and requierements
  - Attack on Modbus/TCP
  - Implementation of TLS
  - Attack on Modbus/TLS
- Attack by Replay (P.25-30)
  - Environment and requierements
  - Attack on Wireless M-Bus
  - Attack on 433MHz transceiver
  - Securits in wireless broadcast isolated device
- Conclusion (P.31-32)

Full report of this thesis available at [06-pdf/OT_Security-Heredero_Remi-FinalReport.pdf](https://github.com/Klagarge/BachelorThesis-OTSecurity/blob/main/06-pdf/OT_Security-Heredero_Remi-FinalReport.pdf)

## Man in the Middle attack
The Man-in-the-Middle (MitM) scenario focuses on intercepting, modifying, and forwarding packets to gain control over a Modbus/TCP installation. This protocol, commonly used in industrial settings, was selected for this thesis because it is widely adopted and fulfils the requirement to demonstrate an attack on it. The MitM attack was chosen due to its prevalence and potential for significant impact. It is a comprehensive attack that encompasses several other techniques, such as sniffing and spoofing through ARP poisoning. This scenario assumes that the attacker has already gained access to the network, enabling them to intercept and manipulate the data packets

Main repo for this part are: 
- [Modbus interface for HomeIO simulation](https://github.com/hei-synd-ot-security/Modbus2HomeIO)
- [Controller for HomeIO simulation](https://github.com/Klagarge/ControllerHomeIo)
- [MitM on Modbus/TCP](https://github.com/Klagarge/MitM-TCP-HomeIO)
- [MitM on Modbus/TLS without certificat verification](https://github.com/Klagarge/MitM-TLS-HomeIO)

## Replay attack
The replay attack scenario involves intercepting and resending a message on a wireless connection to trigger the same effect as the original message, like, for example, a garage door opening remote. This scenario is particularly engaging because it can be easily implemented with the Flipper Zero device, making it more interactive and enjoyable for students to witness a physical attack in action. Additionally, it highlights the significance of wireless attacks, a critical topic in the OT world. This scenario operates at the physical layer, providing a complementary perspective to the MitM scenario.

Main repo for this part is: 
- [Replay on RF433T](https://github.com/Klagarge/Replay-RF433T)

[(Back to top)](#table-of-contents)


# Stack

[(Back to top)](#table-of-contents)
<p align="left">
<a href="https://typst.app/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/typst.png" alt="typst" width="60" height="60"/> </a>
<a href="https://git-scm.com/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/git-scm-icon.svg" alt="git" width="60" height="60"/> </a>
<a href="https://www.kali.org/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/Kali.png" alt="kali linux" width="60" height="60"/> </a>
<a href="https://www.wireshark.org/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/wireshark.png" alt="wireshark" width="60" height="60"/> </a>
<a href="https://www.python.org" target="_blank" rel="noreferrer"> <img src="04-resources/stack/python.svg" alt="python" width="60" height="60"/> </a>
<a href="https://www.rust-lang.org/fr" target="_blank" rel="noreferrer"> <img src="04-resources/stack/rust.png" alt="rust" width="60" height="60"/> </a>
<a href="https://go.dev/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/golang.png" alt="go" width="60" height="60"/> </a>
<a href="https://www.ettercap-project.org/" target="_blank" rel="noreferrer"><img src="04-resources/stack/ettercap.svg" alt="ettercap" width="60" height="60"/> </a>
<a href="https://linux.die.net/man/8/iptables" target="_blank" rel="noreferrer"><img src="04-resources/stack/iptables.png" alt="iptables" width="60" height="60"/> </a>
<a href="https://scapy.net/" target="_blank" rel="noreferrer"><img src="04-resources/stack/scapy-logo.svg" alt="scapy" width="60" height="60"/> </a>
<a href="https://flipperzero.one/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/flipper.svg" alt="flipper zero" width="60" height="60"/> </a>

<a href="https://realgames.co/home-io/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/home-io.png" alt="home io" width="60" height="60"/> </a>
<a href="https://modbus.org/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/modbus.png" alt="modbus" width="188" height="60"/> </a>
<a href="https://radiocrafts.com/technologies/wireless-m-bus-technology-overview/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/wireless-m-bus.png" alt="wireless m-bus" width="80" height="60"/> </a>

</p>

For Go programmation a nice startup is what made [cm0x4D](https://github.com/cm0x4D) for [HEI Synd IIot security course](https://github.com/hei-synd-iiot/golang). You can find it on [https://hei-synd-iiot.github.io/golang/](https://hei-synd-iiot.github.io/golang/)

# Credits

[(Back to top)](#table-of-contents)

* [Rémi Heredero](https://github.com/Klagarge) for the Thesis
* [Yann Sierro](https://github.com/Fastium), [Louis Heredero](https://github.com/LordBaryhobal) for proofreading
* [Silvan Zahno](https://github.com/tschinz) and all guys from [Typst](https://github.com/typst/typst) for the Typst template

# License

[(Back to top)](#table-of-contents)

* The Typst template used is on MIT license.
* Some Typst module are under Apache 2.0 or GPL 3.0
* The content of this Thesis is under GPL 3.0