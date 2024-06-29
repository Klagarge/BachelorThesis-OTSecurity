// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
    set heading(numbering: "1.")
  }
} // END OF HEADER

= #gls-long("mitm") - Connected  <subj:attack-mitm>
#let body-mitm = [
  A #gls("mitm") attack occurs when a third party can intercept actively, modified or send packets on a network #cite(<Wikipedia-ManinthemiddleAttack2024>). Commonly, this involves connecting a new device to a star or bus network topology. Once connected to the network, Mallory (@fig-attack-mitm) can perform a sniffing attack or send a message. The aim is often to understand an Alice message, modified it and send it to Bob.

  == Security Measures
  Encryption with a symmetrical key can be used to protect the message from being intercepted, modified or impersonated. The key can be exchanged with a standard #gls("d-h") exchange.
]

#let fig-mitm = [
  #figure(
    image("mitm-connected.png", width: size-fig.attacks),
    caption: [#gls("mitm", long: false) on a connected network]
  ) <fig-attack-mitm>
]
#wrap-content(
  fig-mitm,
  body-mitm,
  align: top + right,
)

#pagebreak()
= #gls-long("mitm") - Full interception <subj:attack-mitm-full>
#let body-mimt-full = [
  When Mallory is on the gateway or between Alice and Bob like in @fig-attack-mitm-full Mallory can intercept all messages and neither Alice nor Bob can be sure that they send and receive messages to the right person. This is the most dangerous attack because Mallory can impersonate Alice and Bob and send a message to the other person.
  Even with the security measures see on @subj:attack-mitm, Mallory was able to impersonate Alice and Bob with create its own key with each other. This is why a #gls("mitm") attack is so dangerous.

  == Security Measures
  When a Mallory attacker can intercept all messages exchanged since the beginning of the communication, it isn't possible to be sure that the message is from the right person. We need to trust someone before. Certificates are made for that. There are signed by a trusted third party and can be used to verify the identity of the person or device. The most common certificate is #gls("x509") certificate.
]

#let fig-mitm-full = [
  #figure(
    image("mitm-full.png", width: size-fig.attacks),
    caption: [#gls("mitm", long: false) intercept everything]
  ) <fig-attack-mitm-full>
]

#wrap-content(
  fig-mitm-full,
  body-mimt-full,
  align: top + right,
)