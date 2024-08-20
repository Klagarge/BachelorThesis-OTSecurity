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

#set page(
  //paper: "a3",
  width: 420mm,
  height: auto,
  //flipped: true
)

//#include "/04-resources/planning.typ"
#include "/04-resources/planningreel.typ"

