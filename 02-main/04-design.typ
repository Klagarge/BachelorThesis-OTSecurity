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

= 
#todo([

])

= Simulation environnement
#todo([

])

#subject("simu-env/factoryio", heading-offset: 2)
#subject("simu-env/homeio", heading-offset: 2)
#subject("simu-env/minecraft", heading-offset: 2)


= Conclusion
#todo([
  
])