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
In network security, spoofing involves impersonating another device. This attack is often used in combination to other attacks, such as creating a fake Wi-Fi hotspot.
In the context of #gls("ot") security, spoofing is less relevant and will not be discussed further in this thesis.