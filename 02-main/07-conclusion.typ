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

= Project summary

#lorem(50)

= Comparison with the initial objectives

#lorem(50)

= Encountered difficulties

#lorem(50)

= Future perspectives

#lorem(50)
