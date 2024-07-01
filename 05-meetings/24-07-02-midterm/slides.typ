#import "/00-templates/helpers.typ": *

#show: doc => slide_template(
  title: title,
  subtitle: subtitle + [#v(0.1%) #strong("Mid-term presentation")],
  authors: author.name,
  date: datetime(year: 2024, month: 07, day: 02),
  duration: 10,
  //fade: false,
  handout: false,
  doc,
)

//#set text(size: 20pt)

#slide(title: [This thesis])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    //#polylux-outline()
    #one-by-one[][
      - Labo OT Security - I6
    ][
      
      - 3-4 security scenarios
    ][
      
      - Industrial partner training
    ]
  ][
    //#image("/04-resources/placeholder.svg", width: 100%)
  ]

  #pdfpc.speaker-note(
    ```md
    - 
    ```
  )
]

//-----------
//- ATTACKS -
//-----------
#new-section-slide("Attacks")

#slide(title: [Replay])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[][
      
      - On wireless
    ][

      - On physical layer
    ]
  ][
    #align(center,image("/02-main/attacks/replay.png", width: 90%))
  ]
]

#slide(title: [#gls("dos", long: true)])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[][
      - Too many request
    ][
      
      - Overload controller not network
    ][
      
      - Valid request
    ]
  ][
    #align(center,image("/02-main/attacks/dos.svg", width: 60%))
  ]
]

#slide(title: [#gls("mitm", long: true)])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[][
      - Intercept, modified or inject
    ][
      
      - 2 phases
    ]
  ][
    #align(
      center,
      [
      //#image("/02-main/attacks/mitm-connected.png", width: 55%)
      //#image("/02-main/attacks/mitm-full.png", width: 55%)
      ]
    )
  ]
]

#slide(title: [#gls("mitm") - connected])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[][
      - Unsecure communication
    ][
      
      - Send fake message
    ][

      - Encryption with symetric key (#gls("d-h"))
    ]
  ][
    #align(center, image("/02-main/attacks/mitm-connected.png", width: 80%))
  ]
]

#slide(title: [#gls("mitm") - full interception])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[][
      - From #gls("d-h")
    ][
      
      - Impersonnate key
    ][

      - Use modbus over #gls("tls", long: false)
    ]
  ][
    #align(center,image("/02-main/attacks/mitm-full.png", width: 80%))
  ]
]


//--------------
//- SIMULATION -
//--------------
#new-section-slide("Simulation environment")

#slide(title: [Other choices])[
  #set text(
    size: larger
  )
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    == Factory I/O
    #align(left, image("/02-main/simu-env/factoryio-palletizer.png", height: 55%))
    #pause
    - Simulation of a factory
    #pause
    - Realistic
    #pause
    - Some scenes already prepared
    #pause
  ][
    == Minecraft
    #align(left, image("/02-main/simu-env/minecraft-eln-world.png", height: 55%))
    #pause
    - Simulation of anything
    #pause
    - Cross platforms
    #pause
    - Security in Open Computer
    
  ]
]

#slide(title: [Home I/O])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[][
      - House with domotic
    ][
      
      - Also for ETE students
    ][

      - Garage and solar panels by M. Clausen
    ]
  ][
    #align(center,image("/02-main/simu-env/home-io.jpg", width: 100%))
  ]
]


//-----------------
//- COMMUNICATION -
//-----------------
#new-section-slide("Communication media")

#slide(title: [Modbus])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[][
      - RTU - TCP
    ][

      - For Man in the Middle\
        $arrow$ deactivate alarms

      
    ]
  ][
    #align(center,image("/04-resources/img/homeio-alarms.png", width: 100%))
  ]
]

#slide(title: [#gls("wmbus", long: true)])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #pause
    - Use #gls("flipper")

    #pause
    - No frequency hopping

    #pause
    - Europe for meters

    #pause
    - Mode T / mono-directional
  ][
    #pause
    - On electricity meter

    #pause
    #h(1em) Sniff low consumption\
    #h(1em) #h(1em)$arrow.b$\
    #h(1em) Deactivate meter\
    #h(1em) #h(1em)$arrow.b$\
    #h(1em) Replay\
    
  ]
  //#utils.register-section([Attacks])
]

#slide(title: [#gls("dos")])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    - Presence detector
  ][
    #align(center,image("/04-resources/img/homeio-door.png", width: 100%))
  ]
  #utils.register-section([Divers])
]


#slide(title: [Planning])[#include "/04-resources/planning.typ"]

#focus-slide(
  foreground: white,
  background: rgb("#ea366a")
)[
  Questions ?
  #set text(size: 0pt);#include "/03-tail/glossary.typ"
]



