#import "../../00-templates/helpers.typ": *

#show: doc => slide_template(
  title: title,
  subtitle: [Presentation and choice of simulations scenarios],
  authors: author.name,
  date: datetime(year: 2024, month: 06, day: 10),
  //duration: 10,
  handout: true,
  doc,
)

#set text(size: 20pt)

#slide(
  title: [Attacks]
)[
  #one-by-one[][
    - _Wireless_ Replay (Zigbee or wM-Bus)
  ][
    - Dos by *external* sensor with valid packet
  ][
    - MitM on Modbus over TCP
  ][
    - MitM on Modbus over TCP with standard encryption
  ]

  #pdfpc.speaker-note(
    ```md
    - Replay sur du _wireless_ par un outside
    - DoS par un capteur *externe* aussi pour un outside
    - MitM sur Modbus/TCP par un inside
    
    - vM-Bus pas encore trouvé de solution pour ne pas refaire une implémentation du protocole. 
    
    - Côté PLC et wireless, quels sont vos shouaits ?
    ```
  )
]

/*
#slide(
  title: [Winter Resort Simulator 2]
)[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[
      ➕ Simple \
    ][
      ➖ Simple \
    ]
  ][
    #image("../../04-resources/img/winter_resort_simulator_2.jpg", width: 100%)
  ]
]
*/

#slide(
  title: [Factory I/O]
)[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[][
      - PLC manage palletizer
    ][
      - _Wireless_ *external* sensor for truck detection
    ][
      - MitM on clamp
    ][
      ➕ Realism \
    ][
      ➖ \~4300.- \
    ][
      ➕ Customization \
    ][
      \ Security by third party \
    ]
  ][
    #image("../../04-resources/img/factoryio-palletizer.png", width: 100%)
  ]
]

#slide(
  title: [Home I/O]
)[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[][
      - PLC manage garage and door
    ][
      - *_Wireless_* remote for garage
    ][
      - *External* sensor for presence detection (door)
    ][
      - MitM for opening door
    ][
      ➕ \~300.- \
    ][
      ➖ Customization \
    ][
      \ Security by third party \
    ]
  ][
    #image("../../04-resources/img/home-io.jpg", width: 100%)
  ]
]

#slide(
  title: [Minecraft]
)[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[][
      - PLC already exist with Java lab
    ][
      - Wireless wind sensor 
    ][
      - Add Physical HMI for setter (MitM on it)
    ][
      ➕ Pursuite of a lab \
    ][
      ➕ Already got it \
    ][
      ➕ Full customization \
    ][
      \ Security by OC or new mod \
    ]
  ][
    #image("../../04-resources/img/minecraft-eln-world.png", width: 100%)
  ]
]

#slide(
  title: [Summary]
)[
  #set text(size: large)
  #include "/02-main/simu-env/comparison.typ"
  
]


#slide(title: [Planning])[#include "../../04-resources/plannings/00-initial.typ"]

