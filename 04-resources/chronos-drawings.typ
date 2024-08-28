#import "/00-packages/chronos/src/lib.typ" as chronos

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
        custom-image: image("/04-resources/stack/home-io.png",
            width: 1.5cm,
            height: 1.5cm,
            fit: "contain"
        ),
        show-bottom: show-bottom
    )
}
#let c = "c"
#let a = "a"
#let s = "s"

#let sync(
    actor1,
    actor2,
    comment,
    dashed: false,
    flip: false
) = {
    import chronos: *
    _seq(
        actor1,
        actor2,
        comment: comment,
        comment-align: comment-align,
        dashed: dashed,
        flip: flip
    )
}

#let async(
    actor1,
    actor2,
    comment,
    flip: false,
    dashed: false,
    slant: auto
) = {
    import chronos: *
    if actor1 == actor2 {
        slant = none
    }
    _seq(
        actor1,
        actor2,
        end-tip: ">>",
        comment: comment,
        comment-align: "start",
        dashed: dashed,
        flip: flip,
        slant: slant
    )
}


#let tcp = {
    import chronos: *
    controller(show-bottom: false)
    //attacker(show-bottom: false)
    simulation(show-bottom: false)
    
    async(c, s, "Modbus request")
    async(s, c, "ACK", dashed: true)
    async(s, c, "Modbus answer")
    async(c, s, "ACK", dashed: true)
}

#chronos.diagram(tcp)

