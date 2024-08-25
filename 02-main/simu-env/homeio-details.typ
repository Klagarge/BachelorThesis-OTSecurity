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

Home IO is a simulation of a smart home system that allows you to interact with a large number of sensors and actuators like describe in @subj:simu-env-homeio. In this simulator, the entrance hall is of particular interest for the #gls("mitm") attack scenario. As shown on @fig-simu-env-homeio-hall-doors the entrance hall have two doors with their sensor, one motion sensor and the house alarm. 

#figure(
  image("homeio-door.png", width: size-fig.homeio-details),
  caption: [Home I/O scene]
) <fig-simu-env-homeio-hall-doors>

As Home IO can not be interfaced by modbus directly, a Go software was made (by Michael Clausen) for convert Modbus request to REST required request by the simulation. This software is used to simulate one Modbus server by room. For this Thesis, architecture is composed about one computer with the simulation and one computer as the controller of the house as shown on @fig-simu-env-homeio-implementation. The controller, a Modbus client, is another go programme that can be put on a Wago CC100 PLC on real life. For the thesis this controller is very simple. 

#figure(
  image("implementation.drawio.svg", width: size-fig.homeio-details),
  caption: [#gls("mitm", long: false) scenario implementation]
) <fig-simu-env-homeio-implementation>

As it's just a demonstrator, the controller send request to get status of both door sensors and the motion sensor. If one door is open or if a motion is detected, the controller send a request to the alarm to activate it. Otherwise, the controller send a request to the alarm to deactivate it.

The controller, the simulation and an attacker are connected to the same network via a switch. This thesis was made under a kali linux (@stack:mitm-kali) laptop but can be done with any computer with the right tools. 

