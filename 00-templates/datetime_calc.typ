#let is-leap-year(year) = {
  if calc.rem(year, 4) != 0 {
    return false
  }
  if calc.rem(year, 100) != 0 {
    return true
  }
  return calc.rem(year, 400) == 0
}

#let get-month-days(month, year) = {
  let leap = is-leap-year(year)
  
  if month == 2 {
    return if leap {29} else {28}
  }

  if month >= 8 {
    month += 1
  }
  return if calc.rem(month, 2) == 0 {30} else {31}
}

#let add(dt, days) = {
  assert(days >= 0, message: "days cannot be negative; use sub()")
  
  let day = dt.day()
  let month = dt.month()
  let year = dt.year()
  let month-days = get-month-days(month, year)
  let leap = is-leap-year(year)

  for _ in range(days) {
    if day == month-days {
      month += 1
      day = 1
      if month == 13 {
        year += 1
        month = 1
        leap = is-leap-year(year)
      }
      month-days = get-month-days(month, year)
    } else {
      day += 1
    }
  }
  return datetime(day: day, month: month, year: year)
}

#let sub(dt, days) = {
  assert(days >= 0, message: "days cannot be negative; use add()")
  
  let day = dt.day()
  let month = dt.month()
  let year = dt.year()
  let month-days = get-month-days(month, year)
  let leap = is-leap-year(year)

  for _ in range(days) {
    if day == 1 {
      month -= 1
      if month == 0 {
        year -= 1
        month = 12
        leap = is-leap-year(year)
      }
      month-days = get-month-days(month, year)
      day = month-days
    } else {
      day -= 1
    }
  }
  return datetime(day: day, month: month, year: year)
}

#let offset(dt, days) = {
  if days < 0 {
    return sub(dt, -days)
  }
  return add(dt, days)
}

#let add-week-workingdays(dt, weeks) = {
  let int_part = int(weeks)
  let float_part = int( (weeks - int_part)*5 + 0.01 )
  let new_date = add(dt, int_part*7)

  let i = 0
  while i < float_part {
    new_date = add(new_date, 1)
    if new_date.weekday() == 6 {
      new_date = add(new_date, 2)
    }
    if new_date.weekday() == 7 {
      new_date = add(new_date, 1)
    }
    i += 1
  }
  return new_date
}

#let diff-days(a, b) = {
  let days = 0
  let neg = b < a
  if neg {
    let c = a
    a = b
    b = c
  }
  while (a < b) {
    days += 1
    a = add(a, 1)
  }
  return if neg {-days} else {days}
}
#let diff-weeks(start_date, finish_date) = {
  calc.round(
    diff-days(
      start_date,
      add(finish_date, 1)
    )/7,
    digits: 2
  )
}
#let diff-weeks-workingday(start_date, finish_date) = {
  let days = 0
  while (start_date <= finish_date) {
    if start_date.weekday() != 6 and start_date.weekday() != 7 {
      days += 1
    }
    start_date = add(start_date, 1)
  }
  return days/5
}
#let diff-months(start_date, finish_date) = {
  calc.round(
    diff-days(
      start_date,
      add(finish_date, 1)
    )/30,
    digits: 2
  )
}

#let count-weeks(a, b) = {
  let weeks = 0
  let neg = b < a
  if neg {
    let c = a
    a = b
    b = c
  }
  while (a < b) {
    weeks += 1
    a = add(a, 7)
  }
  return if neg {-weeks} else {weeks}
}
#let count-months(a, b) = {
  let months = 0
  let neg = b < a
  if neg {
    let c = a
    a = b
    b = c
  }
  while (a < b) {
    months += 1
    a = add(a, 30)
  }
  return if neg {-months} else {months}
}

#let count-years(a, b) = {
  let years = 0
  let neg = b < a
  if neg {
    let c = a
    a = b
    b = c
  }
  while (a < b) {
    years += 1
    a = add(a, 365)
  }
  return if neg {-years} else {years}
}

#let remaining_week_on_month(date) ={
  diff-weeks(
    date,
    datetime(
      year: date.year(),
      month: date.month(),
      day: get-month-days(date.month(), date.year())
    )
  )
}

#let remaining_week_on_month-workingday(date) ={
  diff-weeks-workingday(
    date,
    datetime(
      year: date.year(),
      month: date.month(),
      day: get-month-days(date.month(), date.year())
    )
  )
}

#let remaining_week_on_year(date) ={
  diff-weeks(
    date,
    datetime(
      year: date.year(),
      month: 12,
      day: 31
    )
  )
}

#let workingday_ratio(date) = {
  let weekday = date.weekday() -1
  if weekday == 6 {
    weekday = 5
  }
  if weekday == 7 {
    weekday = 5
  }
  return weekday/5
}


#let equalDate(date1, date2) = {
  let year = date1.year() == date2.year()
  let month = date1.month() == date2.month()
  let day = date1.day() == date2.day()

  return year and month and day
}


