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
  
  A sniffing attack can be performed to get secret information or understand a chemical recipe, for example. It can also be used as part of other more complex schemes.

  == Security Measures
  To protect against sniffing attacks, the communication must be encrypted. The encryption must be strong enough to resist the attacker. A simple symmetrical encryption is enough. Particular attention must be paid to the key exchange. Protocols such as Diffie-Hellman with symmetrical encryption are recommanded to ensure protection against sniffing attacks.
]

#let fig = [
  #figure(
    image("abe.png", width: size-fig.attacks),
    caption: [Sniffing attack]
  ) <fig-attack-sniffing>
] 

#wrap-content(
  fig,
  body,
  align: top + right,
)