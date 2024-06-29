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

= Impact on Sustainability
This section explores the impact of this thesis on sustainability, with a specific focus on the United Nations #glspl("sdg") /*(@fig-SDG)*/. By examining the intersection of OT security and sustainability, this section demonstrates how securing industrial and home automation systems contributes to achieving global sustainability targets.
/*
#align(
  center,
  tablex(
    column: (1fr),
    align: center+horizon,
    stroke: none,
    [
      #figure(
        image("/04-resources/SDG_poster.png", width: 100%),
        caption: [#glspl("sdg", long: true)]
      ) <fig-SDG>
    ],[
      _(Source: UN Sustainable Development Goals communications materials. ©UN)_
    ]
  )

)
*/

The #glspl("sdg") provide a blueprint for achieving a better and more sustainable future. This thesis aligns particularly with the following goals: #v(1em)

#let body-g07 = [
  *Goal 7: Affordable and Clean Energy* \
  Securing OT systems is critical for the management of energy resources. By ensuring the integrity and reliability of control systems in smart grids and renewable energy installations, this thesis supports the continuous and efficient operation of clean energy sources. Enhanced security measures help prevent disruptions and unauthorized access, leading to more stable and resilient energy systems. This contributes to the goal of ensuring access to affordable, reliable, sustainable, and modern energy for all. #v(1em)
]
#let fig-sdg-g07 = image("/04-resources/SDG-07.png", width: size-fig.dsg)
//#wrap-content(fig-sdg-g07, body-g07, align: top + left)

#let body-g09 = [
  *Goal 9: Industry, Innovation, and Infrastructure* \
  Industry 4.0 relies heavily on interconnected OT systems. By addressing vulnerabilities and enhancing the security of these systems, this thesis promotes the development of robust and resilient infrastructure. Secure industrial processes foster innovation and sustainable industrialization. This thesis contributes to building infrastructure that supports economic development and human well-being, with a focus on sustainable industrialization and fostering innovation. #v(1em)
]
#let fig-sdg-g09 = image("/04-resources/SDG-09.png", width: size-fig.dsg)
#wrap-content(fig-sdg-g09, body-g09, align: top + size-fig.dsg-side)

#let body-g11 = [
  *Goal 11: Sustainable Cities and Communities* \
  Home automation systems are integral to the development of smart cities. This thesis examines security measures for these systems, ensuring they are protected against cyber threats. Secure home automation contributes to the safety, efficiency, and sustainability of urban environments. By protecting the systems that manage energy use, water distribution, and waste management, this research supports the development of cities and human settlements that are inclusive, safe, resilient, and sustainable. #v(1em)
]
#let fig-sdg-g11 = image("/04-resources/SDG-11.png", width: size-fig.dsg)
#wrap-content(fig-sdg-g11, body-g11, align: top + size-fig.dsg-side)

#let body-g12 = [
  *Goal 12: Responsible Consumption and Production* \
  Efficient resource management is a key aspect of responsible consumption and production. This thesis enhances the security of systems that monitor and control resource usage, such as smart meters and automated manufacturing processes. By preventing tampering and ensuring accurate data collection, this research helps optimize resource consumption and reduce waste. This aligns with the goal of ensuring sustainable consumption and production patterns. #v(1em)
]
#let fig-sdg-g12 = image("/04-resources/SDG-12.png", width: size-fig.dsg)
#wrap-content(fig-sdg-g12, body-g12, align: top + size-fig.dsg-side)

*Conclusion* \
This bachelor thesis on OT security helps to advance on sustainability goals. By enhancing the security and reliability of industrial and home automation systems, this research supports the UN's Sustainable Development Goals, promoting a more sustainable and secure future. Integrating security into these systems is crucial for sustainable development, highlighting the need for interdisciplinary approaches in addressing global challenges.