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

#set text(size: tiny)

//#set page(paper: "a3", flipped: true)

#show: doc => gantt.create(
  date-beginning: date.start,
  date-finish: date.end,
  header-months: true,
  header-week-number: true,
  header-week-date: false,
  {

    gantt.task(
      [Researchs about OT security],
      (date.start, 1),
    )
    
    gantt.task(
      [Define specifications], // 1
      (datetime(year: 2024, month: 06, day: 3),1),
    )

    gantt.task(
      [Familiarization with techs], // 2
      (datetime(year: 2024, month: 06, day: 3), 1),
      (datetime(year: 2024, month: 06, day: 10), 0.4), // environnement
      (datetime(year: 2024, month: 06, day: 26), 0.4), // replay
      (datetime(year: 2024, month: 07, day: 12), 0.2), // dos
      (datetime(year: 2024, month: 07, day: 22), 0.4), // mitm
      (datetime(year: 2024, month: 08, day: 7), 0.6), // mitm enc.
    )

    gantt.task(
      [Create simulation environnement], // 2
      (datetime(year: 2024, month: 06, day:12), 2),
    )

    gantt.task(
      [Replay scenario], // 2
      (datetime(year: 2024, month: 06, day: 28), 2),
    )

    gantt.task(
      [Dos scenario], // 1
      (datetime(year: 2024, month: 07, day: 15), 1),
    )
    
    gantt.task(
      [MitM scenario], // 2
      (datetime(year: 2024, month: 07, day: 24), 2),
    )

    gantt.task(
      [MitM enc. scenario], // 3
      (datetime(year: 2024, month: 08, day: 12), 3),
    )

    //gantt.task([Other good practices], (datetime(year: 2024, month: 08, day: 22), 0))

    gantt.task(
      [report],
      (date.start, date.submission),
    )

    gantt.task(
      [Indepence week],
      (datetime(year: 2024, month: 07, day: 15), 3),
    )

    gantt.milestone(
      [Mid-term \ presentation],
      date.mid-term-presentation
    )
    
    gantt.milestone(
      [Final report],
      date.submission
    )
  }
)
