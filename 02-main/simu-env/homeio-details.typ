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

Home I/O is a smart home simulation platform that allows interaction with a wide range of sensors and actuators, as detailed in @subj:simu-env-homeio.
For the Man-in-the-Middle attack scenario, the entrance hall within this simulation is particularly relevant. As shown on @fig-simu-env-homeio-hall-doors the entrance hall has two doors with their sensor, one motion sensor and the house alarm. 


#figure(
  image("homeio-door.png", width: size-fig.homeio-details),
  caption: [Home I/O - Entrance Hall]
) <fig-simu-env-homeio-hall-doors>

Since Home I/O does not natively support Modbus communication, a custom *Go* software was developed by Michael Clausen to convert Modbus requests into the REST requests required by the simulation.
This software simulates a Modbus server for each room. In this thesis, the architecture consists of one computer running the simulation and another acting as the house controller, as shown in @fig-simu-env-homeio-implementation. The controller, functioning as a Modbus client, is implemented using another *Go* program that could be deployed on a Wago CC100 PLC in a real-world scenario. For the purposes of this thesis, the controller is intentionally kept simple.

#figure(
  image("implementation.drawio.svg", width: size-fig.homeio-details),
  caption: [#gls("mitm", long: false) scenario implementation]
) <fig-simu-env-homeio-implementation>

#pagebreak()

In this demonstration, the controller sends requests to check the status of both door sensors and the motion sensor. If either the door is open or motion is detected, the controller sends a request to the alarm to activate it. If not irregular activity is detected, the controller sends a request to deactivate the alarm.

The controller, the simulation and an attacker are all connected to the same network via a switch. This thesis uses a Kali Linux (@stack:mitm-kali) laptop, although the software can be execute on any device with the appropriate tools. 