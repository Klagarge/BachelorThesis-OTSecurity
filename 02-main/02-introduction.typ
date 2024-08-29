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

This thesis is set in a world that is becoming increasingly interconnected. Not long ago, the #gls("it") world and industrial #gls("plc") systems were distinct and separate, with clear boundaries between them. However, the rise of the #gls("iot") has blurred these lines, breaking down the barriers that once existed between these two domains.

From the outset, the #gls("it") world has faced threats from malicious individuals intent on gaining control of systems. In response, various security measures have been developed to fend off these attackers. In contrast, the #gls("ot") world, which includes industrial systems and #gls("plc"), has traditionally focused more on robustness and reliability than on security. The prevailing strategy for industrial systems was to isolate them from external networks, assuming that physical separation would suffice for security.

Additionally, embedded systems in the #gls("ot") world lacked the processing power needed to perform cryptographic operations, making security implementations challenging. As a result, the #gls("ot") domain remained largely disconnected from best practices in cybersecurity for many years.

With the advent of #gls("iot"), the desire to interconnect everything has become a driving force. Industries now seek to push real-time production data to the cloud, making #gls("ot") systems more vulnerable to attacks. This shift has forced the #gls("ot") world to incorporate security measures into its systems. Meanwhile, advancements in technology have made embedded systems more powerful, enabling them to handle cryptographic operations that were previously out of reach.

While some industries are beginning to secure their production lines, many still employ poor practices and maintain unsecured systems. In this context, #school.name has introduced a security course in the 6th semester for #school.specialisation students. With the upcoming changes in the study plan, this course will evolve to focus more specifically on the security of embedded systems, also known as #gls("ot") Security.

I also chose this thesis subject due to my keen interest in Security and PEN-testing. Additionally, I already have some basic ethical hacking background and would like to specialize in security of embedded systems during the rest of my studies. This thesis presents a valuable opportunity to delve into this field, and I have already enrolled for a master's degree to continue on this path.

= Objectives

As the first step in overhauling the security course, this thesis plays a crucial role. It aims to develop scenario cases that can be used in the laboratory. These scenarios must be both realistic and feasible for students to perform during lab exercises, with an additional goal of making them engaging and fun.

This thesis will produce between three and four attack scenarios. Each scenario will start with an unsecured situation, either physical or simulated. The scenario will then include an attack that exploits this vulnerability, followed by a solution to secure the system. Ideally, students should be able to carry out the attack or implement the security measures in future lab sessions.

The scenarios will cover at least one Modbus communication and one wireless communication. Whenever possible, the scenarios should involve a Wago PLC and a #gls("flipper") device.

= Methodology and structure

As an important aspect of a bachelor's thesis is that it also serves as a valuable learning experience for author, I chose to approach this project with as much independence as possible. In my view, by working autonomously and asking fewer questions, I can gain a deeper understanding and truly benefit from the experience, even if it means the project takes longer to complete.

The thesis begins with an analysis of various attacks that can be carried out on embedded systems, with a particular focus on communication vulnerabilities. This section also explores the different media that can be used to execute these attacks and examines the simulation environments suitable for testing them.

The thesis then develops two selected scenarios in greater detail. It presents the environments and tools needed for each scenario, explains how to perform the attacks, and finally, proposes solutions to secure the systems.

#let space = 4em
#v(space*2)

#infobox()[
  The main repository for this thesis, which also serves as the entry point for all code and documentation, can be found at the following address:

  #align(center)[https://github.com/Klagarge/BachelorThesis-OTSecurity]
]

#v(space)

#iconbox(icon:"/04-resources/stack/chatgpt.svg", linecolor:
hei-blue)[
  Some modern tools like AI were used to assist in the reformulation and paraphrasing of this final document. However, all code and text in this thesis were originally written by the author, #author.name. 
]
