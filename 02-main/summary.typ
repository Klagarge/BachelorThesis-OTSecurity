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
  //objective: [] // one sentence with max. 240 characters, with spaces. 

  // body max. 1200 characters, with spaces.
)


#lorem(120)
