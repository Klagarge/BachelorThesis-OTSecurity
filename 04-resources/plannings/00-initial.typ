// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    //bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  } else {

  }
}
/*
#show: doc => context {
  if bib-state.get() != true {
    bib-state.update(true)
    page(paper: "a3", flipped: true, doc)
  } else {
    doc
  }
}
*/
// END OF HEADER

#set text(size: tiny)


#show: doc => gantt.create(
  date-beginning: date.start,
  date-finish: date.end,
  header-months: true,
  header-week-number: true,
  header-week-date: true,
  today-line: true,
  {

    gantt.task(
      [Researchs about OT security],
      (date.start, 1.4),
    )
    
    gantt.task(
      [Define specifications], // 1
      (datetime(year: 2024, month: 06, day: 3),1),
    )

    gantt.task(
      [Familiarization with wireless], // 2
      (datetime(year: 2024, month: 06, day: 6), 1.8),
      //(datetime(year: 2024, month: 06, day: 10), 0.4), // environnement
      //(datetime(year: 2024, month: 06, day: 26), 0.4), // replay
      //(datetime(year: 2024, month: 07, day: 12), 0.2), // dos
      //(datetime(year: 2024, month: 07, day: 22), 0.4), // mitm
      //(datetime(year: 2024, month: 08, day: 7), 0.6), // mitm enc.
    )

    gantt.task(
      [Create simulation environnement], // 2
      (datetime(year: 2024, month: 07, day:02), 1.4),
    )
    
    gantt.task(
      [MitM scenario], // 2
      (datetime(year: 2024, month: 06, day: 21), 1),
      (datetime(year: 2024, month: 07, day: 11), 1),
    )

    gantt.task(
      [MitM enc. scenario], // 3
      (datetime(year: 2024, month: 07, day: 18), 2.4),
    )

    gantt.task(
      [Replay scenario], // 2
      (datetime(year: 2024, month: 08, day: 5), 2),
    )
    
    gantt.task(
      [Dos scenario], // 1
      (datetime(year: 2024, month: 08, day: 19), 1),
    )

    //gantt.task([Other good practices], (datetime(year: 2024, month: 08, day: 22), 0))

    gantt.task(
      [report],
      (date.start, date.submission, true),
      (datetime(year: 2024, month: 06, day: 19), datetime(year: 2024, month: 06, day: 24), false),
      (datetime(year: 2024, month: 06, day: 21), datetime(year: 2024, month: 06, day: 26), false, true),
      (datetime(year: 2024, month: 06, day: 28), datetime(year: 2024, month: 07, day: 01)),
      //(datetime(year: 2024, month: 07, day: 02), date.submission),
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
