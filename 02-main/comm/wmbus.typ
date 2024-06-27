// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

= #gls-short("wmbus")  <subj:comm-wmbus>
#gls("wmbus") #cite(<EN13757>, supplement:[part. 4]) is a wireless adaptation of the #gls("mbus") #cite(<EN13757>) protocol. This protocol is used in Europe for metering applications. This protocol is compatible with ISO layer model #cite(<ISO74981>) but only some layers are implemented: 
- Layer 1: Physical layer (#cite(<EN13757>, supplement:[part. 2]) for wired and #cite(<EN13757>, supplement:[part. 4]) for wireless)
- Layer 2: Data link layer (#cite(<EN13757>, supplement:[part. 2]) for wired and #cite(<EN13757>, supplement:[part. 4]) for wireless)
- Layer 7: Application layer (#cite(<EN13757>, supplement:[part. 3]))

The wireless specification has several modes of operation, to work on several frequency bands. The most common are:

== Mode S 
This mode #cite(<EN13757>, supplement:[part. 4, p. 16]) work on 868 MHz with 2FSK modulation on a single channel. Meters send data many times a day to a stationary collector. The collector can be used in a power-saving function and is waking up by the long heading of the frame. This mode has a one-directional (S1) or bidirectional (S2) sub-mode.

== Mode T
This mode #cite(<EN13757>, supplement:[part. 4, p. 19]) work on 868 MHz with 2FSK modulation. The one-directional sub-mode T1 has a single-channel, but the bidirectional sub-mode T2 can use 2 channels. Meter is frequently sending data to a collector. This collector can be mobile.

== Mode R2
This mode #cite(<EN13757>, supplement:[part. 4, p. 24]) work on 868 MHz with 2FSK modulation. This mode is bidirectional and has 10 channels. This mode can use frequency hopping for a higher duty cycle than other modes. 

== Mode C
This mode #cite(<EN13757>, supplement:[part. 4, p. 27]) work on 868 MHz with 2FSK modulation. The one-directional sub-mode C1 has a single channel and the bidirectional sub-mode C2 has 2 channels with 2 different bandwidths. It can be used for stationary or mobile collector. 

== Mode N
This mode #cite(<EN13757>, supplement:[part. 4, p. 30]) work on 169 MHz with 4GFSK modulation. This mode can be one or bidirectional and has 13 channels. This mode is used for long-range communication to a stationary collector.

== Mode F
This mode #cite(<EN13757>, supplement:[part. 4, p. 35]) work on 433 MHz with 2FSK modulation. This mode has only a bidirectional sub-mode. It's used for long-range communication to a stationary or mobile collector.