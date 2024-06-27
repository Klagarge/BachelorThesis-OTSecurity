#import "00-templates/template-thesis.typ": *
#import "01-settings/metadata.typ": *
#show: thesis.with(
  title: title,
  midterm: true,
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

//------------
//- PLANNING -
//------------
#subject("planning", heading-offset: 0)


//------------
//- ANALYSIS -
//------------
#pagebreak() 
= Analysis <sec:analysis>
#todo("")

#subject(
  "03-analysis",
  heading-offset: 1,
  after:<sec:analysis>,
  before:<sec:conclusion>,
)

//----------
//- DESIGN -
//----------
/*
#pagebreak()
= Design <sec:design>

#todo("")

#subject(
  "04-design",
  heading-offset: 1,
  after:<sec:design>,
  before:<sec:conclusion>,
)
*/

//--------------
//- CONCLUSION -
//--------------
#pagebreak()
= Conclusion <sec:conclusion>
#todo([
])


#include "03-tail/glossary.typ"

//#include "03-tail/a-appendix.typ"

#if bib == true {
  include "03-tail/bibliography.typ"
}