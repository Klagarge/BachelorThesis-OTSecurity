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

This thesis takes place in an increasingly connected world. Where not so long ago we had a world made up of IT on one side and industrial #gls("plc") on the other, the #gls("iot") is reducing this boundary and breaking down the barriers that existed between these two worlds. 
From the begging the #gls("it") world has been confronted with malicious individuals who have sought every means possible to take control of installations. They implement some security systems to repeal attackers.
However, the #gls("ot") world has been less concerned with security, and the #gls("plc") systems have been designed to be robust and reliable, but not secure. The strategy for industrial systems has been to isolate them from the outside world.
Meanwhile, in an #gls("ot") embedded systems did not have the necessary power to perform cryptographic operations. As a result of having an isolated environment where it was difficult to implement security, the #gls("ot") world was for a long time far removed from any good practice in terms of security. 

With the advent of the #gls("iot"), the desire to interrconnect everything has become predominant. Industry want also to benefit to push live data of a production line to the cloud. The #gls("ot") world become more sensitive to attackers and must now incorporate security into its systems. In meanwhile, embeddedsystems have become more powerful and can now perform cryptographic operations.

While industry is beginning to secure its production lines, there are still a huge number of bad practices and unsecured systems. In this context, #school.name gave security course in the 6th semester of the #school.specialisation students. This course will change with the new study plan next year to cover more specifically the security of embedded systems also call #gls("ot") Security.

I also chose this thesis subject due to my keen interest in Security and PEN-testing. Additionally, I already have some basic ethical hacking background and would like to specialize in security of embedded systems during the rest of my studies. This thesis presents a valuable opportunity to delve into this field, and I have already enrolled for a master's degree to continue on this path.

= Objectives

As this thesis is the first building block in the overhaul of the security course, it is an important element that has driven this thesis. 
This thesis must provide scenario case that can be use in the laboratory of the #school.name. The scenarios must be realistic and feasible for the students during a laboratory exercice. A more subjective objective of having fun scenarios. 

This thesis have to produce between three and four of this attack scenario. The scenario have first to include an unsecure situation that be physical or simulated. Secondly, thes must include an attack to take advantage of this insecurity. And finally the scenario must include a solution to secure the system. Ideally, students, should be able to carry out the attack or the security operation in the futur laboratory. 

Ultimately, these scenarios must include at least a modbus communication and a wireless communication. Ideally, the scenarios should be able to used a Wago PLC and a #gls("flipper") device.

= Methodology and structure

As the aim of the bachelor's thesis is also to be a work that serves the student who is doing it, I decided to work as autonomously as possible. In my opinion, do not asking questions (or few) allows for better learning and a better understanding of the work carried out, in return for a longer completion time. 

This thesis start begin by an analysis of various attacks that can be carried ou on embedded systems, with a focus on communication. In this section, it will also be discussed the different media that can be used to carry out these attacks. And last but not least, the simulation environments that can be used to carry out these attacks.

This thesis develop after 2 choosen scenarios with more details. It present the environments and the needed tools for each scenario. It after overview how to perform the attack of this scenario. And finally, it present the solution to secure the system.

#let space = 4em
#v(space*2)

#infobox()[
  The main repository of this thesis is also entry point for all codes and documentation. It can be found at the following address: 

  #align(center)[https://github.com/Klagarge/OT-Security]
]

#v(space)

#iconbox(icon:"/04-resources/stack/chatgpt.svg", linecolor:
hei-blue)[
  Some modern tools like AI have been used to do this thesis. AI has been used for helping to reformulate and paraphrasing this final document. All code or text in this thesis has been originaly written by the author, #author.name.
]
