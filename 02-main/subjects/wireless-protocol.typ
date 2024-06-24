// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

#import "/04-resources/rivet.typ": *


= Wireless Protocol


== CHipset for Wirless M-Bus

=== RC1180-MBUS3
This is a simple transceiver for Wireless M-Bus by Radiocraft. It can operate in S, T or R2 mode. It can operate on 12 channels in 868 MHz. It interfaces with a simple UART communication.
- Devkit: 240.-
- Dongle: 84.-
- Chipset: 18.-

=== SX1276
This chip is mainly a LoRa transceiver by Semtech.
One can use the development board #link("https://www.mouser.ch/ProductDetail/Semtech/SX1276MB1MAS?qs=%2FukktrhNKsauG%252Bdxd7cK4A%3D%3D")[SX1276MB1MAS] ready to use at 77.- at Mouser. With the development board, a library to use the mac layer is provided.

=== CC1120 de Texas Instruments
This swissknif chip from Texas Instrument can operate a wide modulation types in 868MHz.


== Chipset for 434 MHz

=== RFM69HCW (based SX1231)
Chipset based on SX1231 from Texas Instruments. Can be used in several FSK mode or OOK. Communication via SPI. Need to be configured for a specific usage. 

=== SYN115-SYN531R
Chipset OOK for 434 MHz. On 433.92 MHz in OOK modulation. SYN115 is the transmitter and SYN513R is the receiver. A single input output is used for transmition. Max speed is 10kbps. No configuration is needed

== Flipper zero

=== Modulation possible
- AM270 : amplitude modulation with the bandwidth of 270 kHz.
- AM650 : amplitude modulation with the bandwidth of 650 kHz (set as default).
- FM238 : frequency modulation with the bandwidth of 270 kHz and the deviation of 2.380371 kHz.
- FM476 : frequency modulation with the bandwidth of 270 kHz and the deviation of 47.60742 kHz.
- FM95  : 2FSK with 9.5KHz freq deviation.
- FM15k : 
- Pagers: 
- HDN_1 : 

#let c = rivet.config.config(
  all-bit-i: false,
  bit-width: 40,
  bit-height: 40,
)
//#rivet.schema.render(test-typ, config: c)