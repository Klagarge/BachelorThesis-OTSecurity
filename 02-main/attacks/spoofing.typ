// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

= Spoofing  <subj:attack-spoofing>
This attack is escpecially in the context of network security. A spoofing attack is when an attack can impersonnate another device. This attack is mainly use in combination of other attacks. For example it's escpecially used on wifi communication with fake wifi hotspot.
This attack is less interresting in the context of OT security. We won't takl more about this attack in the followinf pages.