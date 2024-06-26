//
// Description: Import other modules so you only need to import the helpers
// Use        : #import "../00-templates/helpers.typ": *
// Author     : Silvan Zahno
//
#import "../00-templates/boxes.typ": *
#import "../00-templates/constants.typ": *
#import "../00-templates/items.typ": *
#import "../00-templates/sections.typ": *
#import "../00-templates/tablex.typ": *
#import "../00-templates/slides_template.typ": *
#import "../01-settings/metadata.typ": *

#import "../00-templates/glossarium.typ": *
#show: make-glossary

// Private packages
#import "/00-packages/rivet/src/lib.typ" as rivet: schema
#import "/00-packages/chronos/src/lib.typ" as chronos
#import "/00-packages/elegantt/src/lib.typ" as gantt

// External Plugins
// Fancy pretty print with line numbers and stuff
#import "@preview/codelst:2.0.1": sourcecode
#import "@preview/wrap-it:0.1.0": wrap-content

#let myref(label) = locate(loc =>{
    if query(label,loc).len() != 0 {
        ref(label)
    } else {
        text(fill: red)[?]
    }
})

//-------------------------------------
// Table of content
//
#let toc(
  lang: "en",
  tableof: (
    toc: true,
    minitoc : false,
    tof: false,
    tot: false,
    tol: false,
    toe: false,
  ),
  before: <sec:glossary>,
  indent: true,
  depth: none,
) = {
  // Table of content
  if tableof.toc == true {
    let title = [#if lang == "de" {
      "Inhalt"
    } else if lang == "fr" {
      "Contenu"
    } else {
        "Contents"
    }]
    if before != none {
      outline(
        title: title,
        target: selector(heading).before(before, inclusive: true),
        indent: indent,
        depth: depth,
      )
    } else {
      outline(
        title: title,
        indent: indent,
        depth: depth,
      )
    }
  }

  // Table of figures
  if tableof.tof == true {
    outline(
      title: [#if lang == "de" {"Abbildungen"} else if lang == "fr" {"Figures"} else {"Figures"}],
      target: figure.where(kind: image),
      indent: indent,
      depth: depth,
    )
  }

  // Table of tables
  if tableof.tot == true {
    outline(
      title: [#if lang == "de" {[Tabellen]} else if lang == "fr" {[Tables]} else {[Tables]}],
      target: figure.where(kind: table),
      indent: indent,
      depth: depth,
    )
  }

  // Table of listings
  if tableof.tol == true {
    outline(
      title: [#if lang == "de" {"Programme"} else if lang == "fr" {"Programmes"} else {"Listings"}],
      target: figure.where(kind: raw),
      indent: indent,
      depth: depth,
    )
  }

  // Table of equation
  if tableof.toe == true {
    outline(
      title: [#if lang == "de" {"Gleichungen"} else if lang == "fr" {"Équations"} else {"Equations"}],
      target: math.equation.where(block:true),
      indent: indent,
      depth: depth,
    )
  }
}


#let minitoc(
  after: none,
  before: none,
  addline: true,
  stroke: 0.5pt,
  length: 100%,
  depth: depth,
  indent: false,
) = {
  v(2em)
  text(large, [*Contents*])
  if addline == true {
    line(length:length, stroke:stroke)
  }
  let h = selector(heading.where(level: 2))
    .or(heading.where(level: 3))
    .or(heading.where(level: 4))
    .or(heading.where(level: 5))
    .or(heading.where(level: 6))
    .or(heading.where(level: 7))
    .or(heading.where(level: 8))
    .or(heading.where(level: 9))
    .or(heading.where(level: 10))

  outline(
    
    title: none,
    target: selector(h)
      .after(after)
      .before(before, inclusive: false),
    depth: depth,
    indent: indent,
  )
  if addline == true {
    line(length:length, stroke:stroke)
  }
}

//-------------------------------------
// Heading shift
//
#let unshift_prefix(prefix, content) = style((s) => {
    pad(left: -measure(prefix, s).width, prefix + content)
  })

