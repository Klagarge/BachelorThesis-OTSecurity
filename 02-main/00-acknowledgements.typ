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

#heading(numbering:none)[Acknowledgements] <sec:ack>

#todo[
  Bien que facultatifs, les remerciements sont l'occasion d'exprimer votre gratitude envers les personnes, les institutions ou les organisations qui vous ont soutenu tout au long de votre parcours universitaire.
  Bien qu'ils n'aient pas d'impact sur l'évaluation, les remerciements contribuent au ton général et à l'appréciation de votre thèse.
]
