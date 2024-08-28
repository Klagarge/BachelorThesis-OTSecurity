// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

//#pagebreak()
// #show heading.where(level: 1): (it) => {
//   set text(size: huge)
//   set block(above: 1.2em, below: 1.2em)
//   unshift_prefix("", it.body)
// }

//#set page(columns: 2)
//#set text(smaller)
//= Glossary <sec:glossary>
#print-glossary(
  (
    (
      key: "sdg",
      short: "SDG",
      long: "Sustainable Development Goal",
      plural: "SDGs",
      longpural: "Sustainable Development Goals"
    ),
    (
      key: "it",
      short: "IT",
      long: "Information Technology",
      description: [Information Technology (IT) is the use of computers to store, retrieve, transmit, and manipulate data or information.],
    ),
    (
      key: "iot",
      short: "IoT",
      long: "Internet of Things",
      description: [The Internet of Things (IoT) is a system of interrelated computing devices, mechanical and digital machines provided with unique identifiers (UIDs) and the ability to transfer data over a network without requiring human-to-human or human-to computer interaction.],
    ),
    (
      key: "iiot",
      short: "IIoT",
      long: "Industrial Internet of Things",
      description: [The Industrial Internet of Things (IIoT) is the use of Internet of Things (IoT) technologies in manufacturing.],
    ),
    (
      key: "ot",
      short: "OT",
      long: "Operational Technology",
      description: [Operational Technology (OT) is hardware and software that detects or causes a change through the direct monitoring and/or control of physical devices, processes, and events in the enterprise.],
    ),
    (
      key: "ics",
      short: "ICS",
      long: "Industrial Control Systems",
      description: [Industrial Control Systems (ICS) are integrated hardware and software designed to monitor and control the operation of machinery and associated devices in industrial environments.],
    ),
    (
      key: "dos",
      short: "DoS",
      long: "Denial of Service",
      description: [A denial-of-service (DoS) attack is a cyber-attack in which the perpetrator seeks to make a machine or network resource unavailable to its intended users by temporarily or indefinitely disrupting services of a host connected to the Internet.],
      group: "Attacks",
    ),
    (
      key: "ddos",
      short: "DDoS",
      long: "Distributed Denial of Service",
      description: [A distributed #gls("dos") is basically the same as a #gls("dos") attack, but the attack comes from multiple sources.],
      group: "Attacks",
    ),
    (
      key: "mitm",
      short: "MitM",
      long: "Man in the Middle",
      description: [A Man in the Middle (MitM) attack is a form of eavesdropping in which communication between two users is monitored and modified by an unauthorized party.],
      group: "Attacks",
    ),
    (
      key: "d-h",
      short: "Diffie-Hellman",
      description: [Diffie-Hellman key exchange is a method of securely exchanging cryptographic keys over a public channel.],
      group: "Cryptography",
    ),
    (
      key: "x509",
      short: "X.509",
      description: [X.509 is a standard that defines the format of public key certificates.],
      group: "Cryptography",
    ),
    (
      key: "aes",
      short: "AES",
      description: [The Advanced Encryption Standard (AES) is a symmetric encryption algorithm.],
      group: "Cryptography",
    ),
    (
      key: "rtu",
      short: "RTU",
      long: "Remote Terminal Unit",
      group: "Communications",
    ),
    (
      key: "tcp",
      short: "TCP",
      long: "Transmission Control Protocol",
      group: "Communications",
    ),
    (
      key: "ip",
      short: "IP",
      long: "Internet Protocol",
      group: "Communications",
    ),
    (
      key: "crc",
      short: "CRC",
      long: "Cyclic Redundancy Check",
      group: "Communications",
    ),
    (
      key: "can",
      short: "CAN",
      long: "Controller Area Network",
      group: "Communications",
    ),
    (
      key: "mbus",
      short: "M-Bus",
      long: "Meter-Bus",
      group: "Communications",
    ),
    (
      key: "wmbus",
      short: [w#gls-short("mbus")],
      long: [Wireless #gls-short("mbus")],
      group: "Communications",
    ),
    (
      key: "ook",
      short: "OOK",
      long: "On-Off Keying",
      group: "Communications",
      description: [On-Off Keying (OOK) denotes the simplest form of #gls("ask") modulation that represents digital data as the presence or absence of a carrier wave.],
    ),
    (
      key: "ask",
      short: "ASK",
      long: "Amplitude-Shift Keying",
      group: "Communications",
      description: [Amplitude-shift keying (ASK) is a form of modulation in which the amplitude of a carrier wave is varied proportionally to that of a modulating signal.],
    ),
    (
      key: "fsk",
      short: "FSK",
      long: "Frequency-Shift Keying",
      group: "Communications",
      description: [Frequency-shift keying (FSK) is a frequency modulation scheme in which digital information is transmitted through discrete frequency changes of a carrier wave.],
    ),
    (
      key: "2fsk",
      short: "2FSK",
      long: "2-Level Frequency-Shift Keying",
      group: "Communications",
      description: [2-Level Frequency-Shift Keying (2-FSK) is a form of #gls("fsk") modulation that uses two levels of frequency to encode digital data.],
    ),
    (
      key: "4gfsk",
      short: "4GFSK",
      long: "4-Level Gaussian Frequency-Shift Keying",
      group: "Communications",
      description: [4-Level Gaussian Frequency-Shift Keying (4-GFSK) is a form of #gls("fsk") modulation that uses four levels of Gaussian filtering to encode digital data.],
    ),
    (
      key: "2gfsk",
      short: "2-GFSK",
      long: "2-Level Gaussian Frequency-Shift Keying",
      group: "Communications",
      description: [2-Level Gaussian Frequency-Shift Keying (2-GFSK) is a form of #gls("fsk") modulation that uses two levels of Gaussian filtering to encode digital data.],
    ),
    (
      key: "flipper",
      short: "Flipper Zero",
      description: [Flipper Zero is a portable multi-tool for pentesters and geeks in a toy-like body.],
    ),
    (
      key: "plc",
      short: "PLC",
      long: "Programmable Logic Controller",
      plural: "PLCs",
      longplural: "Programmable Logic Controllers",
      description: [A programmable logic controller (PLC) is an industrial digital computer that has been ruggedized and adapted for the control of manufacturing processes, such as assembly lines, robotic devices, or any activity that requires high-reliability control and ease of programming.],
    ),
    (
      key: "tls",
      short: "TLS",
      long: "Transport Layer Security",
      description: [Transport Layer Security (TLS) is a cryptographic protocol that provides communications security over a computer network.],
      group: "Cryptography",
    ),
    (
      key: "hmi",
      short: "HMI",
      long: "Human-Machine Interface",
      description: [A human-machine interface (HMI) is a user interface or dashboard that connects a person to a machine, system, or device.],
    ),
    (
      key: "arp",
      short: "ARP",
      long: "Address Resolution Protocol",
      description: [The Address Resolution Protocol (ARP) is a communication protocol used for discovering the link layer address, such as a MAC address, associated with a given internet layer address, typically an IPv4 address.],
    ),
    (
      key: "mac",
      short: "MAC",
      long: "Media Access Control",
      description: [A media access control address (MAC address) is a unique identifier assigned to a network interface controller (NIC) for use as a network address in communications within a network segment.],
    ),
    (
      key: "pen",
      short: "Pen-Testing",
      long: "Penetration Testing",
      description: [Penetration testing, also known as pen testing, is a simulated cyber attack against your computer system to check for exploitable vulnerabilities.],
    ),
    (
      key: "ca",
      short: "CA",
      long: "Certificate Authority",
      description: [A certificate authority (CA) is an entity that issues digital certificates.],
      group: "Cryptography",
    ),
    (
      key: "https",
      short: "HTTPS",
      long: "Hypertext Transfer Protocol Secure",
      description: [Hypertext Transfer Protocol Secure (HTTPS) is an extension of the Hypertext Transfer Protocol (HTTP). HTTP is an application protocol for distributed, collaborative, hypermedia information systems. HTTPS is used for secure communication over a computer network and is widely used on the Internet.],
      group: "Communications",
    )

  ),
  // show all term even if they are not referenced, default to true
  show-all: false,
  // disable the back ref at the end of the descriptions
  disable-back-references: false,
  
)
