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

#heading(numbering:none)[Acknowledgements] <sec:ack>

As this thesis marks the completion of my bachelor's degree at the #school.name, I would like to express my deepest gratitude to several individuals who have supported a guided me throughout this journey.

First and foremost, I would like to thank my thesis supervisor, #professor.name, for his guidance not only this Thesis but also throughout my studies. His expertise and knowledge have been invaluable to me, and I am grateful for the time and effort he has dedicated to helping me succeed.
I am also deeply grateful to Michael Clausen, who followed my progress closely and offered continuous support and insightful feedback.

I would also like to thank Prof. Silvan Zahno, who introduced me to Typst and crafted a wonderful template and work for this new, fresh tool.
My appreciation also goes to Prof. Christopher Metrailler, who presented me a lot of tools, including my new favourite code editor, ZED.

My heartfelt thanks go to my family for their support, and to my best friend for his unwavering support and for his proofreading of my report.
Finally, I am profoundly grateful to my brother, whose thorough review and incredible Typst packages played a crucial role in the final presentation of this thesis.

Thank you all for your contributions and support. This thesis would not have been possible without you.
