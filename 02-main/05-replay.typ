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
Instead of using a complete protocol like #gls("wmbus"), a basic 433 MHz transceiver can be employed for the replay attack scenario. This approach is simpler and effectively simulates a garage door and its remote control. In this thesis, a basic #gls("ook") transceiver from `M5Stack` is used. The setup consists of two chips: a transmitter (`SYN115`) and a receiver (`SYN513R`). #gls("ook") modulation, the simplest form of #gls("ask"), represents digital data by the presence or absence of a carrier wave.

The transceiver emits a signal at 433.92 MHz when a signal is present on its data pin and nothing when the data pin is low. A challenge with the receiver is detecting a varying signal; if no signal is detected, it amplifies the noise until it perceives sufficient variation to consider it as a signal. Similarly, if the signal is present for too long, the receiver reduces amplification, mistaking noise variations for the signal.

To overcome this issue and maintain simplicity, the strategy involves transmitting a serial message with a long preamble to stabilize the signal's amplification, followed by start characters. This enables the receiver to correctly detect both the signal and the message.

Given the simplicity of this modulation, the #gls("flipper") device has no trouble reading and replaying the signal. It have to be configurate on the right frequency and an `AM650` modulation preset. The demonstration conducted in this thesis involves a simple message sent by the transmitter and received by the receiver. The #gls("flipper") is used to record the message and replay it, allowing the receiver to detect the message and trigger the same action as the original signal.

= Security in wireless broadcast isolated devices
A replay attack is always possible if two identical messages trigger the same action. To prevent such attacks, each message must be unique.

Typically, this is achieved by adding a timestamp to the message. However, in this scenario, it's not feasible due to the isolation between the receiver and transmitter, as well as the unidirectional nature of the communication. Without the ability to perform a challenge-response, alternative methods must be considered.

== Closer look on rolling code
For this thesis, a rolling code was chosen as the security measure. Rolling code security involves appending a short, changing code to each message. This code is generated using a simple pseudo-random number generator. The receiver stores the last code received and only accepts one of the next codes in the sequence.

A pseudo-random number generator relies on a seed and a function that generates a new, seemingly random number. The seed is the last code received, and both the transmitter and receiver use the same function. The receiver must be able to compare with more than one subsequent code; otherwise, if a code is transmitted but not received, the receiver may become desynchronized and unable to decode future codes.

This method is straightforward and allows for easy addition of new remotes. To add a new remote, the receiver must enter learning mode, and the transmitter sends a code that the receiver adopts as the seed for the new remote.

This method is not perfect for security, as if the attacker knows how works the pseudo-random number generator, he can predict the next code. But it is enough for a garage door remote.

If an attacker understands how the pseudo-random number generator of this system works, they can predict future codes. While this method is not foolproof, it provides sufficient security for a garage door remote.

== Closer look on signature
An alternative method involves signing the message with a private key, which the receiver then verifies using a public key. This approach offers greater security but requires more complex hardware and software capable of performing cryptographic operations. Additionally, adding a new remote becomes more complicated, as the receiver must be configured to recognize the new remote's public key.

To sign a message, a hash of the message is created and encrypted with the private key. The receiver decrypts the signature with the public key and compares the hash with the hash of the received message. If they match, the message is considered authentic. To prevent replay attacks, a simple counter can be included in the message, as it is also authenticated.

= Conclusion
In summary, this chapter has presented the replay attack using the #gls("flipper"). This attack is relatively simple, as the #gls("flipper") has built-in functions designed to execute such attacks on unsecured systems. Initially, the plan was to conduct this attack on a #gls("wmbus") system, but due to the #gls("flipper")'s lack of preset support for #gls("2gfsk") modulation, the attack was instead performed on a basic 433 MHz transceiver.

Since a wireless replay attack targets layer 1 of the OSI model #cite(<ISO-OSI_model-74981-1>), the system must implement security at a higher layer. In this thesis, a rolling code was used to secure the system. While this method is simple and effective for a garage door remote, more secure systems may benefit from a message signature approach
