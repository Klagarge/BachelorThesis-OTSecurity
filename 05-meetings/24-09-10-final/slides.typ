#import "/00-templates/helpers.typ": *
#import "./layers.typ": *

#show: doc => slide_template(
  title: title,
  subtitle: subtitle,
  authors: author.name,
  date: datetime(year: 2024, month: 09, day: 10),
  duration: 20,
  fade: false,
  handout: false,
  doc,
)

//#set text(size: 20pt)

/***********************
 * WHAT IS OT SECURITY *
 **********************/
#slide(title: [What's OT Security])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #uncover("2-")[=== OT vs IT]
    #uncover("3-")[- #gls("it", long: true) \ = CPU]
    #uncover("4-")[- #gls("ot", long: true) \ = MCU]
    #uncover("5-")[- World of embedded systems]
  ][
    #uncover("6-")[=== Security]
    #uncover("7-")[- Before: IT wall]
    #uncover("8-")[- Now: IoT everywhere]
    #uncover("9-")[$=>$ Time for put Security in OT]

  ]

  #pdfpc.speaker-note(
    ```md
    
    ```
  )
]

#slide(title: [This thesis])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #align(center+horizon)[
      #image("/04-resources/OT-Security.jpg", height: 80%)
    ]
  ][
    //#polylux-outline()
    #one-by-one[][
      - Labo OT Security - I6
    ][
      
      - Securitys scenarios
        - Unsecure situation
        - Attack
        - Safe solution 
    ][
      
      - Industrial partner training
    ]
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



//-------------------
//- REPLAY SCENARIO -
//-------------------

#new-section-slide("Replay scenario")

#slide(title: [Environnement])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    //#align(center,image("/02-main/attacks/replay/abm.png", width: 90%))
    #only("2")[#align(center,image("/02-main/simu-env/wmbus_implementation-no_attack.drawio.svg", width: 90%))]
    #only("3-")[#align(center,image("/02-main/simu-env/wmbus_implementation.drawio.svg", width: 90%))]
    
  ][
    #uncover("4-")[#align(center)[#layer(1)]]
  ]

  #pdfpc.speaker-note(
    ```md

    ```
  )
]

#slide(title: [GFSK vs FSK])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #uncover("2-")[#align(center)[#image("/04-resources/img/spectrum_analyzer/wmb-resized.png", width: 80%)]]
  ][
    #uncover("3-")[#align(center)[#image("/04-resources/img/spectrum_analyzer/fm476-resized.png", width: 80%)]]
  ]

  #pdfpc.speaker-note(
    ```md

    ```
  )
]

#slide(title: [Transceiver 433 MHz])[

]

//----------------------------
//- MITM Modbus/TCP SCENARIO -
//----------------------------

#new-section-slide([#gls("mitm", long: true) scenario])

#slide(title: [Home I/O])[
  #let size = 60%
  #only("2")[#align(center,image("/04-resources/img/home-io.jpg", width: size))]
  #only("3-")[#align(center,image("/02-main/simu-env/homeio-door.png", width: size))]

  #pdfpc.speaker-note(
    ```md

    ```
  )
]

#slide(title: [Architecture])[
  #let size = 60%
  #only("2")[#align(center,image("/02-main/simu-env/implementation-no_attack.drawio.svg", width: size))]
  #only("3-")[#align(center,image("/02-main/simu-env/implementation.drawio.svg", width: size))]
  
  //#uncover("4-")[#align(center)[#layer(1)]]

  #pdfpc.speaker-note(
    ```md

    ```
  )
]

#slide(title: [#gls("arp", long: false) Poisoning])[
  #import "/02-main/attacks/mitm/chronos-drawings.typ": *
  #let arp = {
    import chronos: *
    controller(show-bottom: false)
    attacker(show-bottom: false)
    simulation(show-bottom: false)

    _grp("loop", desc: "every 1s", {
        async(a, c, [ARP | #get_ip("s") = #get_mac("a")])
        async(a, s, [ARP | #get_ip("c") = #get_mac("a")])
    })
  }
  
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #uncover("2-")[#align(center+horizon )[
      #set text(size: 10pt)
      #chronos.diagram(arp, width: 80%)
    ]]
  ][
    #uncover("3-")[#align(center+horizon)[#layer(2, 3)]]
  ]

  #pdfpc.speaker-note(
    ```md

    ```
  )
]

