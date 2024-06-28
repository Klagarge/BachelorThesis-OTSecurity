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
  This attack consists in listening to the communication between two devices #cite(<Wikipedia-SniffingAttack2023>). It can be performed on every communication medium with varying levels of difficulty. Wireless communication is particularly vulnerable because anyone can intercept the signals. For example, in @fig-attack-sniffing, Alice sends a message to Bob over the air without encryption, allowing Eve to listen to and read the message.
  
  A sniffing attack can be performed to get secret information or understand a chemical recipe, for example. This attack can also be used for other attacks.

  == Security Measures
  To protect against sniffing attack, the communication must be encrypted. The encryption must be strong enough to not be broken by the attacker. A simple encryption by symmetrical key, worth it. A specific attention to the key exchange must be done. At least an exchange with Diffie-Hellman protocol is recommanded to be protected against sniffing attack.
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