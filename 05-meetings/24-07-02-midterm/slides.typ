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
    - refonte labo OT Security
    - 3e année infotronic
    - x scénario sécurité
    - pour labo et partenaires
    ```
  )
]

//-----------
//- ATTACKS -
//-----------
#new-section-slide("Attacks")
  // #pdfpc.speaker-note(
  //     ```md
  //     - 3-4 scénarios d'attaque
  //     - au moins 1 sans fil
  //     - au moins 1 Modbus
  //     - non sécurisé, attaque, solution
  //     - 3 attaques::
  //     ```
  //   )

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

  #pdfpc.speaker-note(
    ```md
    - Ré-injecter un paquet sans fil
    - Couche physique
    - Pas besoin de comprendre le contenu
    ```
  )
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

  #pdfpc.speaker-note(
    ```md
    - Trop de requêtes
    - Surcharge controller pas réseau
    - Envoi de requêtes valides
    ```
  )
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

  #pdfpc.speaker-note(
    ```md
    - Intercepter, modifier, ré-injecter
    - 2 phases
    ```
  )
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

  #pdfpc.speaker-note(
    ```md
    - Communication non sécurisé
    - Envoyer un faux message
    - Chiffrement avec clé symétrique
    ```
  )
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

  #pdfpc.speaker-note(
    ```md
    - Depuis #gls("d-h")
    - Impersonnification
    - Modbus over #gls("tls")
    ```
  )
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
    #pause
    == Factory I/O
    #align(left, image("/02-main/simu-env/factoryio-palletizer.png", height: 55%))
    // #pause
    // - Simulation of a factory
    // #pause
    // - Realistic
    // #pause
    // - Some scenes already prepared
  ][
    #pause
    == Minecraft
    #align(left, image("/02-main/simu-env/minecraft-eln-world.png", height: 55%))
    // #pause
    // - Simulation of anything
    // #pause
    // - Cross platforms
    // #pause
    // - Security in Open Computer
    
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

  #pdfpc.speaker-note(
    ```md
    - +100 capteur et actionneurs
    - Aussi pour ETE
    - Garage + faux panneaux solaire
    ```
  )
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
    #pause
    #pause
    #align(center,image("/04-resources/img/homeio-alarms.png", width: 100%))
  ]

  #pdfpc.speaker-note(
    ```md
    - Binaire - léger et simple
    - RS232 / RS485
    - Pour la mitm sur alarms
    ```
  )
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

  #pdfpc.speaker-note(
    ```md
    - but flipper -> protocole simple
    - wmbus verstion sans fils du m-bus
    - utilisé en europe pour compteurs
    - mode T - 2GFSK
    - replay sur compteur électrique
    ```
  )
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