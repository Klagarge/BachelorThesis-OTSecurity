// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

= Modbus  <subj:comm-modbus>
Modbus is a communication protocol developed by Modicon in 1979 #cite(<Wikipedia-Modbus2024>). It involves a Modbus Master requesting data from a Modbus Slave. The client (master) sends a request to read from or write data to a server (slave). Modbus was originally designed for serial communication (called Modbus #gls("rtu", long: false)). It has since been adapted for use over #gls("tcp", long: false)/#gls("ip", long: false) (called Modbus #gls("tcp", long: false)).

== Modbus #gls("rtu", long: false)
Modbus with #gls("rtu", long: true) is a serial, compacted, binary representation of the data. It is transported on the physical layer RS232 or RS485. Modbus #gls("rtu") includes a #gls("crc")-16 bits checksum for error detection. 

#tablex(
  columns: (1fr, 1fr),
  stroke: none,
  [
    A frame is composed of:
    - Address: 1 byte
    - Function code: 1 byte
    - Data: 0-252 bytes
    - #gls("crc"): 2 bytes
  ],
  [
    Each byte of the frame is sent as 11 bits: 
    - 1 start bit
    - 8 data bits
    - 1 parity bit
    - 1 stop bit
  ]
)

#pagebreak()
== Modbus #gls("tcp", long: false)
Modbus over #gls("tcp") is a modern adaptation of Modbus. It is also a binary protocol, but transported over #gls("tcp"). This adaptation eliminates the need for #gls("crc") due to inherent error detection in #gls("tcp"). The rest of the frame is composed like Modbus #gls("rtu") and the default port for Modbus #gls("tcp") is 502.