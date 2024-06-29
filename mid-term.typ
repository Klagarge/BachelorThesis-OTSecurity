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
It aids in selecting the appropriate attack on the right medium and simulation environment, essential for the future laboratory. The requirements of this thesis include the use of Modbus and an attack with the #gls("flipper") device. 

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
In conclusion, this midterm report provides a comprehensive overview of the initial phase of this bachelor's thesis. After reviewing the schedule and discussing sustainability, the core of this report contains the analysis part of the thesis. We have determined that the simulation environment will be Home I/O and identified three key attacks that will be carried out.

+ *Replay attack on a wireless device.* This attack will be probably carried out on a #gls("wmbus", long: true) electricity meter. If this proves too challenging within the available time, an alternative would be to target the garage door remote control using simple #gls("ook") modulation on 433 MHz. One potential countermeasure to protect against this attack, have to be confirmed later, would be implementing a rolling code.

+ *#gls("dos", long: true) attack on an external sensor.* This attack will involve flooding the #gls("plc") with valid messages at a frequency too high for the #gls("plc") to handle, effectively overloading it. To mitigate this, a better programming design will have to be developed.

+ *#gls("mitm", long: true) attacks.* Two phases of #gls("mitm") attack will be conducted on Modbus communication. The first will target an unencrypted Modbus #gls("tcp") communication. Protection against this will involve implementing a symmetrical key exchanged using #gls("d-h"). The second phase will exploit the key exchange process, demonstrating that if an attacker is present from the start, it is impossible to guarantee the authenticity of the communication partner. Utilizing certificates is the only way to ensure secure communication. So Modbus over #gls("tls") will be used instead of #gls("tcp") to protect against this attack.

This foundational analysis sets the stage for the subsequent phases of the project. The next steps will include mastering Modbus communication with Home I/O and executing the #gls("mitm") attack on this protocol, followed by the other planned attacks. The development of the #gls("wmbus") interface remains a critical task for future task on this thesis. 


#pagebreak()
= Glossary <sec:glossary>
#include "03-tail/glossary.typ"

//#include "03-tail/a-appendix.typ"

#if bib == true {
  include "03-tail/bibliography.typ"
}