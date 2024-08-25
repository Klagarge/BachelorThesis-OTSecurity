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

#heading(numbering:none)[Abstract] <sec:abstract>

#todo[
  Le résumé est une synthèse concise de l'ensemble de votre thèse, résumant les éléments clés sur une seule page, tels que
  - Informations générales
  - Objectif
  - Approche et méthode
  - Conclusions
]

#v(2em)
_*Keywords*_: _OT_, _security_, _man in the middle_, _modbus_, _replay_, _attack_, _flipper_