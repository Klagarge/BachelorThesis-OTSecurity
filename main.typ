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
#todo[
  #lorem(50)
]

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
]

#subject(
  "05-replay",
  heading-offset: 1,
  after:<sec:replay>,
  before:<sec:dos>,
)

//-------
//- DoS -
//-------
#pagebreak()
= Denial of Service Scenario <sec:dos>
#todo[
  #lorem(50)
]

#subject(
  "06-dos",
  heading-offset: 1,
  after: <sec:dos>,
  before: <sec:conclusion>,
)

//--------------
//- CONCLUSION -
//--------------
#pagebreak()
= Conclusion <sec:conclusion>
#todo[
  #lorem(50)
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