#import "../00-templates/helpers.typ": *

#let date-beginning = datetime(year: 2024, month: 5, day: 13)
#let date-finish = datetime(year: 2024, month: 9, day: 20)
#set page(
  flipped: true,
)
#show: doc => gantt.create(
  date-beginning: date-beginning,
  date-finish: date-finish,
  header-months: true,
  header-week-number: false,
  header-week-date: true,
  {

    gantt.task(
      [Trains investigation],
      (datetime(year: 2024, month: 05, day: 13), 2),
    )

    gantt.task(
      [Communication technologies],
      (datetime(year: 2024, month: 5, day: 27), 2),
    )
    
    gantt.task(
      [Simulations],
      (datetime(year: 2024, month: 6, day: 10), 6),
    )

    gantt.task(
      [Discussing results],
      (datetime(year: 2024, month: 7, day: 22), 2),
    )

    gantt.task(
      [Proposals],
      (datetime(year: 2024, month: 8, day: 03), 1),
      (datetime(year: 2024, month: 8, day: 26), 1),
    )

    gantt.task(
      [Report],
      (datetime(year: 2024, month: 09, day: 2), 1),
    )
    gantt.task(
      [Presentation],
      (datetime(year: 2024, month: 09, day: 9), 1),
    )

    // gantt.milestone(
    //   [Mid-term \ report],
    //   datetime(year: 2024, month: 06, day: 14)
    // )
  
    gantt.milestone(
      [Mid-term \ presentation],
      datetime(year: 2024, month: 06, day: 17)
    )
    
    gantt.milestone(
      [Final report],
      datetime(year: 2024, month: 09, day: 6)
    )
  }
)