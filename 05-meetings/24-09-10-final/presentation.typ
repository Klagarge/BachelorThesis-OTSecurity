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

On peut l'opposer à l'IT, ... l'Information Technology, ... qui est le monde des ordinateurs, des serveurs, des ISC.\
L'OT, c'est l'Operational Technology,.. c'est le monde des systèmes embarqués,.. le domaine principales des infotroniciens. 

Mais pourquoi faire de la sécurité ?

Pendant longtemps, les systèmes embarqué n'avaient que peu de puissance de calculs, et n'avaient pas la puissance nécessaire pour réaliser des opérations de cryptographie.\
La stratégie était alors de faire un mur IT de protection autour de notre chaîne de production par example. 
Aujourd'hui, avec l'augmentation de l'IoT, nous voulons de plus en plus connecter nos systèmes embarqués et la frontière entre IT et OT devient de plus en plus étroite, rapprochant les attaquant du monde OT. 
Les systèmes embarqués sont aussi de plus en plus puissant permettent maintenant de réaliser des opérations de cryptographie.
Depuis quelques années, certains indutriel commencent à mettre de la sécurité dans leurs systèmes embarqués, mais de trop nombreuses mauvaises pratiques sont encore présentes.

#line(length: 100%)

La HEI fait depuis quelques année un cours de sécurité à ses étudiants de 3ème année infotronic. Mais ce cours est générique et la HEI veut mettre à jour se cours et se concentrer sur la sécurité OT. Mon travail de bachelor prend racine dans ce contexte. Mon objectif est de fournir plusieurs scénarios de sécurité qui pourront être tant utilisé pour la refonte de ce cours et la création du labo qui va avec. Ces scénarios sont composé d'une situation non sécurisé, d'une attaque et d'une solution pour se protéger de ce genre d'attaque. Ils pourront aussi être utilisé pour la formation de partenaire industriel ou simplement pour de la sensibilisation.

Je vais donc vous présenter les scénarios que j'ai développé.
- Un scénario basé sur une replay attaque sur un système sans fils
- Un deuxième scénario basé sur une attaque par l'homme du milieu sur du modbus/TCP
- L'évolution de ce scénario avec une falsification, attaque et mise en garde concernant les limites de TLS. 

#line(length: 100%)

L'attaque par rejeu consiste à enregistre un message et le rejouer pour déclencher les mêmes effet. 

#line(length: 100%)

L'Environnement initiallement prévu pour ce scénario est basé sur une communication Wireless M-Bus. Il s'agit de la version sans fils du protocole M-Bus largement utilisé en Europe pour des applications de compteur d'eau, de gaz ou d'électricité. C'qui nous intéresse c'est le mode T qui permet par example à notre fournisseur de faire le relever simplement en passant dans la rue, car le compteur va envoyer les données periodiquement. C'est une communication moyenne distance, basse consommation et mono-directionnel. L'idée c'est de venir enregistrer des messages grâce a un Flipper Zero. Le flipper, c'est un ce petit outil, que vous avez déjà probablement vu, qui permet de mettre un premier pas dans le monde de la sécurité OT. C'est un véritable couteau suisse, il peut faire aussi bien du sub Ghz que du NFC ou bluetooth. Mais il faut faire attention, ce n'est pas le meilleur outil dans chaqu'un de ces domaine, il est simplement très polyvalent. 
Bien, une fois qu'on a enregistré les données envoyé par notre compteur, par example pendant nos 2 semaines de vacances histoire d'avoir une basse consommation. On peut rejouer ces messages pour faire croire à Oiken que notre consommation reste très faible. 
On a donc procédé à une attaque par rejeu sur la couche physique, donc layer 1 du modèle OSI. 

#line(length: 100%)

Mais ça c'était l'idée initiale. Dans mes premières recherche sur le Flipper Zero, j'ai vu qu'il était capable de faire une large gamme de modulation, dont la modulation du wirless M-Bus en mode T. Capable ne veut pas dire que c'est implémenté. Oui, la puce TI qui est dedans est capable de faire cette modulation. Mais les différents firmware du Flipper n'implémente pas cette modulation. On a donc, ici une analyse spectral de signal du transceiver Wireless M-Bus qui clairement dans une modulation GFSK à plus ou moins 50 kHz de la porteuse de 868.95 MHz. On y voit bien les petis pics et les harmoniques. 


