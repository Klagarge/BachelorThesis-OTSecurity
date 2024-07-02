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


#table(
  columns: (3fr, 2fr),
  rows: 1,
  stroke: none,
  [],
  [
    #image("../../04-resources/logos/FR-DE_HEI_rvb.png")
  ]
)

#table(
  columns: (1fr, 6fr),
  rows: 1,
  stroke: none,
  [],
  [ 
    #text(24pt, underline("PV ")) \
    *Date :* 17/06/2024 \
    *Houre :* xxhxx $arrow$ xxhxx \
    *Participants :* M. Rieder, M. Clausen et R. Heredero \
    //*Next meeting :*  \

  ]
)

#set heading(numbering: "1.1")
#show link: set text(blue)
#show link: underline

= 
matrice de risque
parler de reverse engeenering
Plus de contexte
Expliquer pourquoi tel choix
Montrer quel couche
