#import "../../00-templates/helpers.typ": *

#set text(size: tiny)

//#set page(paper: "a3", flipped: true)

#let tasks = ()
#tasks.push((name: "Researchs about OT security", duration: 1, start: date.start))

#let task = (tasks, name, duration) => {
  let last = tasks.last()
  return (
    name: name,
    duration: duration,
    start: add-week-workingdays(last.start, last.duration),
  )
}

#tasks.push(task(tasks, "Define specifications", 1))
#tasks.push(task(tasks, "Familiarization with techs", 2))
#tasks.push(task(tasks, "Create simulation environnement", 2))
#tasks.push(task(tasks, "Replay scenario", 2)) // 1.8
#tasks.push(task(tasks, "Dos scenario", 1))
#tasks.push(task(tasks, "MitM scenario", 2)) // 1.6
#tasks.push(task(tasks, "MitM enc. scenario", 3)) // 2.8
#tasks.push(task(tasks, "Other good practices", 0))

#let sum = 0
#for d in tasks {
  sum += float(d.duration)
}
//#sum

#show: doc => gantt.create(
  date-beginning: date.start,
  date-finish: date.end,
  header-months: true,
  header-week-number: true,
  header-week-date: true,
  {
    /*
    for t in tasks {
      gantt.task(t.name, t.start, t.duration)
    }
    */

    gantt.task([Researchs about OT security], date.start, 1)
    gantt.task([Define specifications], datetime(year: 2024, month: 06, day: 3), 1)
    gantt.task([Familiarization with techs], datetime(year: 2024, month: 06, day: 10), 2)
    gantt.task([Create simulation environnement], datetime(year: 2024, month: 06, day:24), 2)
    gantt.task([Replay scenario], datetime(year: 2024, month: 07, day: 8), 2)
    gantt.task([Dos scenario], datetime(year: 2024, month: 07, day: 22), 1)
    gantt.task([MitM scenario], datetime(year: 2024, month: 07, day: 29), 2)
    gantt.task([MitM enc. scenario], datetime(year: 2024, month: 08, day: 12), 3)
    gantt.task([Other good practices], datetime(year: 2024, month: 08, day: 22), 0)


    gantt.task([report], date.start, date.submission)

    gantt.task([Indepence week], datetime(year: 2024, month: 07, day: 15), 2)

    gantt.milestone([Mid-term \ presentation], datetime(year: 2024, month: 07, day: 3))
    gantt.milestone([Final report], date.submission)
  }
)
