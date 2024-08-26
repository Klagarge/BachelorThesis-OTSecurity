// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

As we see on @subj:comm-modbus, Modbus is an easy protocol that was originally buid on #gls("rtu") and nowadays on #gls("tcp").
This protocol operate in request-response mode like shown on @fig:modbus-seq-req_repl. The controller request the HomeIO for a value or to change an output. The HomeIO will then respond with the value or an acknowledge message. The controller can then send another request or close the connection.

This way of working involves that the attacker have to sniff the communication in both way to be able to modify the packet on the fly. Indeed the attacker can not know if he has to modify the answer without knowing if the request was for an input he want to modify.

On the simulation, for this Thesis, the goal is to check both door sensor and the motion detector. All are on the same Modbus slave, the *Entrance Hall* (UnitID=5). The Alarm is a coil on the same slave. A summary of this register are available on @tab:mobus-inputs_coils.

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