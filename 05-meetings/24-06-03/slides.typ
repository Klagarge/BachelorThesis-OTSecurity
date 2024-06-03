#import "../../00-templates/helpers.typ": *

#show: doc => slide_template(
  title: title,
  subtitle: [Presentation and choice of attack scenarios],
  authors: author.name,
  date: datetime(year: 2024, month: 06, day: 03),
  //duration: 10,
  handout: true,
  doc,
)


#new-section-slide("OT attacks")

#slide(
  title: [Sniffing]
)[
  #side-by-side(gutter: 3mm, columns: (1.5fr, 1fr))[
    #one-by-one[
      - Intercept packets and analyze them
    ][
      - For other attacks or industrial spying
    ][
      - Wifi usually with password
        - Or assume password is known
    ][
      SOL : Use encryption like modbus over #underline("TLS")
    ]
  ][
    #image("sniffing.png", width: 100%)
  ]
  

  //#pdfpc.speaker-note("This is a note that only the speaker will see.")
]

#slide(
  title: [Spoofing]
)[
  #one-by-one[
    - Create a fake WiFi hotspot
  ][
    - Easy way for do a get information for succed a MitM
  ][
    - More IT world
  ]
]

#slide(
  title: [DoS]
)[
  #side-by-side(gutter: 3mm, columns: (1.5fr, 1fr))[
    #one-by-one[
      - Denial of Service
    ][
      - Spam or Ping of Death
    ][
      - DDoS more IT world
    ][
      SOL : Ban IP by the transport layer (or lower)
    ]
  ][
    #image("mallory-connect.png", width: 100%)
  ]
]

#slide(
  title: [Replay attack]
)[
  #side-by-side(gutter: 3mm, columns: (1.5fr, 1fr))[
    #one-by-one[
      - Replay a packet
    ][
      - Need sniffing
    ][
      - Understand or not the packet
    ][
      SOL : Add a signed timestamp \
      SOL : Rolling code
    ]
  ][
    #image("eve.png", width: 100%)
  ]
]

#slide(
  title: [Man in the middle - Connected]
)[
 #side-by-side(gutter: 3mm, columns: (1.5fr, 1fr))[
    #one-by-one[
      - Send custom packets
    ][
      - Better with sniffing
    ][
      SOL : Use encryption with symetric key. Keys exchange with #underline("Diffie-Hellman")
    ]
  ][
    #image("mallory-connect.png", width: 100%)
  ]
]

#slide(
  title: [Man in the middle - Full interception]
)[
 #side-by-side(gutter: 3mm, columns: (1.5fr, 1fr))[
    #one-by-one[
      - Send custom packets
    ][
      - Intercept everything
    ][
      - Better with sniffing
    ][
      SOL : Use encryption like modbus over #underline("TLS")
    ]
  ][
    #image("mallory-middle.png", width: 100%)
  ]
]

/*
#slide(
  title: [Communication means available]
)[
  #line-by-line[
  - Modbus over RS232
  - Modbus over RS485
  - Modbus over TCP on Ethernet
  - Modbus over TCP on WiFi
  - 862 MHz
  ]
]
*/

#slide(
  title: [Attack scenarios]
)[
  #line-by-line[
  - DoS by external sensor (external temp by example)
  - Wireless Replay attack (433-868 MHz)
  - Man in the middle on Modbus over TCP
  - Man in the middle on Modbus over TCP with standard encryption
  ]
]

#new-section-slide("Simulation environnement")

#slide(
  title: [Factory I/O]
)[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[
      - Simulation of a factory
    ][
      - Realistic
    ][
      - No integreted security
    ]
    
  ][
    #image("factoryio-palletizer.png", width: 100%)
  ]
]

#slide(
  title: [Minecraft]
)[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[
      - Simulation of anything
    ][
      - Cross platforms
    ][
      - Security in Open Computer
    ]
    
  ][
    #image("minecraft-eln.jpg", width: 100%)
  ]
]

#slide(
  title: [Planning]
)[
  #set text(
    size: small
  )
  #include "../../04-resources/00-planning-initial.typ"
]
