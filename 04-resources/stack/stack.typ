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

#let add-figure = (path, size, caption, lbl) => {
  set figure.caption(separator: linebreak())
  [
    #figure(
      image(path, width: size),
      supplement: "Icon",
      kind: "icon",
      caption: caption
    ) #label("stack:" + lbl)
  ]
}


#let fig = (
  kali: (size, lbl) => add-figure(
    "/04-resources/stack/Kali.png",
    size,
    [*Kali Linux*], lbl
  ),

  wireshark: (size, lbl) => add-figure(
    "/04-resources/stack/wireshark.png",
    size,
    [*Wireshark*], lbl
  ),
  
  ettercap: (size, lbl) => add-figure(
    "/04-resources/stack/ettercap.svg",
    size,
    [*Ettercap*], lbl
  ),
  
  iptables: (size, lbl) => add-figure(
    "/04-resources/stack/iptables.png",
    size,
    [*Iptables*], lbl
  ),
  
  python: (size, lbl) => add-figure(
    "/04-resources/stack/python.svg",
    size,
    [*Python*], lbl
  ),
  
  scapy: (size, lbl) => add-figure(
    "/04-resources/stack/scapy-logo.svg",
    size,
    [*Scapy*], lbl
  ),
  
  golang: (size, lbl) => add-figure(
    "/04-resources/stack/golang.png",
    size,
    [*Golang*], lbl
  ),

  flipper: (size, lbl) => add-figure(
    "/04-resources/stack/flipper.png",
    size,
    [*Flipper Zero*], lbl
  ),

  modbus: (size, lbl) => add-figure(
    "/04-resources/stack/modbus.png",
    size,
    [*Modbus*], lbl
  ),
)

#let def = (
  kali: lbl => [
    *Kali  Linux* (#ref(lbl)) is an operating system for #gls("pen", long: false).\ 
  ],

  wireshark: lbl => [
    *Wireshark* (#ref(lbl)) is a network protocol analyzer.\ 
  ],
  
  ettercap: lbl => [
    *Ettercap* (#ref(lbl)) is a suite tool to perform #gls("mitm") attacks.\ 
  ],
  
  iptables: lbl => [
    *Iptables* (#ref(lbl)) is a firewall used to create redirection rules. \ 
  ],
  
  python: lbl => [
    *Python* (#ref(lbl)) is a programming language useful for scripting.\
  ],
  
  scapy: lbl => [
    *Scapy* (#ref(lbl)) is a packet manipulation Python package.\
  ],
  
  golang: lbl => [
    *Golang* (#ref(lbl)) is a statically typed, compiled programming language.\ 
  ],

  flipper: lbl => [
    *Flipper Zero* (#ref(lbl)) is a portable multi-tool for pentesters.\ 
  ],

  modbus: lbl => [
    *Modbus* (#ref(lbl)) is a communication protocol used in industrial automation.\ 
  ],
)