#import "../00-templates/helpers.typ": *

#let date-beginning = datetime(year: 2024, month: 5, day: 13)
#let date-finish = datetime(year: 2024, month: 9, day: 20)

#show: doc => gantt.create(
  date-beginning: date-beginning,
  date-finish: date-finish,
  header-months: true,
  header-week-number: false,
  header-week-date: true,
  {

    gantt.task(
      datetime(year: 2024, month: 05, day: 13),
      2,
      [Trains investigation]
    )

    gantt.task(
      datetime(year: 2024, month: 5, day: 27),
      2,
      [Communication technologies]
    )
    
    gantt.task(
      datetime(year: 2024, month: 6, day: 10),
      6,
      [Simulations]
    )

    gantt.task(
      datetime(year: 2024, month: 7, day: 22),
      2,
      [Discussing results]
    )   

    gantt.task(
      datetime(year: 2024, month: 8, day: 03),
      4,
      [Proposals]
    )

    gantt.task(
      datetime(year: 2024, month: 09, day: 2),
      1,
      [Report]
    )
    gantt.task(
      datetime(year: 2024, month: 09, day: 9),
      1,
      [Presentation]
    )

    gantt.milestone(
      datetime(year: 2024, month: 06, day: 14),
      [Mid-term \ report]
    )

    gantt.milestone(
      datetime(year: 2024, month: 06, day: 17),
      [Mid-term \ presentation]
    )

    gantt.milestone(
      datetime(year: 2024, month: 09, day: 6),
      [Final report]
    )
  }
)