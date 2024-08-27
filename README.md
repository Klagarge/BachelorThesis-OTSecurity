<h1 align="center">
  <br>
  <img src="./04-resources/logos/hei-en.svg" alt="HEI Logo Logo" width="300" height="200">
  <img src="./04-resources/logos/synd-light.svg" alt="HEI Logo Logo" width="300" height="200">
  <br>
  Bachelor Thesis - <u>OT Security</u> - Rémi Heredero
  <br>
</h1>

This repo hosts my Bachelor's thesis about OT Security.


# Table of contents

<p align="center">
<a href="#content-of-the-thesis">Content of the Thesis</a> • 
<a href="#abstract">Abstract</a> • 
<a href="#credits">Credits</a> • 
<a href="#stack">Stack</a> • 
<a href="#license">License</a>
</p>

## Content of the Thesis

[(Back to top)](#table-of-contents)

- Impact on Sustainability
- Analysis
  - Attacks (Sniffing, Spoofing, Denial of Service, Replay, Man in the Middle)
  - Communication media (Modbus, wireless M-bus)
  - Simulation environments (Factory I/O, Home I/O, Minecraft)
- Attack by Man in the Middle
- Attack by Replay
- Attack by Denial of Service

### Man in the Middle attack
Main repo for this part are: 
- [Modbus interface for HomeIO simulation](https://github.com/Klagarge/Modbus2HomeIO)
- [Controller for HomeIO simulation](https://github.com/Klagarge/ControllerHomeIo)
- [MitM on Modbus/TCP](https://github.com/Klagarge/MitM-TCP-HomeIO)
- [MitM on Modbus/TLS without certificat verification](https://github.com/Klagarge/MitM-TLS-HomeIO)

### Replay attack

### DoS attack

## Abstract

[(Back to top)](#table-of-contents)


## Credits

[(Back to top)](#table-of-contents)

* [Rémi Heredero](https://github.com/Klagarge) for the Thesis
* [Yann Sierro](https://github.com/Fastium), [Louis Heredero](https://github.com/LordBaryhobal) for proofreading
* [Silvan Zahno](https://github.com/tschinz) and all guys from [Typst](https://github.com/typst/typst) for the Typst template


## Stack

[(Back to top)](#table-of-contents)
<p align="left">
<a href="https://typst.app/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/typst.png" alt="typst" width="60" height="60"/> </a>
<a href="https://git-scm.com/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/git-scm-icon.svg" alt="git" width="60" height="60"/> </a>
<a href="https://www.kali.org/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/Kali.png" alt="kali linux" width="60" height="60"/> </a>
<a href="https://www.wireshark.org/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/wireshark.png" alt="wireshark" width="60" height="60"/> </a>
<a href="https://www.python.org" target="_blank" rel="noreferrer"> <img src="04-resources/stack/python.svg" alt="python" width="60" height="60"/> </a>
<a href="https://www.rust-lang.org/fr" target="_blank" rel="noreferrer"> <img src="04-resources/stack/rust.png" alt="rust" width="60" height="60"/> </a>
<a href="https://go.dev/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/golang.png" alt="go" width="60" height="60"/> </a>
<a href="https://www.ettercap-project.org/" target="_blank" rel="noreferrer"><img src="04-resources/stack/ettercap.svg" alt="ettercap" width="60" height="60"/> </a>
<a href="https://linux.die.net/man/8/iptables" target="_blank" rel="noreferrer"><img src="04-resources/stack/iptables.png" alt="iptables" width="60" height="60"/> </a>
<a href="https://scapy.net/" target="_blank" rel="noreferrer"><img src="04-resources/stack/scapy-logo.svg" alt="scapy" width="60" height="60"/> </a>
<a href="https://flipperzero.one/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/flipper.svg" alt="flipper zero" width="60" height="60"/> </a>

<a href="https://realgames.co/home-io/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/home-io.png" alt="home io" width="60" height="60"/> </a>
<a href="https://modbus.org/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/modbus.png" alt="modbus" width="188" height="60"/> </a>
<a href="https://radiocrafts.com/technologies/wireless-m-bus-technology-overview/" target="_blank" rel="noreferrer"> <img src="04-resources/stack/wireless-m-bus.png" alt="wireless m-bus" width="80" height="60"/> </a>

</p>

For go programmation a nice startup is what made [cm0x4D](https://github.com/cm0x4D) for [HEI Synd IIot security course](https://github.com/hei-synd-iiot/golang). You can find it on [https://hei-synd-iiot.github.io/golang/](https://hei-synd-iiot.github.io/golang/)



## License

[(Back to top)](#table-of-contents)

* The Typst template used is on MIT license.
* Some Typst module are under Apache 2.0 or GPL 3.0
* The content of this Thesis is under GPL 3.0