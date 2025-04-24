#import "../utils.typ": *

#let config = toml("../config.toml")

#set page(paper: "us-letter", margin: 0.4in)
#set document(
  title: config.at("title", default: config.name + "'s Cover Letter"),
  author: config.at("author", default: config.name),
  keywords: "cover letter, software engineer, developer, programmer",
)

#set text(font: "open sans", weight: "regular", size: 10.5pt, hyphenate: true)
#set par(leading: 0.5em)
#set list(indent: 1em, spacing: 0.65em, tight: false)
#set block(below: 2em)

#let name = text(
  size: 40pt,
  font: "jersey 10",
  weight: "bold",
  fill: white,
  config.name,
)

#let about = text(
  size: 10pt,
  stack(
    dir: ltr,
    spacing: 0.5em,
    [
      #config.phone \
      #link("mailto:" + config.email, config.email) \
      #link(
        "https://linkedin.com/in/" + config.linkedin,
        "linkedin/" + config.linkedin,
      )
    ],
    // vertical line
    line(
      stroke: 1pt + white,
      angle: 90deg,
      length: 40pt,
    ),
    align(
      start,
      [
        #config.location \
        #link("https://" + config.website, config.website) \
        #link("https://github.com/" + config.github, "github/" + config.github)
      ],
    ),
  ),
)

#header(
  text(
    fill: white,
    stack(
      dir: ltr,
      [
        #name \
        #text(size: 10pt, [3#super[rd] year Computer Science student])
      ],
      align(right, about),
    ),
  ),
  alignment: start + horizon,
  padding: 0.4in,
)

#space(h: 0.2in)



#line(length: 100%)

Regards, \
#config.name

#space(h: 0.1fr)

#box(
  width: 100%,
  fill: rgb(38, 38, 38),
  // but since this is at the top, we want to fill
  // the margin with the background of the box
  outset: (x: 0.4in, bottom: 0.4in),
)

