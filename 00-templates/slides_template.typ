#import "@preview/polylux:0.3.1": *
#import themes.clean: *
#import "../00-templates/constants.typ": *

#let slide_template(
  title: [Title],
  subtitle: none,
  authors: [],
  date: datetime.today(),
  duration: none,
  handout: false,
  doc,
) = {
  
  //set text(font: "Inria Sans")

  let date-text = if date.day() == 1 {
    date.display("[weekday], [day padding:none]st of [month repr:long] [year]")
  } else if date.day() == 2 {
    date.display("[weekday], [day padding:none]nd of [month repr:long] [year]")
  } else if date.day() == 3 {
    date.display("[weekday], [day padding:none]rd of [month repr:long] [year]")
  } else {
    date.display("[weekday], [day padding:none]th of [month repr:long] [year]")
  }


  show: clean-theme.with(
    //aspect-ratio: "4-3",
    footer: [#authors #h(0.2cm)-#h(0.2cm) Bachelor thesis #datetime.today().display("[year]")],
    short-title: [#title],
    logo: image(resources-folder + "logos/FR-DE_HEI_rvb.png"),
    color: rgb("#ea366a"),
  )

  if handout {
    enable-handout-mode(true)
  }

  if duration != none{
    pdfpc.config(
      duration-minutes: duration,
      default-transition: (
        type: "fade",
      )
    )
  } else {
    pdfpc.config(
      default-transition: (
        type: "fade",
      )
    )
  }
  

  title-slide(
    title: [#title],
    subtitle: [#subtitle],
    authors: ([#authors]),
    date: [#date-text],
  )

  doc

}
