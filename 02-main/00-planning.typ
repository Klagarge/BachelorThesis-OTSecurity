#import "../00-templates/helpers.typ": *

#let date-beginning = datetime(
  year: 2024,
  month: 5,
  day: 27,
)
#let date-finish = datetime(
  year: 2024,
  month: 08,
  day: 30,
)

#show: doc => gantt.create(
  date-beginning: date-beginning,
  date-finish: date-finish,
  header-months: true,
  header-week-number: true,
  header-week-date: false,
  {
    gantt.task(date-beginning, 1, [research])
    gantt.task(date-beginning, date-finish, [report])

    gantt.milestone(datetime(year: 2024, month: 07, day: 3), [Mid-term \ presentation])

    gantt.milestone(date-finish, [Final report])
  }
)
