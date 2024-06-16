#let remove-accents(word) = {
  return word.replace("é", "e").replace("É", "E")
             .replace("è", "e").replace("È", "E")
             .replace("ê", "e").replace("Ê", "E")
             .replace("î", "i").replace("Î", "I")
             .replace("ç", "c").replace("Ç", "C")
             .replace("à", "a").replace("À", "A")
             .replace("â", "a").replace("Â", "A")
             .replace("ù", "u").replace("Ù", "U")
             .replace("ô", "o").replace("Ô", "O")
}

#let titlecase(s) = {
  let head = upper(s.first())
  let tail = s.slice(head.len())
  return head + tail
}

#let term(it) = context {
  let cnt = counter(figure.where(kind: "term"))
  let unique-key = "__termi-" + str(cnt.get().at(0))
  let term-key = "__term-" + it
  show figure.where(kind: "term"): it => it.caption
  [
    #figure(
      caption: [#link(label(term-key), underline(it))],
      kind: "term",
      supplement: "",
      numbering: none,
      []
    )
    #label(unique-key)
  ]
  cnt.step()
}

#let list-terms(title: "Lexique") = context {
  let terms = query(selector(figure.where(kind: "term")))
  let pages-by-term = ("_": 0)
  
  for (i, term) in terms.enumerate() {
    let txt = term.caption.body.body.body.text
    if not txt in pages-by-term {
      pages-by-term.insert(txt, ())
    }
    pages-by-term.at(txt).push((i, term.location().page()))
  }
  let _ = pages-by-term.remove("_")
  
  let ts = pages-by-term.pairs().sorted(key: p => remove-accents(lower(p.at(0))))
  
  [= #title]

  columns(2, {
    for (term, pages) in ts {
      let term-key = "__term-" + term
      let pages-content = []
      pages = pages.map(p => [
        #link(
          label("__termi-" + str(p.at(0))), str(p.at(1))
        )
      ])
  
      grid(
        columns: (auto, 1fr, auto),
        [#titlecase(term) #label(term-key)],
        repeat([.]),
        pages.join(",")
      )
    }
  })
}