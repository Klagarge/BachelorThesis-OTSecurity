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

= Simulation Environnement
#subject(
  "simu-env/wmbus",
  heading-offset: 2
)


= Requirements
This scenario focuses on a replay attack on a #gls("wmbus") system, where understanding the content of the message is unnecessary. The attacker only needs to capture the physical layer of the message and retransmit it.

The #gls("flipper") device (@stack:replay-flipper) is used to execute this attack. The device features a “read raw” mode in the “sub-ghz” section, which allows it to listen to a specific frequency with a particular modulation and record the data at the physical layer (layer 1 of the OSI model #cite(<ISO-OSI_model-74981-1>)).

For transmitting messages on #gls("wmbus"), a *RC1180* transceiver from Radiocraft is employed. This device can both transmit and receive messages via a serial connection. A Go (@stack:replay-golang) program can be used to send and receive messages through the RC1180.

== Tools
Here are all the tools that are used for this scenario : 
#import "/04-resources/stack/stack.typ" as stack

#table(
  columns: 2,
  stroke: none,
  align: center + horizon,
  [
    #set text(size: 9pt)
    #table(
      columns: 2,
      stroke: none,
      align: center + horizon,
      
      (stack.fig.flipper)(size-fig.stack-replay, "replay-flipper"),
      (stack.fig.golang)(size-fig.stack-replay, "replay-golang"),
    )
  ],
  align(left)[
    #(stack.def.flipper)(<stack:replay-flipper>)
    #(stack.def.golang)(<stack:replay-golang>)
  ]
)

== Closer look on RC1180
#subject(
  "comm/wmbus_RC1180",
  heading-offset: 3
)

= Attack on Wireless M-Bus
#todo([
  
])

== Flipper Zero
#todo([
  
])

== Modulation FSK vs GFSK
#todo([
  
])

= Attack on basic 433 MHz transceiver
#todo([
  
])

= Security in wireless brodcast isolted devices
#todo([
  
])

== Closer look on rolling code
#todo([
  
])

== Closer look on signature
#todo([
  
])
