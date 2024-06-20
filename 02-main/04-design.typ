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
= Design <sec:design>

#lorem(50)

#minitoc(after:<sec:design>, before:<sec:impl>)
#pagebreak()


== Section 1

#lorem(50)

== Section 2

#lorem(50)

== Conclusion

#lorem(50)
