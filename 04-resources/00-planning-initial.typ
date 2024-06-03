#import "../00-templates/helpers.typ": *

#show: doc => gantt.create(
  date-beginning: date.start,
  date-finish: date.end,
  header-months: true,
  header-week-number: true,
  header-week-date: false,
  {
    gantt.task(date.start, 1.2, [Researchs])
    gantt.task(datetime(year: 2024, month: 06, day: 03), 2, [Simulation environnement])
    gantt.task(datetime(year: 2024, month: 06, day: 17), 2, [Dos scenario])
    gantt.task(datetime(year: 2024, month: 07, day: 01), 2, [Replay scenario])
    gantt.task(datetime(year: 2024, month: 07, day: 15), 2.4, [MitM scenario])
    gantt.task(datetime(year: 2024, month: 07, day: 31), 2.4, [MitM enc. scenario])
    gantt.task(datetime(year: 2024, month: 08, day: 16), 1.2, [Good practices])

    gantt.task(date.start, date.submission, [report])

    gantt.task(datetime(year: 2024, month: 07, day: 8), 3, [Indepence week - A])
    gantt.task(datetime(year: 2024, month: 07, day: 15), 3, [Indepence week - B])

    gantt.milestone(datetime(year: 2024, month: 07, day: 3), [Mid-term \ presentation])
    gantt.milestone(date.submission, [Final report])
  }
)