//-------------------------------------
// Research
//
// item, item, item and item List
//
#let enumerating_authors(
  items: none,
) = {
  let i = 1
  if items != none {
    for item in items {
      if item != none {
        if item.name != none and item.institute != none {
          [#item.name#super(repr(item.institute))]
        } else if item.name != none {
          [#item.name]
        }
        if i < items.len() {
          [, ]
        }
      }
      i = i + 1
    }
  }
}

#let enumerating_institutes(
  items: none,
) = {
  let i = 1
  if items != none {
    for item in items {
      if item != none {
        [_#super(repr(i))_ #if item.research_group != none { [_ #item.research_group - _]} _ #item.name __, #item.address _ \ ]
        i = i + 1
      }
    }
  }
}

//-------------------------------------
// Script
//
// item, item, item and item List
//
#let enumerating_items(
  items: none,
) = {
  let i = 1
  if items != none {
    for item in items {
      if item != none {
        [#item]
        if i < items.len() {
          [, ]
        }
      }
      i = i + 1
    }
  }
}
#let enumerating_links(
  names: none,
  links: none,
) = {
  if names != none {
    let i = 0
    for name in names {
      if name != none {
        [#link(links.at(i))[#name]]
        if i+1 < names.len() {
          [, ]
        }
      }
      i = i + 1
    }
  }
}
#let enumerating_emails(
  names:  none,
  emails: none,
) = {
  if names != none {
    let i = 0
    for name in names {
      if name != none {
        [#link("mailto:"+emails.at(i))[#name]]
        if i+1 < names.len() {
        [, ]
        }
      }
      i = i + 1
    }
  }
}

//-------------------------------------
// safe_link
//
#let safe_link(
  name: none,
  url: none,
) = {
  if name != none {
    if url != none {
      link(url)[#name]
    } else  {
      name
    }
  }
}

//-------------------------------------
// Counter
//
#let word_counter_init() = {[
  #show regex("\b\w+\b"): it => counter("words").step() + it
]}
#let word_count(preamble:"Word count:") = {[
  #preamble #counter("words").display()
]}

#let char_counter_init() = {
  show regex(".+"): it => counter("chars").step() + it
}
#let char_count(preamble:"Char count:") = {[
  #preamble #counter("chars").display()
]}

//-------------------------------------
// Option Style
//
#let option_style(
  type: "draft",
  size: small,
  style: "italic",
  fill: gray-40,
  body) = {[
  #if option.type == type {text(size:size, style:style, fill:fill)[#body]
  }
]}

#let bib-state = state("bibliography", false)

#let todo(body) = [
  #let rblock = block.with(stroke: red, radius: 0.5em, fill: red.lighten(80%))
  #let top-left = place.with(top + left, dx: 1em, dy: -0.35em)
  #block(inset: (top: 0.35em), {
    rblock(width: 100%, inset: 1em, body)
    top-left(rblock(fill: white, outset: 0.25em, text(fill: red)[*TODO*]))
  })
  <todo>
]

#let outline-todos(title: [TODOS]) = {
  heading(numbering: none, outlined: false, title)
  locate(loc => {
    let queried-todos = query(<todo>, loc)
    let headings = ()
    let last-heading
    for todo in queried-todos {
      let new-last-heading = query(selector(heading).before(todo.location()), loc).last()
      if last-heading != new-last-heading {
        headings.push((heading: new-last-heading, todos: (todo,)))
         last-heading = new-last-heading
      } else {
        headings.last().todos.push(todo)
      }
    }

    for head in headings {
      link(head.heading.location())[
        #numbering(head.heading.numbering, ..counter(heading).at(head.heading.location()))
        #head.heading.body
      ]
      [ ]
      box(width: 1fr, repeat[.])
      [ ]
      [#head.heading.location().page()]

      linebreak()
      pad(left: 1em, head.todos.map((todo) => {
        list.item(link(todo.location(), todo.body.children.at(0).body))
      }).join())
    }
  })
}

#let subject(
  file,
  heading-offset: 0,
  after: none,
  before: none,
) = [
  #if (after != none and before != none) {
    minitoc(after:after, before:before, indent: true)
    pagebreak()
  }
  #set heading(offset: heading-offset)
  #include "../02-main/" + file + ".typ"
  #set heading(offset: 0)
]