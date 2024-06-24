// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

#let homeio = (
  price: [\~300.-],
  security: [by third soft],
  customization: [no],
  cross-platform: [no]
)

= Home I/O  <subj:simu-env-homeio>
#todo([
  Home I/O is made by the same company that Factory I/O. It simulates an House with a lot of domotic. It's cheaper than Factory I/O (\~300.- lifetime for organization) and can maybe used by ETE students too. Home I/O needs another software (Connect I/O) to communicate with Modbus. A third software had to be used to add a security layer. We tried it a bit on Linux and although Home I/O works perfectly well, he wasn't able to get Connect I/O to work. This soft needs to be used on Windows. 

  == Scenario
  The scenario would be that the PLC controls the alarm and access system with main door and garage. The garage door could be open by a wireless remote. The Wireless replay attack could be done on this remote. An external presence detector on in front of the main door could be used for the DoS attack. The MitM attacks could be made on the Modbus/TCP communication between the PLC and the alarm system, and the goal would be to open the main door.
])