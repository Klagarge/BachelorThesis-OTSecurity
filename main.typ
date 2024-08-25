#import "00-templates/template-thesis.typ": *
#import "01-settings/metadata.typ": *
#show: thesis.with(
  title: title,
  midterm: false,
  subtitle: subtitle,
  version: version,
  author: author,
  professor: professor,
  expert: expert,
  school: school,
  date: date,
  tableof: tableof,
  icons: icons,
)
#counter(page).update(1)
#if bib == true {
  bib-state.update(true)
}

//-------------------------------------
// Content
//

#include "02-main/00-acknowledgements.typ"
#include "02-main/01-abstract.typ"

//----------------
//- INTRODUCTION -
//----------------
= Introduction
#subject(
  "02-introduction",
  heading-offset: 1,
)

//------------
//- PLANNING -
//------------
#subject("planning", heading-offset: 0)

//------------------
//- SUSTAINABILITY -
//------------------
#subject("sustainability", heading-offset: 0)

//------------
//- ANALYSIS -
//------------
#pagebreak() 
= Analysis <sec:analysis>
This section discusses various attacks, communication media and simulation environments that could be used in the laboratory.
It aids in selecting the appropriate attack on the right medium and simulation environment, essential for the future laboratory. The requirements of this thesis include the use of Modbus and an attack with the #gls("flipper") device. 

#subject(
  "03-analysis",
  heading-offset: 1,
  after:<sec:analysis>,
  before:<sec:mitm>,
)

//--------
//- MITM -
//--------
#pagebreak()
= Man in the Middle Scenario <sec:mitm>

The Man in the Middle scenario involves intercepting, modifying and sending packets to take over the control of a Modbus/TCP installation. This attack is made on a Modbus/#gls("tcp") installation, which is a widely used protocol in the industry and mainly because it was required to do an attack on it for this thesis. This attack was choosen because it is a common attack and can have big impact. It is also a complete attack, in other words, this attack includes several other attacks like sniffing and spoofing with #gls("arp", long: false) poisoning. To perform such an attack, we assume that the attacker has access to the network to be able to intercept the packets.


#subject(
  "04-mitm",
  heading-offset: 1,
  after:<sec:mitm>,
  before: <sec:replay>,
)

//----------
//- REPLAY -
//----------
#pagebreak()
= Replay Scenario <sec:replay>
#todo[
  #lorem(50)
  - introd
  - pourquoi
  - sans fils
  - comment
  - flipper
]

The replay scenario involves intercepting and resending a message on a wireless connection to trigger the same effect as the original message, like for example a garage door opening remote.

#subject(
  "05-replay",
  heading-offset: 1,
  after:<sec:replay>,
  before:<sec:conclusion>,
)

//-------
//- DoS -
//-------
// #pagebreak()
// = Denial of Service Scenario <sec:dos>
// #todo[
//   -toto
// ]

// #subject(
//   "06-dos",
//   heading-offset: 1,
//   after: <sec:dos>,
//   before: <sec:conclusion>,
// )

//--------------
//- CONCLUSION -
//--------------
#pagebreak()
= Conclusion <sec:conclusion>
#todo[
  - résumé
  - résultats
  - usage pour un labo
  - difficultés
]

#subject(
  "07-conclusion",
  heading-offset: 1,
)


#pagebreak()
= Glossary <sec:glossary>
#include "03-tail/glossary.typ"

//#include "03-tail/a-appendix.typ"

#if bib == true {
  include "03-tail/bibliography.typ"
}