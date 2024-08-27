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

#let body = [
  #gls("tcp") is a layer 4 protocol that is used to establish a connection between two devices.
  For this Thesis, the only point of interest is about #gls("tcp") ensure that the packet is correctly received by the other party. This is done by using a checksum. The checksum is used to ensure that the packet is not corrupted during transmission. If the checksum does not match, the packet is discarded. This is important for the attacker because he has to modify the packet on the fly. If the checksum is not correct, the packet will be discarded and the attack will fail. An ACK (acknowledgement) is send when the packet is correctly received as shown on @fig-tcp.
  #gls("tcp") transport some data. This data are the Modbus packet like shown on @fig:modbus-tcp-structure. 
]

#let fig = [
  #figure(
    align(center,
      chronos.diagram(tcp, width: 100%)
    ),
    caption: [TCP exchange],
  ) <fig-tcp>
]

#table(
  columns: (2fr, 1fr),
  align: left + top,
  stroke: none,
  //inset: 1em,
  body,
  fig,
)
#[
  #set text(size: small)
  #figure(
    table(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      align: center + horizon,
      [0], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [...],
      /*0-1*/ table.cell(colspan: 2)[Transaction ID],
      /*2-3*/ table.cell(colspan: 2)[Protocol identifier],
      /*4-5*/ table.cell(colspan: 2)[Length],
      /*6*/ [Unit ID],
      /*7*/ [Func. code],
      /*8-9*/ table.cell(colspan: 2)[Reference number],
      /*10-...*/ table.cell(colspan: 2)[Modbus data],
    ),
    caption: [Modbus TCP packet structure],
  ) <fig:modbus-tcp-structure>
]