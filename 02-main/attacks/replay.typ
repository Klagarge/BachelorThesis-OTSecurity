// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

= Replay  <subj:attack-replay>
#let body = [
 A replay attack involves resending a previously intercepted message as if it were from the original sender #cite(<Wikipedia-ReplayAttack2024>). As we can see in @fig-attack-replay Mallory sniffs the message between Alice and Bob. Mallory can then send the message to Bob as if Alice had sent it.
 This is particularly relevant in #gls("ot") environment with wireless communication, such as the typical example: replaying a command to open a garage door. The attacker sniffs the command and replays it to open the door.

 == Security Measures
 Two main ways exist to protect against replay attacks. It depends on whether the communication is broadcast or bidirectional.
 
 When both devices communicate together in a bidirectional transmission, it is possible to add a timestamp to the message and sign the hash.

 When communication is broadcast, the sender device is often not directly connected to other devices. In this case, it is not possible to have a timestamp. Using rolling codes is a good way to secure against replay attacks. The rolling code is a value that changes at each message. Both devices use a pseudo-random number generator. The receiver device can check whether the code matches the next in the sequence. 
]

#let fig = [
  #figure(
    image("replay.png", width: size-fig.attacks),
    caption: [Replay attack]
  ) <fig-attack-replay>
]
#wrap-content(
  fig,
  body,
  align: top + right,
)