#import "@preview/quick-maths:0.2.1": shorthands
#import "@preview/ctheorems:1.1.3": *
#import "@local/utils:0.1.0": *

#let show-examples-state = state("show-examples", true)
#let show-exercises-state = state("show-exercises", true)
#let show-proofs-state = state("show-proofs", true)

#show: thmrules.with(qed-symbol: $square$)
#let doc_fac(
  title: none,
  fontsize: 11pt,
  numbering: "I 1 a i  ",
  assets-numbering: "1.a.",
  page-numbering: "I",
  show-examples: true,
  show-exercises: true,
  show-proofs: true,
  bar: true,
  doc,
) = {
  show-examples-state.update(show-examples)
  show-exercises-state.update(show-exercises)
  show-proofs-state.update(show-proofs)

  set heading(numbering: numbering)
  set text(font: "New Computer Modern", size: fontsize, lang: "fr")
  set linebreak(justify: true)
  set par(leading: 1em, spacing: 1.3em, justify: true, linebreaks: "optimized")
  show raw: set text(font: "New Computer Modern")

  show math.cases: it => {
    if it.has("label") { return it }
    let (children, ..fields) = it.fields()
    [#math.cases(..children.map(math.display), ..fields)<touched>]
  }

  show math.equation.where(block: false): it => {
    math.display(it)
  }

  set enum(numbering: "a) i)")
  let hd = [
    #align(right)[
      #set text(11pt)
      #title
    ]
    #if bar {
      line(length: 100%, stroke: .5pt)
    }
  ]

  set page(
    paper: "a4",
    header: hd,
    numbering: page-numbering,
    margin: (top: fontsize + 4em, bottom: 2em, left: 5em, right: 5em),
  )

  set grid(
    row-gutter: 1.5em,
    column-gutter: 2em,
  )

  show: shorthands.with(
    ($+-$, $plus.minus$),
    ($<===$, $arrow.l.double.long$),
    ($<==$, $arrow.l.double$),
    ($emptyset$, $diameter$),
    ($<=$, $lt.eq.slant$),
    ($>=$, $gt.eq.slant$),
    ($(->$, $arrow.r.hook$),
    ($-+$, $minus.plus$),
  )

  doc
}

#let theorem = thmbox(
  "theorem",
  "Théorème",
  base_level: 1,
  separator: "\n",
  stroke: rgb(62, 188, 247),
  fill: rgb(62, 188, 247, 30),
  bodyfmt: bd => {
    set text(font: "New Computer Modern", style: "italic")
    bd
  },
)

#let corollary = thmbox(
  "theorem",
  "Corollaire",
  base_level: 1,
  separator: "\n",
  stroke: rgb("#60d1ac"),
  fill: rgb("#60d1ab36"),
  bodyfmt: bd => {
    set text(font: "New Computer Modern", style: "italic")
    bd
  },
)

#let lemma = thmbox(
  "theorem",
  "Lemme",
  base_level: 1,
  separator: "\n",
  stroke: rgb("#60b655"),
  fill: rgb("#60b6554c"),
  bodyfmt: bd => {
    set text(font: "New Computer Modern", style: "italic")
    bd
  },
)

#let property = thmbox(
  "theorem",
  "Propriété",
  base_level: 1,
  separator: "\n",
  stroke: rgb("#f8554f"),
  fill: rgb("#f8554f4c"),
  bodyfmt: bd => {
    set text(font: "New Computer Modern", style: "italic")
    bd
  },
)
#let proposition = thmbox(
  "theorem",
  "Proposition",
  base_level: 1,
  separator: "\n",
  stroke: rgb("#aa6fd1"),
  fill: rgb("#aa6fd14c"),
  bodyfmt: bd => {
    set text(font: "New Computer Modern", style: "italic")
    bd
  },
)

#let _exercice_impl = thmplain(
  "exercice",
  "Exercice",
  base_level: 1,
)

#let exercice(..args) = context {
  if show-exercises-state.get() {
    _exercice_impl(..args)
  }
}

#let _example_impl = thmplain(
  "example",
  "Exemple",
  base_level: 1,
)

#let example(..args) = context {
  if show-examples-state.get() {
    _example_impl(..args)
  }
}

#let notation = thmbox(
  "notation",
  "Notation",
  base_level: 1,
  separator: "\n",
  stroke: rgb(0, 0, 0),
)

#let remark = thmbox(
  "remark",
  "Remarque",
  base_level: 1,
  separator: "\n",
  stroke: rgb("#dadada"),
  fill: rgb("#dadada4c"),
  bodyfmt: bd => {
    set text(font: "New Computer Modern", style: "italic")
    bd
  },
)
#let method = thmbox(
  "method",
  "Méthode",
  base_level: 1,
  separator: "\n",
  stroke: rgb("#dadada"),
  fill: rgb("#dadada4c"),
  bodyfmt: bd => {
    set text(font: "New Computer Modern", style: "italic")
    bd
  },
)

#let definition = thmbox(
  "theorem",
  "Définition",
  base_level: 1,
  separator: "\n",
  stroke: rgb("#7cdbdb"),
  fill: rgb("#7cdbdb4c"),
  bodyfmt: bd => {
    set text(font: "New Computer Modern", style: "italic")
    bd
  },
)

#let vocabulary = thmbox(
  "theorem",
  "Vocabulaire",
  base_level: 1,
  separator: "\n",
  stroke: rgb("#9ddb7c"),
  fill: rgb("#a5db7c4c"),
  bodyfmt: bd => {
    set text(font: "New Computer Modern", style: "italic")
    bd
  },
)

#let _proof_impl = thmproof("proof", "Preuve")

#let proof(..args) = context {
  if show-proofs-state.get() {
    _proof_impl(..args)
  }
}

