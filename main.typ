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
#pagebreak()
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
//#subject("planning", heading-offset: 0)

#pagebreak()

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

The Man-in-the-Middle (MitM) scenario focuses on intercepting, modifying, and forwarding packets to gain control over a Modbus/#gls("tcp") installation. This protocol, commonly used in industrial settings, was selected for this thesis because it is widely adopted and fulfils the requirement to demonstrate an attack on it. The #gls("mitm") attack was chosen due to its prevalence and potential for significant impact. It is a comprehensive attack that encompasses several other techniques, such as sniffing and spoofing through #gls("arp", long: false) poisoning. This scenario assumes that the attacker has already gained access to the network, enabling them to intercept and manipulate the data packets.

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

The replay attack scenario involves intercepting and resending a message on a wireless connection to trigger the same effect as the original message, like, for example, a garage door opening remote.
This scenario is particularly engaging because it can be easily implemented with the #gls("flipper") device, making it more interactive and enjoyable for students to witness a physical attack in action. Additionally, it highlights the significance of wireless attacks, a critical topic in the #gls("ot") world. This scenario operates at the physical layer, providing a complementary perspective to the #gls("mitm", long: false) scenario discussed in @sec:mitm.

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