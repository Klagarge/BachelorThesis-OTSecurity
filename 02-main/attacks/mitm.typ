// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

= Man in the Middle - Connected  <subj:attack-mitm>
#todo("")

= Man in the Middle - Full interception <subj:attack-mitm-full>
#todo("")