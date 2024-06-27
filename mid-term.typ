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
At #school.shortname, students in #school.specialisation specialisation have a course on #gls("ot") Security. This course is getting a bit old and will be redone for next year. The aim of my Bachelor thesis is too create some attack scenario that can be use on this course for made an laboratory with students. This cases could also be used for industrial formation partenership with #school.shortname. I should implement between 3 and 4 attack scenario with at least one wireless and one with modbus.

I choose this Thesis due ok my keen interest in Security and PEN-testing. I already did some basic hetickal hacking for fun and would like to specialise in security of embedded systems during the remainder of my studies. This Thesis is a good opportunity to start in this field and I already enrolled for a master's degree to continue on this way.

This midterm report will present the planning of the Thesis, an analysis of some attacks, some communication medium and some simulation environments and finally a conclusion and next steps of my Thesis. 

//------------
//- PLANNING -
//------------
#subject("planning", heading-offset: 0)


//------------
//- ANALYSIS -
//------------
#pagebreak() 
= Analysis <sec:analysis>
This section will abord some attacks, communication medium and simulation environments that could be used in the laboratory.
This section is helpful for choosing the right attack on the right medium and the right simulation environment been usefull for the futur laboratory. For the communication medium, it was on the brief of this Thesis to use modbus. For wireless medium, it have to keep it mind that the aim is to perform an attack with the #gls("flipper")

#subject(
  "03-analysis",
  heading-offset: 1,
  after:<sec:analysis>,
  before:<sec:conclusion>,
)

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