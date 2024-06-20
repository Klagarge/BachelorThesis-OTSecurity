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

#pagebreak()

#set page(
  paper: "a3",
  flipped: true
)

#heading(numbering:none)[Initial planning] <sec:planning-initial>
#include "../04-resources/plannings/00-initial.typ"

#heading(numbering:none)[Final execution] <sec:planning-initial>
#include "../04-resources/plannings/00-initial.typ"