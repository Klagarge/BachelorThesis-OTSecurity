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

The *RC1180* is a #gls("wmbus") transceiver interfaced on Serial. This chip have to be configurated to thw right mode to work properly. In this thesis case, the T-mode is used. The transceiver must also me configured has a emitter or a receiver. The configuration is done by sending serial data to the device. The device will then respond with a confirmation message. The configuration is done by sending the following characters to the device : 
- `0x00`: to enter in configuration mode
- `0x47`: to change the #gls("wmbus") mode
- `0x01`: to configure to T-mode
- `0x46`: to change the C-field of all futur messages
- `0x44`/`0x04`: to set master (`0x44`) or slave (`0x04`)
- `0x00`: to exit configuration mode
A return message, `0x3E`, is expected between each send.

After the configuration, a message can be sent to the device to start the transmission. The message must be in the following format shown on @fig:wmbus-send-uart.
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
    *Data*: Data to send (n bytes)
  ]
) 
For this thesis, the `CI` is set to `0x80` to send a general message as this is just a demonstrator and not a real #gls("wmbus") meter.