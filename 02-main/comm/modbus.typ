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
Modbus is a communication protocol developed by Modicon in 1979. The device requesting the information is called the Modbus Master and the devices supplying information are Modbus Slaves. The client (master) sends a request to read or write data to a server (slave). Modbus was originally designed for serial communication (call Modbus #gls-short("rtu")). It has since been adapted for use over #gls-short("tcp")/#gls-short("ip") (call Modbus #gls-short("tcp")).

== Modbus #gls-short("rtu")
Modbus with #gls("rtu") is a serial communication, compated, binary representation of the data. It transported on physical layer RS232 or RS485 #cite(<ISO74981>). For add a bit of error-detecting, Modbu gls("rtu") use a #gls("crc")-16 bits checksum. 

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
    Each byte of the frame are sent as 11 bits: 
    - 1 start bit
    - 8 data bits
    - 1 parity bit
    - 1 stop bit
  ]
)

== Modbus #gls-short("tcp")
Modbus over #gls("tcp") is an modern adaptation of Modbus. It's still a binary protocol but it's transported over #gls("tcp"). Because #gls("tcp") already include error-detecting, Modbus frame doesn't include #gls("crc"). Otherwise, the frame is composed like Modbus #gls("rtu"). Default port for Modbus #gls("tcp") is 502.