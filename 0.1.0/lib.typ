#import "@preview/quick-maths:0.2.1": shorthands
#import "@preview/ctheorems:1.1.3": *
#import "@local/utils:0.1.0": *

#show: thmrules.with(qed-symbol: $square$)
#let doc_fac(title: none, fontsize: 11pt, numbering: "I 1 a i  ", assets-numbering: "1.a.", page-numbering: "I", doc) = {
  set heading(numbering: numbering)
  set text(font: "New Computer Modern", size: fontsize, lang: "fr")
  set linebreak(justify: true)
  set par(leading: 0.8em, spacing: 1.2em, justify: true, linebreaks: "optimized")
  show raw: set text(font: "New Computer Modern")
  show math.cases: it => {
    show math.frac: frc => {math.display(frc)}
    it
  }
  set enum(numbering: "a) i)")
  let hd = [
    #align(center)[
      #set text(15pt)
      #title
    ]
  ]

  set page(
    paper: "a4",
    header: hd,
    numbering: page-numbering,
    margin: (top: fontsize + 2em, bottom : 2em, left: 5em,right:5em)
  )

  set grid(
    row-gutter: 1.5em,
    column-gutter: 2em,
  )

  show: shorthands.with(
    ($+-$, $plus.minus$),
    ($<===$, $sym.arrow.l.double.long$),
    ($<==$, arrow.l.double),
    ($emptyset$, $diameter$),
    ($<=$, sym.lt.eq.slant),
    ($>=$, sym.gt.eq.slant),
    ($(->$, $arrow.r.hook$),
  )

  doc
}

#let theorem = thmbox(
  "theorem",
  "Théorème",
  base_level: 1,
  separator: "\n",
  stroke: rgb(62, 188, 247),
  fill: rgb(62,188,247,30),
  bodyfmt: (bd) => {
    set text(font: "New Computer Modern", style: "italic");
    bd
  }
)

#let lemma = thmbox(
  "theorem",
  "Lemme",
  base_level: 1,
  separator : "\n",
  stroke: rgb(96, 182, 85),
  fill: rgb(96, 182, 85, 30),
  bodyfmt: (bd) => {
    set text(font: "New Computer Modern", style: "italic");
    bd;
  }
)

#let property = thmbox(
  "theorem",
  "Propriété",
  base_level: 1,
  separator : "\n",
  stroke: rgb(247, 85, 79),
  fill: rgb(247, 85, 79, 30),
  bodyfmt: (bd) => {
    set text(font: "New Computer Modern", style: "italic");
    bd;
  }
)
#let proposition = thmbox(
  "theorem",
  "Proposition",
  base_level: 1,
  separator : "\n",
  stroke: rgb("#aa6fd1"),
  fill: rgb("#aa6fd14c"),
  bodyfmt: (bd) => {
    set text(font: "New Computer Modern", style: "italic");
    bd;
  }
)

#let exercice = thmplain(
  "exercice",
  "Exercice",
  base_level: 1,
)

#let example = thmplain(
  "example",
  "Exemple",
  base_level: 1,
)

#let notation = thmbox(
  "theorem",
  "Notation",
  base_level: 1,
  separator: "\n",
  stroke: rgb(0,0,0)
)

#let remark = thmbox(
  "theorem",
  "Remarque",
  base_level: 1,
  separator : "\n",
  stroke: rgb("#dadada"),
  fill: rgb("#dadada4c"),
  bodyfmt: (bd) => {
    set text(font: "New Computer Modern", style: "italic");
    bd;
  }
)

#let definition = thmbox(
  "theorem",
  "Définition",
  base_level: 1,
  separator : "\n",
  stroke: rgb("#7cdbdb"),
  fill: rgb("#7cdbdb4c"),
  bodyfmt: (bd) => {
    set text(font: "New Computer Modern", style: "italic");
    bd;
  }
)

#let proof = thmproof("proof", "Preuve")
