// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

#set page(width: 5cm, height: auto)

#let modbus-seq-req_repl = {
  import chronos: *
  controller(show-bottom: false)
  simulation(show-bottom: false)

  _seq("c", "s", end-tip: ">>", comment: "1. Ask value of sensor #15") 
  _seq("c", "s", end-tip: ">>", comment: "2. Ask value of sensor #13")
  _seq("s", "c", end-tip: ">>", comment: "1. Value = 1")
  _seq("s", "c", end-tip: ">>", comment: "2. Value = 0")
}


#chronos.diagram(modbus-seq-req_repl, width: 100%)