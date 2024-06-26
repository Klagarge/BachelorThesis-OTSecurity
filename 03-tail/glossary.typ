// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

#pagebreak()
// #show heading.where(level: 1): (it) => {
//   set text(size: huge)
//   set block(above: 1.2em, below: 1.2em)
//   unshift_prefix("", it.body)
// }

= Glossary <sec:glossary>
#print-glossary(
  (
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
      description: [Operational Technology (OT) is hardware and software that detects or causes a change through the direct monitoring and/or control of physical devices, processes and events in the enterprise.],
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

  ),
  // show all term even if they are not referenced, default to true
  show-all: false,
  // disable the back ref at the end of the descriptions
  disable-back-references: false,
)
