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
= Introduction <sec:intro>
== Context Problem

//#acrfull(acr-ar)

//#gls-scrum.name
//#gls-scrum.description

#context {
  if bib-state.get() != true {
    bib-state.update(true)
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
}

#cite(<IEEEXplore-IntrusionDetectionIndustrial2017>)
#cite(<Wikipedia-ReplayAttack2024>, supplement:[p.7ff])

Here i'll talk about #gls("ot") and #gls("iiot"). #gls("ot") is an important topic for security. 

```rust
fn main() {}
```

#lorem(50)

== Objectives

#lorem(50)

== Structure of this report

#lorem(50)