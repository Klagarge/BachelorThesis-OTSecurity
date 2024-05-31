#import "../00-templates/timeliney.typ"
#import "../00-templates/datetime_calc.typ" as dtc

#let _header-months(start-time, end-time) = {
  let months-name = ()
  let months-duration = ()
  let nbr-months = dtc.count-months(start-time, end-time)


  let i = 0
  let date = start-time
  while (i < nbr-months) {
    let rmg_week = dtc.remaining_week_on_month-workingday(date)

    if date.month() == end-time.month() {
      rmg_week = dtc.diff-weeks-workingday(date, dtc.offset(end-time, 2))
    }
    
    months-name.push(date.display("[month repr:long]"))
    months-duration.push(rmg_week)
    if date.month() == 12 {
      date = datetime(
        year: date.year()+1,
        month: 1,
        day: 1
      )
    } else {
      date = datetime(
        year: date.year(),
        month: date.month()+1,
        day: 1
      )
    }
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

#let _header-week-number(start-time, end-time) = {
  timeliney.headerline(
      timeliney.group(
        ..range(dtc.count-weeks(start-time, end-time)).map(
          n => strong("W" + str(n + int(start-time.display("[week_number]"))))
        )
      ),
    )
}

#let _header-week-date(start-time, end-time) = {
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

#let _today(project-start-date) = {
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

#let create(
  date-beginning: none,
  date-finish: none,
  header-months: true,
  header-week-number: true,
  header-week-date: false,
  today-line: true,
  doc
) = {
  let gTask(start-date, endOrDuration, description) = {
    let weeks = 0
    let foo = date-beginning
    let task-week-duration = if type(endOrDuration) == datetime {
      dtc.count-weeks(start-date, endOrDuration)
    } else {
      endOrDuration
    }
    
    while (foo <= start-date) {
      weeks += 1
      foo = dtc.add(foo, 7)
    }
    weeks = weeks - 1 + dtc.workingday_ratio(start-date)
    timeliney.task(
      description,
      (
        weeks,
        weeks + task-week-duration
      ),
      style: (stroke: 2pt + gray)
    )
  }

  let gMilestone(date, description) = {
    let weeks = 0
    let foo = date-beginning
    
    while (foo <= date) {
      weeks += 1
      foo = dtc.add(foo, 7)
    }
    weeks = weeks - 1 + dtc.workingday_ratio(date)
    timeliney.milestone(
      at: weeks,
      style: (stroke: (dash: "dashed")),
      align(center, strong(description) + "\n" + date.display("[day]/[month]/[year]"))
    )
  }
  
  let doc2 = ()
  for elmt in doc {
    if "type" in elmt and elmt.type == "gTask" {
      doc2 += gTask(elmt.start-date, elmt.endOrDuration, elmt.description)
    } else if "type" in elmt and elmt.type == "gMilestone" {
      doc2 += gMilestone(elmt.milestone-date, elmt.description)
    } else {
      doc2.push(elmt)
    }
  }

  set page(
    flipped: true,
    //paper: "a3",
  )

  timeliney.timeline(
    show-grid: true,
    {
      import timeliney: *

      let duration-weeks = int(dtc.diff-weeks(date-beginning, dtc.offset(date-finish, 2)))
      let year = date-beginning.display("[year]")
      headerline(group(([*#year*], duration-weeks)))

      if header-months {
        _header-months(date-beginning, date-finish)
      }

      if header-week-number {
        _header-week-number(date-beginning, date-finish)
      }

      if header-week-date {
        _header-week-date(date-beginning, date-finish)
      }

      if today-line {
        _today(date-beginning)
      }
      
      doc2
      
    }
  )
}

#let task(start-date, endOrDuration, description) = ((
  type: "gTask",
  start-date: start-date,
  endOrDuration: endOrDuration,
  description: description,
),)

#let milestone(milestone-date, description) = ((
  type: "gMilestone",
  milestone-date: milestone-date,
  description: description,
),)

