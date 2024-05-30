#import "@preview/timeliney:0.0.1"
#import "../00-templates/datetime_calc.typ" as dtc

#let header-months(start-time, end-time) = {
  let months-name = ()
  let months-duration = ()
  let nbr-months = dtc.count-months(start-time, end-time)


  let i = 0
  let date = start-time
  while (i < nbr-months) {
    let rmg_week = dtc.remaining_week_on_month(date)
    if date.month() == end-time.month() {
      rmg_week = dtc.diff-weeks(date, dtc.offset(end-time, 2))
    }
    months-name.push(date.display("[month repr:long]"))
    months-duration.push(rmg_week)
    date = datetime(
      year: date.year(),
      month: date.month()+1,
      day: 1
    )
    i = i + 1
  }

  
  timeliney.headerline(
    ..range(nbr-months).map(
      n => timeliney.group((
        strong(months-name.at(n)),
        months-duration.at(n)
      ))
    ),
  )
}

#let header-week-number(start-time, end-time) = {
  timeliney.headerline(
      timeliney.group(
        ..range(dtc.count-weeks(start-time, end-time)).map(
          n => strong("W" + str(n + int(start-time.display("[week_number]"))))
        )
      ),
    )
}

#let header-week-date(start-time, end-time) = {
  timeliney.headerline(
    timeliney.group(
      ..range(dtc.count-weeks(start-time, end-time)).map(
        n => strong(
          dtc.offset(start-time, n*7).display("[day]/[month]")
        )
      )
    ),
  )
}

#let today(project-start-date) = {
  let weeks = 0
  let foo = project-start-date
  
  while (foo <= datetime.today()) {
    weeks += 1
    foo = dtc.add(foo, 7)
  }
  weeks = weeks - 1 + dtc.workingday_ratio(datetime.today())
  timeliney.milestone(
    at: weeks,
    style: (stroke: red),
    []
  )
}

#let task(project-start-date, task-start-date, task-week-duration, description) = {
  let weeks = 0
  let foo = project-start-date
  
  while (foo <= task-start-date) {
    weeks += 1
    foo = dtc.add(foo, 7)
  }
  weeks = weeks - 1 + dtc.workingday_ratio(task-start-date)
  timeliney.task(
    description,
    (
      weeks,
      weeks + task-week-duration
    ),
    style: (stroke: 2pt + gray)
  )
}

#let milestone(project-start-date, milestone-date, description) = {
  let weeks = 0
  let foo = project-start-date
  
  while (foo <= milestone-date) {
    weeks += 1
    foo = dtc.add(foo, 7)
  }
  weeks = weeks - 1 + dtc.workingday_ratio(milestone-date)
  timeliney.milestone(
    at: weeks,
    style: (stroke: (dash: "dashed")),
    align(center, strong(description) + "\n" + milestone-date.display("[day]/[month]/[year]"))
  )
}