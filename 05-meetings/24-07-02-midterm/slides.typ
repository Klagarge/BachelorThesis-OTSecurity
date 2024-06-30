#import "/00-templates/helpers.typ": *

#show: doc => slide_template(
  title: title,
  subtitle: subtitle + [#v(0.1%) #strong("Mid-term presentation")],
  authors: author.name,
  date: datetime(year: 2024, month: 07, day: 02),
  duration: 10,
  fade: false,
  handout: true,
  doc,
)

#set text(size: 20pt)

#slide(
  title: [Introduction],
)[
  #side-by-side(gutter: 3mm, columns: (1fr, 1fr))[
    #one-by-one[][
      - 
    ][
      - 
    ]
  ][
    #image("/04-resources/placeholder.svg", width: 100%)
  ]

  #pdfpc.speaker-note(
    ```md
    - 
    ```
  )
]


#slide(title: [Planning])[#include "/04-resources/planning.typ";#set text(size: 0pt);#include "/03-tail/glossary.typ"]


