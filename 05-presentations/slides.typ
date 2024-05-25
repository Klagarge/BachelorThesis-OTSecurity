#import "../00-templates/slides_template.typ": *
#import "../01-settings/metadata.typ": *


#show: doc => slide_template(
  title: title,
  subtitle: subtitle,
  authors: author.name,
  date: datetime.today().display("[day].[month].[year]"),
  //duration: 10,
  doc,
)

#new-section-slide("What's OT Security?")

#slide(
  title: [What's OT Security]
)[
  #pdfpc.speaker-note("This is a note that only the speaker will see.")
]


#slide(
  title: [Dynamic slide]
)[
  Did you know that...

  #pause
  ...you can see the current section at the top of the slide?
  
  #pdfpc.speaker-note(
    ```md
    # My notes
    Did you know that pdfpc supports Markdown notes? _So cool!_
    ```
  )
]


