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

#pagebreak()
= Analysis <sec:analysis>

#lorem(50)

#minitoc(after:<sec:analysis>, before:<sec:design>)
#pagebreak()



#subject("wireless-protocol", 1)

== Section 2

#lorem(50)

== Conclusion

#lorem(50)
