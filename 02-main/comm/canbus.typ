// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

= Canbus  <subj:comm-canbus>
Canbus is a communication protocol developed by Bosch in 1986. It is widely used in automobile industry. 
#todo([])