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
This attack is especially in the context of network security. A spoofing attack is when an attack can impersonate another device. This attack is mainly used in combination of other attacks. For example, it's especially used for Wi-Fi communication with fake Wi-Fi hotspot.
This attack is less interesting in the context of OT security. We won't take more about this attack in the following pages.