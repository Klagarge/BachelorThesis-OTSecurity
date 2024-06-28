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
  today-line: planning.today,
  {

    gantt.task(
      [Researchs about OT security],
      (date.start, 1.4),
    )
    
    gantt.task(
      [Define specifications], // 1
      (datetime(year: 2024, month: 06, day: 5),1),
    )

    gantt.task(
      [Familiarization with wireless], // 2
      (datetime(year: 2024, month: 06, day: 12), 1.6),
    )

    gantt.task(
      [Create simulation environnement], // 2
      (datetime(year: 2024, month: 07, day:01), 1),
      (datetime(year: 2024, month: 07, day:15), 1),
    )
    
    gantt.task(
      [#gls("mitm", long: false) scenario], // 2
      (datetime(year: 2024, month: 07, day: 1), 2),
    )

    gantt.task(
      [#gls("mitm", long: false) enc. scenario], // 3
      (datetime(year: 2024, month: 07, day: 22), 2),
    )

    gantt.task(
      [Replay scenario], // 2
      (datetime(year: 2024, month: 08, day: 5), 2),
    )
    
    gantt.task(
      [#gls("dos", long: false) scenario], // 1
      (datetime(year: 2024, month: 08, day: 19), 1),
    )

    gantt.task(
      [Report / Presentation],
      (date.start, date.submission, true),
      (datetime(year: 2024, month: 06, day: 24), 1),
      (datetime(year: 2024, month: 08, day: 26), 1),
      //(datetime(year: 2024, month: 06, day: 21), datetime(year: 2024, month: 06, day: 26), false, true),
      //(datetime(year: 2024, month: 07, day: 02), date.submission),
    )

    gantt.task(
      [Independence weeks],
      (datetime(year: 2024, month: 07, day: 15), 3, false),
    )
    
    if planning.filip {
      gantt.task(
        [Filip],
        (datetime(year: 2024, month: 07, day: 14),
        datetime(year: 2024, month: 07, day: 19),
        true)
      )
    }

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
