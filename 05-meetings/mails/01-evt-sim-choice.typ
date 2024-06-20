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
= Rémi to Michael & Medard - Simulation environment choice
Good evening,\
\
Please find attached the minutes of today's meeting.\
I summarize attack scenarios, and we talk about the simulation environment. \
\
I have a preference for  Minecraft, but Factory I/O also seems like a good simulation environment.\
Concerning the wireless protocol, I have a slight preference for Zigbee, which is more widely used and better known, but if you think it's more appropriate to use wireless M-Bus, that's fine with me.\
\
Best regards,\
Rémi\

#line(length: 100%)
#include "../24-06-10-simulation_environment/PV.typ"
#line(length: 100%)
#include "../24-06-10-simulation_environment/slides.typ"

#line(length: 100%)
= Michael to Rémi
Hi Remi, we did decide to use Home I/O. The reason is that the course or at least a part of the course is potentially given to ETE students and maybe even ISC students. For those the Home I/O could be exactly what we need.
#line(length: 100%)
= Rémi to Michael
Okay, I also talked about this with Medard at the end of the day yesterday. The simulation environment doesn't really matter for my bachelor's work. I'm focusing on the communication part. Which sensor/actuator behind isn't really important. For my work, he told me I could interface with Minecraft as well, if I preferred 
#line(length: 100%)
= Michael to Rémi
Well that matters. At least for the replay attack.
We can open the garage door and break in using a replay attack.
= Rémi to Michael