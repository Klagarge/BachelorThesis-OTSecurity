// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

= #gls-short("wmbus")  <subj:comm-wmbus>
#gls("wmbus") #cite(<EN13757>, supplement:[part. 4]) is a wireless adaptation of the #gls("mbus") #cite(<EN13757>) protocol. This protocol is used in Europe for metering applications. 
#todo("")