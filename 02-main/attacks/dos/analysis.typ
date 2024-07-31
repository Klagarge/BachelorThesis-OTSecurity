// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

= #gls-long("dos")  <subj:attack-dos>
#let body = [
  An attack by #gls("dos") aims to render a service unavailable by overloading a device or network with messages #cite(<Wikipedia-DenialofserviceAttack2024>). In #gls("ot") environments, a capable computer can execute a #gls("dos") attack effectively. To reach this goal, a device sends a large number of messages to surcharge a device or a network. In @fig-attack-dos we can see that Mallory wants to overload Bob with messages. Bob is hence unable to answer to all messages and becomes unavailable. In #gls("it") world, it is more often a #gls("ddos") attack because usually servers are more powerful than a computer, and thus can handle more concurrent messages. The attacker distributes the messages on multiple devices to make the offense more difficult to block. In #gls("ot") world, it is useless to perform a #gls("ddos") to make a device unavailable since a #gls("dos") with a capable computer is generally enough. Another perspective is that #gls("ot") world is typically in closed loop networks and thus not accessible from the outside world.

  There are two primary types of #gls("dos") attacks in #gls("ot") systems: 
  - *#gls("dos", long: false) on the communication medium*: This type of attack focuses on disrupting the data flow between devices by flooding the network with excessive traffic. This leads to network congestion and delays or blocks legitimate communication.
  - *#gls("dos", long: false) on the controller*: This attack targets the processing capabilities of the controllers, such as #glspl("plc"), by sending numerous commands. This overcharge of the #gls("plc") can lead to system failure rendering it unresponsive.


  #infobox()[
    Did you know that when the Apollo 11 mission landed on the moon, the navigation system was overloaded because of a faulty sensor #cite(<-LunarMissionsApollo>), forcing Neil Armstrong to take manual control of the landing? \
    This is an example of an unintentional #gls("dos").
  ]

  == Security Measures
  Several ways exist to protect against #gls("dos"). At this stage, the best is to avoid doing an action at the reception of a message. /*To prevent intentional and unintentional #gls("dos").*/ Unfortunately, it is not always possible. Another way is to limit the number of messages that can be received in a particular timespan. To achieve that, it is often necessary to use another device to filter the messages. This device can be a firewall for example. However, in the case of a #gls("ddos"), it is almost impossible to block the attack. The only way is to have a very powerful filtering device. Still, even with such a device, the attack can be successful.
]

#let fig = [
  #figure(
    image("sequence.svg", width: size-fig.attacks),
    caption: [#gls("dos", long: false) attack]
  ) <fig-attack-dos>
] 

#wrap-content(
  fig,
  body,
  align: top + right,
)