#import "../00-templates/helpers.typ": *
#import "../00-templates/datetime_calc.typ" as dtc

#let date-beginning = datetime(
  year: 2024,
  month: 5,
  day: 27,
)
#let end-time = datetime(
  year: 2024,
  month: 08,
  day: 30,
)


#let duration-weeks = int(dtc.diff-weeks(date-beginning, dtc.offset(end-time, 2)))

#set page(
  flipped: true,
  //paper: "a3",
)

#timeliney.timeline(
  show-grid: true,
  {
    import timeliney: *
      
    headerline(group(([*2024*], duration-weeks)))
    gantt.header-months(date-beginning, end-time)
    gantt.header-week-number(date-beginning, end-time)
    //gantt.header-week-date(date-beginning, end-time)
    
    taskgroup(title: [*Group1*], {
      gantt.task(
        date-beginning,
        datetime(year: 2024, month: 05, day: 27),
        2,
        [Task 1.1]
      )
      task("Task 1.2", (1, 2), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*Group2*], {
      task("Task 2.1", (2 , 3), style: (stroke: 2pt + gray))
      task("Task 2.2", (4, 5), style: (stroke: 2pt + gray))
      task("Task 2.3", (3.5, 6), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*Group3*], {
      task("Task 3.1", (3.5, 7), style: (stroke: 2pt + gray))
      task("Task 3.2", (6, 7.5), style: (stroke: 2pt + gray))
    })

    gantt.task(
      date-beginning,
      date-beginning,
      int(dtc.diff-weeks(date-beginning, dtc.offset(end-time, 2))),
      [report]
    )

    taskgroup(title: [*Thesis organisation*], {
      gantt.task(
        date-beginning,
        datetime(year: 2024, month: 07, day: 8),
        3,
        [Indepence week -A]
      )
      gantt.task(
        date-beginning,
        //datetime(year: 2024, month: 07, day: 8),
        datetime(year: 2024, month: 07, day: 15),
        3,
        [Indepence week - B]
      )
    })

    gantt.milestone(
      date-beginning,
      datetime(year: 2024, month: 07, day: 3),
      [Mid-term \ presentation]
    )

    gantt.milestone(
      date-beginning,
      end-time,
      [Final report]
    )

    gantt.today(date-beginning)
  }
)
