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

This final chapter summarizes the work conducted in this thesis, addressing the challenges encountered and considering the future potential of this work, particularly in the context of laboratory use.

= Project summary
In this thesis, we have explored various types of attacks, communication media, and simulation environments that could be employed in a laboratory setting. This analysis was crucial in selecting the appropriate attacks, mediums, and simulation environments essential for future laboratory exercises. A key requirement of this thesis was the inclusion of Modbus communication and the use of the Flipper device in the attack scenarios.

The Home I/O simulation environment was chosen for its relevance to ETE students. This environment was used to simulate the Modbus communication protocol, forming the basis of the #gls("mitm") attack scenario, which was divided into two parts.

The first part involved an attack on Modbus/#gls("tcp") communication, starting with an #gls("arp") poisoning attack to position the attacker in a #gls("mitm") position. This part demonstrated how easily an attacker can intercept and modify unsecured communication, emphasizing the importance of securing such communication, specifically in this case, to prevent disabling the house alarm system. The scenario highlighted the necessity of using a secure communication protocol like #gls("tls") to prevent such attacks.

The second part focused on an attack on Modbus/#gls("tls") communication, again using #gls("arp") poisoning to establish a #gls("mitm") position. This part illustrated the critical importance of verifying #gls("tls") certificates. Without proper verification, an attacker can replace certificates and establish their own encrypted communication with both the server and client. The scenario stressed the need for certificate verification, a practice that might seem obvious to those in the #gls("it") world but is a significant vulnerability in the #gls("iot") world, as highlighted by Aapo Oksman at DEF CON 31.

#set quote(block: true)
#quote(attribution: [Aapo Oksman on DEF CON 31])[
  Even if you have the best encryption, if you connect to the bad guys, it doesn't matter how well is your encrypted connection between you and the bad guys. They would still be able to see your connection. That's why you really need to authenticate the server first before establishing the encrypted connection.
]

= Encountered difficulties

Opting to work with minimal guidance posed its set of challenges. This approach led to significant time spent on problems that, in hindsight, might have been resolved more quickly with some assistance. However, by tackling with these issues independently, I gained a more profound understanding of the thesis subject.

The first major challenge was the lack of tools for performing #gls("mitm") attacks below layer 7 (application layer). Most existing tools are designed for #gls("https") and are not applicable to this thesis, where the layer 7 is Modbus for this thesis. I spent a considerable amount of time trying to perform a #gls("mitm") attack on #gls("tls") on the fly. After much effort, I eventually realized that setting up a server-client bridge and providing a fake certificate was a better approach. Something that now seems obvious in hindsight. Ultimately, this is the solution I implemented.

The second significant difficulty was related to the differences in modulation between #gls("wmbus") and the #gls("flipper") device. It took me a long time to recognize that the issue was not due to poor transceiver configuration on my part. After extensive attempts to measure and analyse the radio frequency signal, I eventually realized that my misunderstanding of the #gls("flipper") documentation was the root cause. I then spent additional time attempting to configure the TI chip in the #gls("flipper"). Moving on to Plan B after investing so much time and effort in the initial approach was difficult.

These challenges meant that I did not have an opportunity to implement the #gls("dos") scenario. However, this was the least critical scenario, as it is relatively straightforward to understand. In exchange, the #gls("mitm") scenario was developed in two parts, with one focusing on #gls("tcp") and the other on #gls("tls"), which, I believe, are more interesting and relevant.

= Future perspectives

Finally, what can be learned from this Bachelor's thesis, and how can it be useful in the creation of the course and the laboratory?

This thesis provides a comprehensive environment for conducting a #gls("mitm") attack. For the laboratory, it would be beneficial to encapsulate the Home I/O simulation and its *Go* interface in a Docker container, making it more portable and easier for students to use. The controller could be implemented on the Wago CC100, with its functionality extended to cover the entire house for a more realistic scenario. Additionally, the Kali attacker could be deployed on a Raspberry Pi, demonstrating to students that even a small device can carry out significant attacks.

For the replay scenario, it could be interesting to connect it to the Wago CC100 to trigger the garage door in the Home I/O simulation, making the scenario more realistic and engaging for students. However, an interface between the 433 MHz transceiver and the Wago CC100 would need to be developed, along with a remote control for student use. This scenario remains more of a proof of concept, as it currently relies on serial communication with a *Go* software.

In any case, this thesis provides a guide for performing #gls("mitm") and replay attacks. Parts of the thesis could be used as support material for the course. Additionally, this work led to the creation of Typst diagrams and, indirectly, Typst packages that could be useful for both course and laboratory support