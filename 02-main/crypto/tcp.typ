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
  #gls("tcp", long: true) operates at layer 4 of the OSI model #cite(<ISO-OSI_model-74981-1>) and is responsible for establishing a reliable connection between two devices. In this thesis, the primary concern is #gls("tcp")'s mechanism for ensuring packet integrity via checksums. The checksum ensures that the packet has not been corrupted during transmission; i.e. if the checksum does not match, the packet is discarded. This aspect is crucial for the attacker, who must modify the packet on the fly. If the modified packet has an incorrect checksum, it will be discarded, causing the attack to fail. An acknowledgment (ACK) is sent back when the packet is received correctly, as illustrated in @fig-tcp. Within the #gls("tcp") segment, a Modbus packet is encapsulated as shown in @fig:modbus-tcp-structure. 
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