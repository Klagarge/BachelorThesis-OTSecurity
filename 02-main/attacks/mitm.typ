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
  A #gls("mitm") attack occurs when a third party can intercept activly, modified or send packets on a network #cite(<Wikipedia-ManinthemiddleAttack2024>). Most common #gls("mitm") attack are done with a new device connected in star or bus network topology. Once connected to the network, Mallory (@fig-attack-mitm) can perform a sniffing attack or send message. The aim is often to understand an Alice message, modified it and send it to Bob.

  == Security Measures
  For protect message to be intercepted, modified or impersonnated, a encryption with symetric key can be used. The key can be exchange with a standard #gls("d-h") exchange.
]

#let fig-mitm = [
  #figure(
    image("mitm-connected.png", width: 15em),
    caption: [#gls-short("mitm") on a connected network]
  ) <fig-attack-mitm>
]
#wrap-content(
  fig-mitm,
  body-mitm,
  align: top + right,
)

= #gls-long("mitm") - Full interception <subj:attack-mitm-full>
#let body-mimt-full = [
  When Mallory is on the gateway or between Alice and Bob like in @fig-attack-mitm-full Mallory can intercept all messages and neither Alice nor Bob can be sure that thei send and receive message to the right person. This is the most dangerous attack because Mallory can impersonate Alice and Bob and send message to the other person.
  Even with the security measures see on @subj:attack-mitm, Mallory was able to impersonnate Alice and Bob with create its own key with each other. This is why a #gls("mitm") attack is so dangerous.

  == Security Measures
  When a Mallory attacker can intercept all message exchanged since the beginning of the communication, isn't possible to be sure that the message is from the right person. We need to trust someone before. That's what certificates are for. Certificate are signed by a trusted third party and can be used to verify the identity of the person. The most common certificate are #gls("x509") certificate.
]

#let fig-mitm-full = [
  #figure(
    image("mitm-full.png", width: 15em),
    caption: [#gls-short("mitm") intercept everything]
  ) <fig-attack-mitm-full>
]

#wrap-content(
  fig-mitm-full,
  body-mimt-full,
  align: top + right,
)