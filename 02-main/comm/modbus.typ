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
Modbus is a communication protocol developed by Modicon in 1979. It involves a Modbus Master requesting data from a Modbus Slave. The client (master) sends a request to read or write data to a server (slave). Modbus was originally designed for serial communication (call Modbus #gls("rtu", long: false)). It has since been adapted for use over #gls("tcp", long: false)/#gls("ip", long: false) (call Modbus #gls("tcp", long: false)).

== Modbus #gls("rtu", long: false)
Modbus with #gls("rtu") is a serial communication, compacted, binary representation of the data. It transported on physical layer RS232 or RS485 #cite(<ISO74981>). Modbus #gls("rtu") includes a #gls("crc")-16 bits checksum for error detection. 

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

== Modbus #gls("tcp", long: false)
Modbus over #gls("tcp") is a modern adaptation of Modbus. It's still a binary protocol, but it's transported over #gls("tcp"). This adaptation eliminates the need for #gls("crc") due to inherent error detection in #gls("tcp"). Otherwise, the frame is composed like Modbus #gls("rtu") and the default port for Modbus #gls("tcp") is 502.