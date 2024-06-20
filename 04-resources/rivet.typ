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
        ),
        "1": (
          name: "RSSI",
        ),
        "2-10": (
          name: "App Data",
        ),
        "11-13": (
          name: "ELL",
        ),
        "14-21": (
          name: "LL_Header",
        ),
        "22": (
          name: "C",
        ),
        "23": (
          name: "L",
        )
      )
    )
  )
))