// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

As discussed on @subj:comm-modbus, Modbus is a straightforward protocol that was initially developed for serial communication via #gls("rtu") but is now commonly implemented over #gls("tcp")/#gls("ip").
This protocol operates in request-response mode, as illustrated in @fig:modbus-seq-req_repl.
In this setup, the controller sends a request to the Home I/O to retrieve a value or alter an output. The Home I/O then replies with the requested value or an acknowledgment message, after which the controller can issue another request or close the connection.

This request-response mechanism means that the attacker must capture traffic in both directions to modify packets in real-time effectively. The attacker needs to know the nature of the request to determine if the response needs alteration. Without this knowledge, it would be impossible to decide if a response needs to be modified.

In this thesis simulation, the controller is tasked with checking the status of two door sensors and a motion detector, all of which are connected to the same Modbus slave, the *Entrance Hall* (UnitID=5). The alarm system is represented as a coil on the same slave. A summary of these registers can be found in @tab:mobus-inputs_coils.

#table(
  columns: (1fr,1.25fr),
  stroke: none,
  inset: 0.25cm,
  align: center + horizon,
  table.cell(
    rowspan: 2,
    breakable: false
  )[
    #import "modbus-seq-req_repl.typ": *
    #figure(
      //image("modbus-seq-req_repl.svg", width: 100%),
      chronos.diagram(modbus-seq-req_repl, width: 100%),
      caption: [Home IO details],

    ) <fig:modbus-seq-req_repl>,
  ],
  [
    #figure(
      table(
        columns: (5fr, 1fr, 3fr, 1fr),
        align: center+horizon,
        [*Sensor / Actuator*],
        rotate(-90deg, reflow: true)[*Unit ID*],
        [*Fonction*],
        rotate(-90deg, reflow: true)[*Address*],
        align(left)[*Door exterior*], [5], [Discrete\ Inputs], [13],
        align(left)[*Door garage*], [5], [Discrete\ Inputs], [14],
        align(left)[*Motion detector*], [5], [Discrete\ Inputs], [15],
        align(left)[*Alarm*], [5], [Coils], [5],
      ),
      caption: [Modbus Registers],
    ) <tab:mobus-inputs_coils>,
  ]
)