#slide(title: [Attack on Modbus/#gls("tcp", long: false)])[
  #import "/02-main/attacks/mitm/chronos-drawings.typ": *
  #let mitm1 = {
    import chronos: *
    controller(show-bottom: false)
    attacker(show-bottom: false)
    simulation(show-bottom: false)

    msg("c", "a", "Ask value of sensor #15",
        mac-sender: "c", 
        mac-receiver: "a",
        ip-sender: "c",
        ip-receiver: "s"
    )
    msg("a", "s", "Ask value of sensor #15",
        mac-sender: "a", 
        mac-receiver: "s",
        ip-sender: "c",
        ip-receiver: "s"
    )
  }
  #let mitm2 = mitm1 + {
    import chronos: *
    msg("s", "a", "Value of sensor #15 = 1",
        mac-sender: "s", 
        mac-receiver: "a",
        ip-sender: "s",
        ip-receiver: "c"
    )
  }
  #let mitm3 = mitm2 + {
    import chronos: *
    msg("a", "c", "Value of sensor #15 = " + text(color.attacker, weight: "bold")[0],
        mac-sender: "a", 
        mac-receiver: "c",
        ip-sender: "s",
        ip-receiver: "c"
    )    
  }
  #let mitm4 = mitm3 + {
    import chronos: *
    _seq("c", "c", end-tip: ">>", comment: highlight(fill: white)[Ok])
  }
  
  #only("2")[#align(center)[
    #set text(size: 10pt)
    #chronos.diagram(mitm1, width: 80%)
  ]]
  #only("3")[#align(center)[
    #set text(size: 10pt)
    #chronos.diagram(mitm2, width: 80%)
  ]]
  #only("4")[#align(center)[
    #set text(size: 10pt)
    #chronos.diagram(mitm3, width: 80%)
  ]]
  #only("5")[#align(center)[
    #set text(size: 10pt)
    #chronos.diagram(mitm4, width: 80%)
  ]]
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #only("6-")[=== Summary]
    #only("7-")[- On the fly]
    #only("8-")[- On #gls("tcp", long: false) layer]
    #only("9-")[- No need to decrypt]
  ][
    #only("8-")[#align(center+horizon)[#layer(4)]]
  ]

  #pdfpc.speaker-note(
    ```md

    ```
  )
]


//----------------------------
//- MITM Modbus/TLS SCENARIO -
//----------------------------

#slide(title: [#gls("tls", long: false) and #gls("x509")])[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #uncover("2-")[- Encrypt session]
    #uncover("2-")[#align(center)[#layer(5, 6)]]
  ][
    #uncover("3-")[=== #gls("x509")]
    #uncover("4-")[
      - Owner
       - Public key]
    #uncover("5-")[- Certificate authority]
    #uncover("6-")[- Signature]
  ]

  #pdfpc.speaker-note(
    ```md

    ```
  )
]

#slide(title: [Attack on Modbus/#gls("tls", long: false)])[
  #import "/02-main/attacks/mitm/chronos-drawings.typ": *
  #let tls1 = {
    import chronos: *
    controller(show-bottom: false)
    attacker(show-bottom: false)
    simulation(show-bottom: false)

    sync(s, a, [#gls("x509") | #text(color.simulation)[HomeI/O]])
    sync(a, c, [#gls("x509") | #text(color.attacker)[Fake #gls("x509")]])
  }
  #let tls2 = tls1 + {
    import chronos: *
    sync(c, a, [#gls("x509") | #text(color.controller)[Controller]])
    sync(a, s, [#gls("x509") | #text(color.attacker)[Fake #gls("x509")]])
  }
  #only("2")[#align(center)[
    //#set text(size: 20pt)
    #chronos.diagram(tls1, width: 70%)
  ]]
  #only("3")[#align(center)[
    //#set text(size: 20pt)
    #chronos.diagram(tls2, width: 70%)
  ]]
  #only("4-")[#align(center)[
    #set quote(block: true)
    #quote(attribution: [Martin Georgiev - October 2012])[
      The most dangerous code in the world: \ validating SSL certificates in non-browser software
    ]
  ]]
  #only("5-")[#align(center)[
    Aapo Oksman prove it still the case #text(weight: "bold")[last year]
    #table(
      columns: (1fr, 1fr, 1fr),
      rows: 80pt,
      stroke: none,
      [
        #only("6-")[#image("Samsung_Email_icon.png", height: 100%)]
      ],[
        #only("7-")[#image("playstation.svg", height: 100%)]
      ],[
        #only("8-")[#image("App_Store_(iOS).png", height: 100%)]
      ]
    )
  ]]
]


#focus-slide(
  foreground: white,
  background: rgb("#ea366a")
)[
  Questions ?
  #set text(size: 0pt);#include "/03-tail/glossary.typ"
]