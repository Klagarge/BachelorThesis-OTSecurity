// HEADER
#import "/00-templates/helpers.typ": *
#import "/02-main/attacks/mitm/chronos-drawings.typ": *

#set document(author: author.name, title: "Poster" + title)
#set page(paper: "a1") // A1: 594x841
#set page(margin: (
  top:7.5cm,
  bottom:7.5cm,
  rest:2cm,
  x: 2cm
))
#set text(size: 28pt)
#set par(justify: true)

#set page(
  header: [
    #tablex(
      columns: (24cm, 18.7cm, 13cm),
      stroke: none,
      align: left + horizon,
      [
        Student : #author.name \
        Professor : #professor.name \
        Expert : #expert.name (#expert.affiliation)
      ],[],[
        #image("/04-resources/logos/hei-vs-light.svg", width: 13cm)
      ]
    )
  ],
  footer: [
    #tablex(
      columns: (28.16cm, 14.61cm, 9.47cm, auto),
      stroke: none,
      align: left + horizon,
      [
        #image("/04-resources/logos/hes-adresse.png", width: 19.8cm)
      ],[
        #image("/04-resources/logos/swissuniversities.png", width: 12cm)
      ],[
        #image("/04-resources/logos/equal_salary.png", width: 6.7cm)
      ],[
        #image("/04-resources/logos/valais_excellence.png", width: 3.5cm)
      ]
    )
  ],
)

#align(center, text(60pt)[
  = #title
])

