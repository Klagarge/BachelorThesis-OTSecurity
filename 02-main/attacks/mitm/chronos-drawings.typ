// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

#set page(width: auto, height: auto)

#let msg(
    sender,
    receiver,
    message,
    mac-sender: none,
    mac-receiver: none,
    ip-sender: none,
    ip-receiver: none,
) = {
    import chronos: *
    
    let MAC-S = if mac-sender != none { mac-sender } else { sender }
    let MAC-R = if mac-receiver != none { mac-receiver } else { receiver }
    let IP-S = if ip-sender != none { ip-sender } else { sender }
    let IP-R = if ip-receiver != none { ip-receiver } else { receiver }
    
    let msg = message
    msg += " | "
    msg += get_mac(MAC-S)
    msg += [ $arrow$ ]
    msg += get_mac(MAC-R)
    msg += " | "
    msg += get_ip(IP-S)
    msg += [ $arrow$ ]
    msg += get_ip(IP-R)
    _seq(sender, receiver, end-tip: ">>", comment: highlight(fill:white)[#msg])
}

#let mitm = {
    import chronos: *
    controller()
    attacker()
    simulation()

    _sep("1. Normal")
    msg("c", "s", "Ask value of sensor #15")
    msg("s", "c", "Value of sensor #15 = 1")
    _seq("c", "c", end-tip: ">>", comment: highlight(fill: white)[Alarm !])

    _sep("2. ARP poisoning")

    _sync({
        _seq("a", "c", end-tip: ">>", comment: highlight(fill:white)[
            ARP | #get_ip("s") = #get_mac("a")
        ], comment-align: "start")
        _seq("a", "s", end-tip: ">>", comment: highlight(fill:white)[
            ARP | #get_ip("c") = #get_mac("a")
        ], comment-align: "start")
    })

    msg("c", "a", "Ask value of sensor #15",
        mac-sender: "c", 
        mac-receiver: "a",
        ip-sender: "c",
        ip-receiver: "s"
    )
    msg("a", "s", "Ask value of sensor #15",
        mac-sender: "a", 
        mac-receiver: "s",
        ip-sender: "c",
        ip-receiver: "s"
    )
    msg("s", "a", "Value of sensor #15 = 1",
        mac-sender: "s", 
        mac-receiver: "a",
        ip-sender: "s",
        ip-receiver: "c"
    )
    msg("a", "c", "Value of sensor #15 = 1",
        mac-sender: "a", 
        mac-receiver: "c",
        ip-sender: "s",
        ip-receiver: "c"
    )
    _seq("c", "c", end-tip: ">>", comment: highlight(fill: white)[Alarm !])

    _sep("3. MitM attack")
    msg("c", "a", "Ask value of sensor #15",
        mac-sender: "c", 
        mac-receiver: "a",
        ip-sender: "c",
        ip-receiver: "s"
    )
    msg("a", "s", "Ask value of sensor #15",
        mac-sender: "a", 
        mac-receiver: "s",
        ip-sender: "c",
        ip-receiver: "s"
    )
    msg("s", "a", "Value of sensor #15 = 1",
        mac-sender: "s", 
        mac-receiver: "a",
        ip-sender: "s",
        ip-receiver: "c"
    )
    msg("a", "c", "Value of sensor #15 = " + text(color.attacker, weight: "bold")[0],
        mac-sender: "a", 
        mac-receiver: "c",
        ip-sender: "s",
        ip-receiver: "c"
    )
    _seq("c", "c", end-tip: ">>", comment: highlight(fill: white)[Ok])


}


#let arp-spoofing = {
    import chronos: *
    controller(show-bottom: true)
    attacker(show-bottom: true)
    simulation(show-bottom: true)

    _grp("loop", desc: "every 1s", {
        _seq("a", "c", end-tip: ">>", comment: highlight(fill:white)[
            ARP | #get_ip("s") = #get_mac("a")
        ], comment-align: "start")
        _seq("a", "s", end-tip: ">>", comment: highlight(fill:white)[
            ARP | #get_ip("c") = #get_mac("a")
        ], comment-align: "start")
    })

}

#let arp-spoofing-sync = {
    import chronos: *
    controller(show-bottom: false)
    attacker(show-bottom: false)
    simulation(show-bottom: false)

    _grp("loop", desc: "every 1s", {
        _sync({
            _seq("a", "c", end-tip: ">>", comment: highlight(fill:white)[
                ARP | #get_ip("s") = #get_mac("a")
            ], comment-align: "start")
            _seq("a", "s", end-tip: ">>", comment: highlight(fill:white)[
                ARP | #get_ip("c") = #get_mac("a")
            ], comment-align: "start")
        })
    })

}

#chronos.diagram(mitm)
#chronos.diagram(arp-spoofing)




