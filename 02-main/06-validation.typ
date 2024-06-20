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
= Validation <sec:validation>

#lorem(50)

#minitoc(after:<sec:validation>, before:<sec:conclusion>)
#pagebreak()

== Section 1

#lorem(50)

== Section 2

#lorem(50)

== Discussion

#lorem(50)
