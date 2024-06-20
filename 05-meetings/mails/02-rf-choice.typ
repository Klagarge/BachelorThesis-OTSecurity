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

= Rémi to Michael
The replay attack is made on wireless part. More interresting to do this part on real life no ?
I quickly spoke about which protocole to use with Medard yesterday and i was making a summary of some protocole and some transceiver i can use. But i think wireless M-Bus is the most interresting and easier for my work. I like the idea of a meter that send data in T mode (monodirectional). Because it's a single canal protocol it's (probably) easy to perform an attack with the flipper zero. 
The transceiver i'd like to use (RC1180-MBUS3) convert uart data to wireless m-bus and can perform an AES encryption
#line(length: 100%)
= Michael to Rémi
We had another idea today. Basically you could build a 4 or 8 channel remote controller and receiver, that is using an nRF24 transceiver. Then we do the replay attack with the Flipper Zero. After that we can add the security outselves. The CC100 has 8 digital inputs, so that would be ideal...
#line(length: 100%)
= Rémi to Michael
What kind of protocol do you have in mind with an nRF24 ? It's a 2.4GHz so not wM-Bus
#line(length: 100%)
= Michael to Rémi
Just transmit an Id, then some counter and hash to avoid replay attacks.
Very basic, so they understand it well.
#line(length: 100%)
= Rémi to Michael
Have you ever tried to intercept a multi-channel communication with flipper zero ?
From what I've been able to see/understand, it's necessary to create an app that uses the TI chip in the flipper if I want to intercept a protocol that uses frequency hopping.

So no special protocol, something custom ?

#line(length: 100%)
= Michael to Rémi
Yes. Maybe we can deactivate the frequency jumping? Otherwise we will look for even a simpler wireless signal, maybe some 433 MHz..

I am currently writing a modbus server for the application, so Modbus over TLS is no problem.

So we can use modbus for example as man in the middle attack and sniffing attack
#line(length: 100%)
= Rémi to Michael
For modbus i'm more confident. At least for simulation interface, i already did some test.
I don't really know the Wago PLC and how easy/difficult it is to implement modbus over TCP and over TLS.
 
So for MitM attack i think it's more straightforward


I test to perform a replay on physical layer on DigiMesh with flipper. But sadly isn't possible to use only 1 canal.

 
Zigbee is also with frequency hopping. The third protocole we talk about was wM-Bus. I look more in detail how it's work, how i can use it, perform an attack and secure it with a simple transceiver. 
I also like the idea to have a mono-directionnal communication, it's more difficult to realy secure it. Rolling code or counter are bad option for me.
 
That why i suggest to use wM-Bus in T mode. A meter send data to a controller and we can fake it. Typically wireless electrical or water meter. 
 
If you prefer another 433 or 868 MHz basic wireless signal i can search on this way.

#line(length: 100%)
= Michael to Rémi
Yes, because I would like it to be connected to the target.

Some remote would be excellent.

https://shop.m5stack.com/products/rf-unit-433mhz-transmitter-syn115?variant=39729184833708 ?

Ah, or LoRa of course.

https://www.adafruit.com/product/5693

#line(length: 100%)
= Rémi to Michael

Look easy to perform an attack with flipper. Not sure of the bandwith but shouldn't be a problem 


Look suck more difficult to perform an attack on physical layer for LoRa. It use frequency hopping across several frequency not only channel. 

Flipper zero need an hardware addon for sniffing LoRa

#line(length: 100%)
= Michael to Rémi

Ok, I let you decide, STM has wireless transceivers too. Then we could develop a PCB with the transceiver and a tiny stm32 that can be programmed using the armebs board‘s ST-Link.

The same board can be used for the sender and the receiver. Sender has 4 buttons and receiver has 4 outputs (optocoupled)

So they could add the required code to avoid the replay attack themselves.

#line(length: 100%)
= Rémi to Michael & Medard

Hello, \
I speak with you two about the replay attack on wireless. I'd like to write this down to have a clear decision for my work. \
\
In the initial inputs we talk about DigiMesh, Zigbee and wireless Meter Bus (wM-Bus). \
My idea and aim for the replay attack is to perform it on the physical layer, so there is no need to understand the message. \
For performing this attack, I'd like to use the Flipper Zero. But for using it, we have to consider that the capabilities of the Flipper Zero are very basic. So, no frequency hopping protocol and modulation has to be OOK, AM (270 or 650 kHz of Bandwidth) or 2FSK. \
\
For secure against a replay attack, my actual goal (needs to be confirmed by further research) is to sign the message with derivation of a pre-write key. \
For me, rolling code or simple counter are not really secure, it's still possible to perform a replay attack. \
\
I searched several “professional” wireless protocols that can be attacked easily with flipper. \
And actually I like wM-Bus, specially mode T that is a single canal protocol (2GFSK). \
This mode is made for meters that send data to a controller periodically in a one-directional communication way. \
Typical applications are electricity or water meters in a city, and the company reads these meters simply by driving down the street. \
A perfect transceiver for this protocol is the RC1180-MBUS3 of Radiocraft that works with UART. The simple chip (1783-1037-1-ND) [20.-] is enough for the laboratory, but better to have the devkit for Bachelor Thesis (1783-1020-ND) [250.-]. The devkit includes 2 chips on board with everything for well working. \
Another good transceiver is the chip inside the Flipper Zero. This chip, from Texas Instrument, is more difficult to use because it's wide capability. So it's not planned, but it's possible to create an app for flipper zero and understand the wM-Bus message. \
\
Michael prefers to use a simple 433 MHz transmitter. Something basic that students can understand well how it's work and something that can easily be used for garage door in Home I/O. \
In the suggestion he gave me, there was an elementary OOK transceiver from M5Stack.  \
It's in two parts, a basic transmitter SYN115 (2221-U114-ND) [4,5.-] that converts 0/1 in input to a OOK 433 MHz and a receiver SYN531R (2221-U113-ND) [4,5.-] that provides this 0/1. \
For real communication, a 0 or 1 isn't enough, but we can use a basic UART like to transfer an ID and unique-signature. \
\
For both case, I was thinking of using the STM32F7 discovery board we already have (and I already know) in complement of these transceivers.  \
\
In summary, we have the choice between a simple 433 MHz transmitter or a real wireless protocol used in Europe. While the 433 MHz option is undoubtedly easier to implement, the wM-Bus protocol offers a more realistic and industrial scenario. \
\
So, should I choose the simple 433 MHz transmitter or the wM-Bus protocol ? \
You can directly order the corresponding element(s) based on your decision. \
Best regards, \
Rémi \
#line(length: 100%)

