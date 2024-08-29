// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
}
// END OF HEADER

#pagebreak()

#heading(numbering:none)[Abstract] <sec:abstract>

This thesis examines the security of embedded systems in a world where the boundary between #gls("it", long: false) and #gls("ot", long: false) become increasingly thinner. Traditionally, #gls("ot", long: false) systems were physically isolated to ensure security. However, with the advent of the #gls("iot", long: false), these systems are becoming more interconnected, making them more susceptible to cyberattacks.

In response to these evolving challenges, the #school.name overhauled its teaching laboratory dedicated to #gls("ot", long: false) security. This lab will focus on practical, hands-on exercises to help students understand the unique challenges of securing embedded systems.

The primary objective of this thesis was to create realistic attack scenarios for use in these laboratories, with a focus on Modbus communication protocols and wireless systems. These scenarios are designed to help students identify vulnerabilities in #gls("ot", long: false) systems and learn how to secure them effectively.

The thesis centres on two key attacks scenarios. The first is a #gls("mitm", long: false) attack on Modbus/#gls("tcp", long: false) communication, demonstrating how an attacker can intercept and alter unencrypted messages. This scenario underlines the importance of implementing #gls("tls", long: false) and verifying digital certificates to mitigate such threats. The second scenario involves a replay attack on a wireless communication system, using the #gls("flipper") device to capture and retransmit signals.

#v(2em)
_*Keywords*_: _OT_, _security_, _man in the middle_, _modbus_, _replay_, _attack_, _flipper_