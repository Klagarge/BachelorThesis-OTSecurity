// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

= Sniffing Attack  <subj:attack-sniffing>

#let body = [
  This attack consists in listening to the communication between two devices #cite(<Wikipedia-SniffingAttack2023>). Sniffing attack can be performed on every communication medium with more or less simplicity. The most vulnerable are wireless communication because everybody can listen to what's on the air. For example, in @fig-attack-sniffing Alice sends a message to Bob over the air without any encryption. Eve can listen to the message and read it. She knew that Alice sends a message to Bob and what the message was.
  
  A sniffing attack can be performed to get secret information or understand a chemical recipe, for example. The attack wants in most case to understand the message. This attack can also be use for other attacks.

  == Security Measures
  To protect against sniffing attack, the communication must be encrypted. The encryption must be strong enough to not be broken by the attacker. A simple encryption by symmetrical key, worth it. A specific attention to the key exchange must be done. At least an exchange with Diffie-Hellman protocol is recommanded for be protected against sniffing attack.
]

#let fig = [
  #figure(
    image("sniffing.png", width: size-fig.attacks),
    caption: [Sniffing attack]
  ) <fig-attack-sniffing>
] 

#wrap-content(
  fig,
  body,
  align: top + right,
)