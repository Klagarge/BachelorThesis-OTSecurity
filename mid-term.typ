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

//----------------
//- INTRODUCTION -
//----------------
= Introduction
At #school.shortname, students specializing in #school.specialisation take a course on #gls("ot") Security. This course is somewhat outdated and will be redone for next year. The aim of my Bachelor's thesis is to create several attack scenarios that can be used in this course to create a laboratory module for students. These scenarios  could also be utilized in industrial training partnerships with #school.shortname. I will implement between three and four attack scenarios, including at least one wireless attack and one Modbus attack.

I chose this thesis due to my keen interest in Security and PEN-testing. Additionally, I already did some basic ethical hacking for fun and would like to specialize in security of embedded systems during the remainder of my studies. This thesis presents a valuable opportunity to delve into this field, and I have already enrolled for a master's degree to continue on this path.

This midterm report presents the planning of the thesis, an analysis of various attacks, communication medium and simulation environments and a conclusion outlining the next steps. 

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
This section discusses various attacks, communication mediums and simulation environments that could be used in the laboratory.
It aids in selecting the appropriate attack on the right medium and simulation environment, essential for the future laboratory. The brief for this thesis included using Modbus and considering performing an attack with the #gls("flipper") device. 

#subject(
  "03-analysis",
  heading-offset: 1,
  after:<sec:analysis>,
  before:<sec:conclusion>,
)

//--------------
//- CONCLUSION -
//--------------
// #pagebreak()
// = Conclusion <sec:conclusion>
// #todo([
// ])


#include "03-tail/glossary.typ"

//#include "03-tail/a-appendix.typ"

#if bib == true {
  include "03-tail/bibliography.typ"
}