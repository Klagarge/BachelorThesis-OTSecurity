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
    #text(24pt, underline("Présentation ")) \
    *Date :* 02/07/2024 \
  ]
)

#set heading(numbering: "1.1")
#show link: set text(blue)
#show link: underline

Bonjour à tous, 

Mon travail de bachelor porte sur la sécurité des systèmes embarqués. \
Ce travail prend racine dans la refonte du laboratoire d'OT Security.\
C'est un labo qui a lieu en 3e année infotronic. 

Mon travail consiste à créer plusieur scénario de sécurité, qui pourront être utilisé .. dans la refont de ce laboratoire. \
Ces scénarios pourront également être utilisé dans le cadre de la formation de partenaire industriel. \
Je vais implémenter entre trois et quatre scénarios d'attaque,.. incluant au moins une attaque sans fil .. et une attaque sur une communication Modbus.
Ces scénarios d'attaque se sera: 
- une situation non sécurisé
- une attaque
- une solution pour contrer cette attaque.

J'ai donc choisit de faire les 3 attaques suivantes: 
1. Replay attaque sur un système sans fils. \ Cette attaque consiste à ré-injecter un paquet qu'on a pus intercepter au préalable. \ L'intérêt ici pour moi ici il est de réaliser cette attaque sur la couche physique.. Comme ça, il n'est pas nécessaire de comprendre le contenu des trames, .. seulement leur effet.

2. Attaque par déni de service. \ Le principe ici s'est de surcharger ..le controller .. ou .. le canal de communication.. On fait ça en envoyant plus de requête que c'qui peut être traité. \ Je trouve ça bien plus intéressant de surcharger le controller en lui envoyant des requêtes valide... Ainsi il va les traîter et ne pourra plus traîter les vrais requêtes.

3. Attaque par l'homme du milieu. Cette attaque consiste à se mettre sur le réseau, et pouvoir .. intercepter, .. modifier .. ou .. ré-injecter n'importe quel paquet. \ Moi j'aimerai bien réaliser cette attaque en deux parties. \ Premièrement,  venir se greffer sur une communication déjà établis entre Alice et Bob mais sans encryption quel quelle soit. \ Ici,  il est plutôt simple de se faire passer pour quelqu'un d'autre... \ Pour sécuriser contre cette impersonification 