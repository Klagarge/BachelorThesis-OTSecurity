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

#pagebreak()

#set page(
  paper: "a3",
  flipped: true
)

= Initial Planning <sec:planning>
//#heading(numbering:none)[Initial planning] <sec:planning-initial>

#tablex(
  columns: (1fr, 0.5fr, 1fr),
  stroke: none,
  [
    Before starting the implementation of some attacks, it's important to be well informed about all the topic around this project. This is why the first step is to do some research about #gls("ot") security. The simulation environment is important so that this Bachelor's thesis can be re-used in the laboratory. It's why i spend also a week on it (Hide on "Define Specifications"). Wireless communication is another non-trivial point that needs to be dealts with properly. \
    After all this researchs I have to properly explain everything on the first part of this report in @sec:analysis. It's a dedicated time for the report, but a bit of it is also done all along the project.
  ]
)

#include "../04-resources/planning.typ"

#tablex(
  columns: (1fr, 0.5fr, 1fr),
  stroke: none,
  [
    On Mid-term presentation, it's time to get to the heart of the matter. \
    *Create simulation environnement* involves to establish the link between the controller and the simulation environment that as been choosen (@sec:analysis-simu-env and @sec:analysis-conclusion). It's also include the creation of the wireless link with the protocol that will be used for the replay attack (@sec:analysis-comm and @sec:analysis-conclusion). \
    All *attack scenario* are describe in @sec:analysis-attacks and @sec:analysis-conclusion. \
    Independance week will happen in week 29, 30 and 31. 
    This thesis will end the #date.submission.display("[weekday], [day padding:none]th of [month repr:long] [year]") at 12pm with the render of the final report. 
  ]
)