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
 The aim of a replay attack is to send again a message previously sniffed as if the original device had sent it #cite(<Wikipedia-ReplayAttack2024>). As we can see in @fig-attack-replay Mallory sniff the message between Alice and Bob. Mallory can send the message to Bob as if Alice had sent it. #gls("ot") is specially vulnerable to this kind of attack by wireless communication. The typical example of this kind of attack is the replay of a command to open a garage door. The attacker sniffs the command and replay it to open the door.

 == Security Measures
 Two main ways exist to protect against replay attack. It depends on if it broadcast or bidirectional communication.
 
 When both device communicates together, it's possible to add a timestamp to the message and sign the hash. 

 When communication is broadcast, the sender device is often without any connection to other devices. In this case, it's not possible to have a timestamp. A good way to secure against replay attack is to use a rolling code. The rolling code is a code that changes at each message. Both devices use a pseudo-random number generator to generate the code. The receiver device can check if the code is in the next code sequence. 
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