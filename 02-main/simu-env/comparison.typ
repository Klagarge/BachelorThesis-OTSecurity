// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
} // END OF HEADER

#import "factoryio.typ": *
#import "homeio.typ": *
#import "minecraft.typ": *

#tablex(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    [],               [*Price*],  [*Security*],     [*Customization*],  [*Cross-patform*],
    //[*Winter Sim. 2*],[\~350.-],  [by third soft],  [no],               [no],
    [*Factory I/O*],factoryio.price, factoryio.security, factoryio.customization, factoryio.cross-platform,
    [*Home I/O*], homeio.price, homeio.security, homeio.customization, homeio.cross-platform,
    [*Minecraft*], minecraft.price, minecraft.security, minecraft.customization, minecraft.cross-platform

  )