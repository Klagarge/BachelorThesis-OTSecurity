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
#gls("wmbus") #cite(<EN13757>, supplement:[part. 4]) is a wireless adaptation of the #gls("mbus") #cite(<EN13757>) protocol. This protocol is used in Europe for metering applications. This protocol is compatible with ISO layer model #cite(<ISO74981>) but only some layer are implemented: 
- Layer 1: Physical layer (#cite(<EN13757>, supplement:[part. 2]) for wired and #cite(<EN13757>, supplement:[part. 4]) for wireless)
- Layer 2: Data link layer (#cite(<EN13757>, supplement:[part. 2]) for wired and #cite(<EN13757>, supplement:[part. 4]) for wireless)
- Layer 7: Application layer (#cite(<EN13757>, supplement:[part. 3]))

The wireless specification are several modes of operation work on several frequency bands. The most common are:

== Mode S 
This mode #cite(<EN13757>, supplement:[part. 4, p. 16]) work on 868 MHz with 2FSK modulation on a single channel. Meters are sending data several time a day to a stationnary collector. The collector can be used a power-saving function and is waking up by the long heading of the frame. This mode have a mono-directionnal (S1) or bi-directionnal (S2) sub-mode.

== Mode T
This mode #cite(<EN13757>, supplement:[part. 4, p. 19]) work on 868 MHz with 2FSK modulation. The mono-directionnal sub-mode T1 have a single-channel but the bi-directionnal sub-mode T2 can use 2 channels. Meter are frequently sending data to a collector. This collector can be mobile.

== Mode R2
This mode #cite(<EN13757>, supplement:[part. 4, p. 24]) work on 868 MHz with 2FSK modulation. This mode is bi-directionnal and have 10 channels. This mode can used frequency hopping for a higher duty cycle than other modes. 

== Mode C
This mode #cite(<EN13757>, supplement:[part. 4, p. 27]) work on 868 MHz with 2FSK modulation. The mono-directional sub-mode C1 have a single channel and the bi-directionnal sub-mode C2 have 2 channels with 2 different bandwidth. It can used for stationnary or mobile collector. 

== Mode N
This mode #cite(<EN13757>, supplement:[part. 4, p. 30]) work on 169 MHz with 4GFSK modulation. This mode can be mono or bi directionnal and have 13 channels. This mode is used for long range communication to a stationnary collector.

== Mode F
This mode #cite(<EN13757>, supplement:[part. 4, p. 35]) work on 433 MHz with 2FSK modulation. This mode have only bi-directionnal sub-mode. It's used for long range communication to a stationnary or mobile collector.