#table(
  columns: (1fr, 1fr),
  gutter: 15mm,
  stroke: none,
  align: left + top,
  [
    // -----------
    // - CONTEXT -
    // -----------
    == Context
    This thesis, exists in the context of the rework of the embedded systems security course at #school.shortname. The aim is to come up with several attack scenarios which can be used as the basis for a laboratory module for students. These scenarios could also serve in industrial training partnerships with #school.shortname.

    // --------------------------
    // - REPLAY ATTACK SCENARIO -
    // --------------------------
    == Replay attack scenario
    The replay scenario involves intercepting and resending a wireless message to produce the same effect, like a garage door opening.
    #align(center)[
      #set text(size: 12pt)
      #chronos.diagram({
      import chronos: *
      _par("e",
          display-name: [Emitter],
          shape: "custom",
          custom-image: image("/04-resources/stack/wireless-m-bus.png",
              width: 2cm,
              height: 1.5cm,
              fit: "contain"
          )
      )
      _par("a",
          display-name: [Attacker],
          shape: "custom",
          custom-image: image("/04-resources/stack/flipper.svg",
              width: 2cm,
              height: 1.5cm,
              fit: "contain"
          )
      )
      _par("r",
          display-name: [Receiver],
          shape: "custom",
          custom-image: image("/04-resources/stack/wireless-m-bus.png",
              width: 2cm,
              height: 1.5cm,
              fit: "contain"
          )
      )
      _seq("e", "e", end-tip: ">>", comment: "button", comment-align: "start")
      _seq("e", "r", end-tip: ">>", comment: "Message #1 : open garage door", comment-align: "start")  
      _seq("r", "r", end-tip: ">>", comment: "open garage door", comment-align: "start", flip: true)

      _gap()

      _seq("e", "e", end-tip: ">>", comment: "button", comment-align: "start")
      _sync({
        _seq("e", "r", end-tip: ">>", comment: "Message #1 : open garage door", comment-align: "start")  
        _seq("e", "a", end-tip: ">>", comment: " ", comment-align: "start")
      })
      _seq("r", "r", end-tip: ">>", comment: "open garage door", comment-align: "start", flip: true)

      _gap()

      _seq("a", "r", end-tip: ">>", comment: "Message #1", comment-align: "start")
      _seq("r", "r", end-tip: ">>", comment: "open garage door", comment-align: "start", flip: true)
      
      
    }, width: 75%)]

    To protect against this attack, the system should integrate a security in the message, like rolling codes or an encrypted counter with a private key.

    // ---------
    // - STACK -
    // ---------
    #v(3cm)
    == Stack
    #set text(size: 9pt)
    #table(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1.5fr),
      stroke: none,
      align: center + horizon,
      image("/04-resources/stack/Kali.png"),
      image("/04-resources/stack/wireshark.png"),
      image("/04-resources/stack/ettercap.svg"),
      image("/04-resources/stack/iptables.png"),
      image("/04-resources/stack/python.svg"),
      image("/04-resources/stack/scapy-logo.svg"),
      image("/04-resources/stack/golang.png"),
      image("/04-resources/stack/flipper.svg"),
      image("/04-resources/stack/wireless-m-bus.png"),
      text(12pt)[*Kali*], text(12pt)[*Wireshark*], text(12pt)[*Ettercap*], text(12pt)[*Iptables*], text(12pt)[*Python*], text(12pt)[*Scapy*], text(12pt)[*Golang*], text(12pt)[*Flipper Zero*], text(12pt)[*Wireless M-Bus*],
      [OS], [Packets sniffer], [MitM tool], [Firewall], [Programming\ language], [Packet\ manipulation], [Programming\ language], [Pen testing toy], [Wireless protocol]
    )
  ], [
    #v(2cm)

    // -------------------------------------
    // - MAN IN THE MIDDLE ATTACK SCENARIO -
    // -------------------------------------
    == Man in the middle
    The Man in the Middle scenario involves intercepting, modifying and sending packets  to take control of a Modbus/TCP installation.
    #align(center)[#image("/02-main/simu-env/implementation.drawio.svg", width: 80%)]
    The first step of the attack is to intercept the communication between the controller and the installation. To achieve this goal, the attacker can use ARP poisoning attack (1). Once the attacker has intercepted all packets, it is possible to modify them (2).
    To protect against this attack, the system has to use Modbus over TLS (3).

    
    #align(center)[
      #set text(size: 12pt)
      #chronos.diagram({
      import chronos: *
      controller
      attacker-kali
      simulation
      
      _sep("1. ARP poisoning")
      _grp("loop", desc: "every 20ms", {
        _seq("a", "c", end-tip: ">>", comment: [
            ARP | #get_ip("s") = #get_mac("a")
        ], comment-align: "start")
        _seq("a", "s", end-tip: ">>", comment: [
            ARP | #get_ip("c") = #get_mac("a")
        ], comment-align: "start")
      })
    
      _sep("2. Attack")
      msg2("c", "a", "Ask value of sensor #15",
        mac-sender: "c", 
        mac-receiver: "a",
        ip-sender: "c",
        ip-receiver: "s"
      )
      msg2("a", "s", "Ask value of sensor #15",
          mac-sender: "a", 
          mac-receiver: "s",
          ip-sender: "c",
          ip-receiver: "s"
      )
      msg2("s", "a", "Value of sensor #15 = 1",
          mac-sender: "s", 
          mac-receiver: "a",
          ip-sender: "s",
          ip-receiver: "c"
      )
      msg2("a", "c", "Value of sensor #15 = " + text(color.attacker, weight: "bold")[0],
          mac-sender: "a", 
          mac-receiver: "c",
          ip-sender: "s",
          ip-receiver: "c"
      )
      _seq("c", "c", end-tip: ">>", comment: highlight(fill: white)[Ok])

      _sep("3. TLS Handshake")
      _seq("c", "s", end-tip: ">>", comment: "client random", comment-align: "start")
      _seq("s", "c", end-tip: ">>", comment: "server random", comment-align: "start")
      _seq("s", "c", end-tip: ">>", comment: "certificate", comment-align: "start")
      _seq("c", "c", end-tip: ">>", comment: "verify certificate", comment-align: "start")
      _seq("c", "s", end-tip: ">>", comment: "encrypted seed (pre-master)", comment-align: "start")
      _seq("s", "s", end-tip: ">>", comment: "decrypted seed", comment-align: "start",flip: true)
      _sync({
        _seq("c", "c", end-tip: ">>", comment: "create master key", comment-align: "start")
        _seq("s", "s", end-tip: ">>", comment: "create master key", comment-align: "start", flip: true)
      })
    }, width: 90%)] 

  ]
)
