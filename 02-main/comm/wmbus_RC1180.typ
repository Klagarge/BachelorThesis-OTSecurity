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

The *RC1180* is a #gls("wmbus") transceiver interfaced via a serial connection. To function correctly, this chip must be configured to the appropriate mode. In the context of this thesis, T-mode is utilized. The transceiver also needs to be set up as either a transmitter or a receiver. Configuration is achieved by sending specific serial commands to the device, which will respond with a confirmation message. The following commands are used for configuration : 

+ `0x00`: to enter configuration mode
+ `0x47`: to change the #gls("wmbus") mode
+ `0x01`: to configure to T-mode
+ `0x46`: to change the C-field of all futur messages
+ `0x44`/`0x04`: to set master (`0x44`) or slave (`0x04`)
+ `0x00`: to exit configuration mode
After each command, a confirmation message `0x3E` is expected.

Once the configuration is complete, a message can be sent to the device to initiate transmission. The message format is shown in @fig:wmbus-send-uart.
#table(
  columns: (1fr, 1fr),
  stroke: none,
  align: center + horizon,
  [
    #set figure.caption(separator: linebreak())
    #figure(
      table(
        columns: (2em, 2em, 4em),
        align: center + horizon,
        [L], [CI], [Data],
      ),
      caption: [RC1180 uart sending message format],
    ) <fig:wmbus-send-uart>
  ], align(left)[
    *L*: Length of the message (1 byte) \
    *CI*: Control Information (1 byte) \
    *Data*: Data to send (L bytes)
  ]
) 
For this thesis, the `CI` is set to `0x80` to send a general message, as this is a demonstration setup rather than a real #gls("wmbus") meter.