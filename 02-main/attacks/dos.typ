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
  An attack by #gls("dos") is an attack that aims to make a service anavailable #cite(<Wikipedia-DenialofserviceAttack2024>). To reach this goal, a device send an large amount of message to surcharge a device or a network. In @fig-attack-dos we can see that Mallory want surcharge Bob with message. Bob can't answer to all the message and become unavailable. In #gls("it") world, it more often a #gls("ddos") because usually severs are more powerfull than a computer. The attacker distribute the attack on multiple device to make the attack more difficult to block. In #gls("ot") world, it's useless to perform a #gls("ddos") for make a device unavailable, a #gls("dos") with a capable computer is enough. An other point of view is that #gls("ot") world is usually in closed loop network and not accessible from outside.

  #infobox()[
    Did you know that when the Apollo 11 mission landed on the moon, the navigation system was so overloaded due to a defect sensor that the navigation system crashed #cite(<-LunarMissionsApollo>), forcing Neil Armstrong to take manual control of the landing ? This is an example of an unintentional #gls("dos").
  ]

  == Security Measures
  Several way exist to protect against #gls("dos"). At this stage, the best is to avoid to do an action at the reception of a message. For avoid intentionnal and unintentional #gls("dos"). Unfortunatly is not always possible. An other way is to limit the number of message that can be received in a certain time. For achieved that, it's probably necessary to use another device to filter the message. This device can be a firewall for example. But in the case of a #gls("ddos"), it's almost impossible to block the attack. The only way is to have a very powerfull device that can filter the message. But even with a very powerfull device, the attack can be successful.

]

#let fig = [
  #figure(
    image("dos.svg", width: 15em),
    caption: [#gls-short("dos") attack]
  ) <fig-attack-dos>
] 

#wrap-content(
  fig,
  body,
  align: top + right,
)