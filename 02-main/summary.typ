// HEADER
#import "/00-templates/helpers.typ": *
#import "/00-packages/summary/src/summary.typ": *

#show: summary.with(
  title: title,
  student: author.name,
  //picture: "/04-resources/placeholder.svg",
  year: date.year,
  degree: school.orientation,
  field: school.specialisation,
  professor: professor,
  //partner: partner,
  objective: [
    Produce attack scenarios that include an unsecure situation, an attack, and a solution to secure against such attack. These scenarios must be usable as the basis for a laboratory experience for students or industrial partner formation.
  ] // one sentence with max. 240 characters, with spaces. 

  // body max. 1200 characters, with spaces.
)

#todo([
  Like an abstract but for open public.
])
