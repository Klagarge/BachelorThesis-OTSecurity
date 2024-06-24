#import "../00-templates/helpers.typ": *

#pagebreak()
= Glossary
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
    )
  ),
  // show all term even if they are not referenced, default to true
  show-all: true,
  // disable the back ref at the end of the descriptions
  disable-back-references: false,
)
