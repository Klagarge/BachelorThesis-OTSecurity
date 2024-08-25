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

#let color = (
    controller: green,
    attacker: fuchsia,
    simulation: blue,
)

#let get_mac(actor) = {
    if actor == "c" {
        text(color.controller)[MAC-C]
    } else if actor == "a" {
        text(color.attacker)[MAC-A]
    } else if actor == "s" {
        text(color.simulation)[MAC-S]
    } else {
        text(black)[MAC-?]
    }
}

#let get_ip(actor) = {
    if actor == "c" {
        text(color.controller)[IP-C]
    } else if actor == "a" {
        text(color.attacker)[IP-A]
    } else if actor == "s" {
        text(color.simulation)[IP-S]
    } else {
        text(black)[IP-?]
    }
}

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

#let controller(show-bottom: true) = {
    import chronos: *
    _par("c",
        display-name: text(color.controller)[Controller],
        shape: "custom",
        custom-image: image("/04-resources/cc100.png",
            width: 2cm,
            height: 1.5cm,
            fit: "contain"
        ),
        show-bottom: show-bottom
    )
}

#let attacker(show-bottom: true) = {
    import chronos: *
    _par("a",
        display-name: text(color.attacker)[Attacker],
        shape: "custom",
        custom-image: image("/04-resources/bender.svg",
            width: 1.5cm,
            height: 1.5cm,
            fit: "contain"
        ),
        show-bottom: show-bottom
    )
}

#let attacker-kali(show-bottom: true) = {
    import chronos: *
    _par("a",
        display-name: text(color.attacker)[Attacker],
        shape: "custom",
        custom-image: image("/04-resources/stack/Kali.png",
            width: 1.5cm,
            height: 1.5cm,
            fit: "contain"
        ),
        show-bottom: show-bottom
    )
}

#let simulation(show-bottom: true) = {
    import chronos: *
    _par("s",
        display-name: text(color.simulation)[Simulation],
        shape: "custom",
        custom-image: image("/04-resources/home-io.png",
            width: 1.5cm,
            height: 1.5cm,
            fit: "contain"
        ),
        show-bottom: show-bottom
    )
}

#let mitm = {
    import chronos: *
    controller()
    attacker()
    simulation()

    _sep("Normal")
    msg("c", "s", "Ask value of sensor #15")
    msg("s", "c", "Value of sensor #15 = 1")
    _seq("c", "c", end-tip: ">>", comment: highlight(fill: white)[Alarm !])

    _sep("ARP poisoning")

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

    _sep("MitM attack")
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
    controller(show-bottom: false)
    attacker(show-bottom: false)
    simulation(show-bottom: false)

    _grp("loop", desc: "every 20ms", {
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

    _grp("loop", desc: "every 20ms", {
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




