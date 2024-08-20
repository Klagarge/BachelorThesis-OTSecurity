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

// Vue d'enssemble de home io, description, plan, hall, porte et capteur, automate
// Exigence de mitm, modification sans détection
// Comment fonctionne Modbus
// 2 étapes sans chiffrement, puis certificat

// 1. TCP
// comment fonctionne TCP
// Stack
// on the fly
// 

= Simulation Environnement
#subject(
  "simu-env/homeio-details",
  heading-offset: 1
)

= Requirements
#todo[
  - Exigence de mitm
  - Modification sans détection
  - Comment fonctionne Modbus
  - 2 étapes sans chiffrement, puis certificat
]

== Closer look on Modbus
#todo[
  - Request-Response
  - Modbus TCP
  - 
]

= Attack on Modbus/TCP
== Closer look on TCP
== Modify packet on the fly

= Implement Modbus/TLS
== Closer look on TLS
#todo([
  - encryption
  - certificat
  - handshake
  - 
])


