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
With the setup complete, the goal is to perform a replay attack on the #gls("wmbus") system using the #gls("flipper") device. As a reminder, the #gls("wmbus") in T-Mode operates at 868.95 MHz with 2GFSK modulation and a 50 kHz deviation.

== Flipper Zero
For this thesis, the "sub-1GHz" feature of the #gls("flipper") is utilized. The #gls("flipper") contains a `CC1101` chip from `Texas Instruments (TI)`, designed to operate within the 300-348 MHz, 387-464 MHz, and 779-928 MHz frequency bands. It supports various modulation schemes, including 2(G)FSK, 4(G)FSK, ASK, and OOK.

In read-raw mode, the #gls("flipper") needs to be configured to operate at 868.95 MHz for the #gls("wmbus") system. The modulation is set to `FM476`, which corresponds to frequency modulation with a 47.6 kHz deviation. Based on the documentation, the Flipper should ideally detect the specific type of frequency modulation used by the signal.

== Modulation FSK vs GFSK
Initial attempts at replaying the signal were unsatisfactory. While the #gls("flipper") successfully detected and recorded a signal, the replayed signal was received by the RC1180 but not understood. This indicated that the #gls("flipper") was not correctly recording or replaying the signal. To diagnose the issue, the wireless signal was analysed using an Agilent spectrum analyser. Although the measurements were not conducted to obtain precise quantitative results, they provided a qualitative understanding of the signal.

A measurement of the original signal emitted by the #gls("wmbus") transceiver is shown in @fig:wmbus-spectrum. The signal is centred around 868.95 MHz with a 50 kHz bandwidth and uses #gls("2gfsk", long: true) modulation.

In contrast, the signal replayed by the #gls("flipper"), shown in @fig:wmbus-spectrum-flipper, also centres around 868.95 MHz with a 47,6 kHz bandwidth, but the modulation appears to be #gls("2fsk", long: true) rather than #gls("2gfsk"). This difference in modulation explains why the RC1180 does not recognize the replayed signal.

#table(
  columns: (1fr, 1fr),
  align: center + top,
  stroke: none,
  [
    #set figure.caption(separator: linebreak())
    #figure(
      image("/04-resources/img/spectrum_analyzer/wmb-resized.png", width: 100%),
      caption: [Spectrum analyzer of the original #gls("wmbus") signal],
    ) <fig:wmbus-spectrum>
  ],[
    #set figure.caption(separator: linebreak())
    #figure(
      image("/04-resources/img/spectrum_analyzer/fm476-resized.png", width: 100%),
      caption: [Spectrum analyzer of the replayed signal in FM476 modulation],
    ) <fig:wmbus-spectrum-flipper>
  ]
)

The #gls("flipper") seems unable to detect the correct type of frequency modulation. Upon closer examination of the firmware, it was discovered that the `FM476` preset is configured only for #gls("2fsk") modulation. While a brief effort was made to add a configuration setting for #gls("2gfsk") with a 50 kHz deviation, the limited time remaining for the thesis made it impractical to proceed. Configuring this would require a detailed understanding of the CC1101 chip's register settings, a complex task requiring in-depth knowledge of the chip's datasheet.

Given these challenges, it was decided to proceed with Plan B.


= Attack on basic 433 MHz transceiver
#todo([])

= Security in wireless brodcast isolted devices
#todo([
  
])

== Closer look on rolling code
#todo([
  
])

== Closer look on signature
#todo([
  
])
