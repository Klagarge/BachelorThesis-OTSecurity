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
  columns: (1fr, 6fr),
  rows: 1,
  stroke: none,
  [],
  [ 
    #text(24pt, underline("Défense TB")) \
    *Date :* 10/10/2024 \
  ]
)

#set heading(numbering: "1.1")
#show link: set text(blue)
#show link: underline

#line(length: 100%)

Bonjour à tous, merci à tous d'être venu à ma défense de travail de bachelor.

Mon travail de bachelor porte sur la sécurité OT. 

#line(length: 100%)
Mais qu'est-ce que ça veut dire OT ?
On peut l'opposer à l'IT, l'Information Technology, qui est le monde des ordinateurs, des serveurs, des réseaux.
L'OT, c'est l'Operational Technology, c'est le monde des systèmes embarqués, le domaine principales des infotroniciens. 
Mais pourquoi faire de la sécurité ?
Pendant longtemps, les systèmes embarqué n'avaient que peu de puissance de calculs et n'avaient pas la puissance nécessaire pour réaliser des opérations de cryptographie.
La stratégie était alors de faire un mur IT de protection autour de notre chaîne de production par example. 
Aujourd'hui, avec l'augmentation de l'IoT, nous voulons de plus en plus connecter nos systèmes embarqués et la frontière entre IT et OT devient de plus en plus étroite. 



