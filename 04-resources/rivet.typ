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

#let test-typ = rivet.schema.load((
  structures: (
    main: (
      bits: 24,
      ranges: (
        "0": (
          name: "CRC",
          description: "Cyclic Redundancy Check",
        ),
        "1": (
          name: "RSSI",
          description: "Received Signal Strength Indicator",
        ),
        "10-2": (
          name: "App Data",
        ),
        "13-11": (
          name: "ELL",
          description: "Encrypted Link Layer",
        ),
        "21-14": (
          name: "LL_Header",
          description: "Link Layer Header",
        ),
        "22": (
          name: "C",
          description: "Control",
        ),
        "23": (
          name: "L",
          description: "Length",
        )
      )
    )
  )
))


#let modbus-tcp-packet = rivet.schema.load((
  structures: (
    main: (
      bits: 24,
      ranges: (
        "0": (
          name: "CRC",
          description: "Cyclic Redundancy Check",
        ),
        "1": (
          name: "RSSI",
          description: "Received Signal Strength Indicator",
        ),
        "10-2": (
          name: "App Data",
        ),
        "13-11": (
          name: "ELL",
          description: "Encrypted Link Layer",
        ),
        "21-14": (
          name: "LL_Header",
          description: "Link Layer Header",
        ),
        "22": (
          name: "C",
          description: "Control",
        ),
        "23": (
          name: "L",
          description: "Length",
        )
      )
    )
  )
))

//#rivet.schema.render(test-typ, config: rivet.config.config(full-page: true))

#rivet.schema.render(modbus-tcp-packet, config: rivet.config.config(full-page: true))