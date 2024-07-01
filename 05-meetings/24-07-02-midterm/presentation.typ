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

Mon travail de bachelor porte sur la sécurité des systèmes embarqués. #line(length: 100%)
Ce travail prend racine dans la refonte du laboratoire d'OT Security.\
C'est un labo qui a lieu en 3e année infotronic. 

Mon travail consiste à créer plusieur scénario de sécurité, qui pourront être utilisé .. dans la refont de ce laboratoire. \
Ces scénarios pourront également être utilisé dans le cadre de la formation de partenaire industriel.
#line(length: 100%)
Je dois implémenter entre trois et quatre scénarios d'attaque,.. incluant au moins une attaque sans fil .. et une attaque sur une communication Modbus.
Ces scénarios d'attaque se sera: 
- une situation non sécurisé
- une attaque
- une solution pour contrer cette attaque.

J'ai donc choisit de faire les 3 attaques suivantes: 
#line(length: 100%)
1. Replay attaque sur un système sans fils. \ Cette attaque consiste à ré-injecter un paquet qu'on a pus intercepter au préalable. \ L'intérêt ici pour moi ici il est de réaliser cette attaque sur la couche physique.. Comme ça, il n'est pas nécessaire de comprendre le contenu des trames, .. seulement leur effet.
#line(length: 100%)
2. Attaque par déni de service. \ Le principe ici s'est de surcharger ..le controller .. ou .. le canal de communication.. On fait ça en envoyant plus de requête que c'qui peut être traité. \ Je trouve ça bien plus intéressant de surcharger le controller en lui envoyant des requêtes valide... Ainsi il va les traîter et ne pourra plus traîter les vrais requêtes.
#line(length: 100%)
3. Attaque par l'homme du milieu. Cette attaque consiste à se mettre sur le réseau, et pouvoir .. intercepter, .. modifier .. ou .. ré-injecter n'importe quel paquet. \ Moi j'aimerai bien réaliser cette attaque en deux parties. \ Premièrement,  venir se greffer sur une communication déjà établis entre Alice et Bob mais sans encryption quel quelle soit. \ Ici,  il est plutôt simple de se faire passer pour quelqu'un d'autre... \ Pour sécuriser contre cette impersonification .. l'objectif dans cette première phase, .. c'est de mettre en place .. une communication chiffé par clé symétrique .. dont la création se ferait par un échange Diffie-Helmann. \ La deuxième partie, c'est de reprendre cette communication chiffré .. et de montrer que si Mallory était là depuis le début, .. on ne peut pas garantir que l'on n'envoie notre mot de passe au bon destinataire.. \ (Cette attaque est nettment plus complexe) \ La seul solution c'est d'utiliser les certificats signé par un tiers .. dont la confiance est déjà établis.
#line(length: 100%)

En OT Security, ce qui est particulièrement vulnérable c'est la transmission car historiquement, la sécurité a toujours été faible voir absente. \ Mes attaques auront donc lieu en partie sur du filaire et en partie sur du sans fils. 
#line(length: 100%)
Pour le filaire, je vais utiliser le Modbus.\
Ce protocol est très répandu dans l'industrie .. de par sa simplicité .. et sa légèreté. \
Le Modbus est un protocol applicatif .. binaire .. qui peut être transporté .. soit par RS232/484 .. (Modbus RTU), .. soit par TCP .. (Modbus TCP). Je réaliserai donc l'attaque Man in the Middle sur du Modbus TCP. 
#line(length: 100%)
Pour la replay attaque, le choix c'est porté sur le wireless m-bus. C'est un protocol utilisé en europe pour toutes la application de comptage/mesure. Il s'agit d'une adaptation sans fils du protocol m-bus