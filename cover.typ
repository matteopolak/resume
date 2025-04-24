#import "utils.typ": *

#let config = toml("config.toml")

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

Dear Sentry Team,

I'm a third-year Computer Science student at the University of Ottawa, and I’m excited to apply for the Software Engineering Intern position for Fall 2025. I’ve long admired Sentry’s commitment to helping developers ship better software, and I’m drawn to the idea of joining a team where interns are treated like full engineers—working on real projects, writing real code, and learning in the process.

Over the course of my internships at Solace and Ciena, I’ve contributed across the stack—optimizing backend services in Java and Rust, building user-facing features with Nuxt and tRPC, and improving test coverage and infrastructure. I’ve implemented rate-limiting, reworked legacy systems, and integrated OpenAPI tooling to improve both performance and developer experience. These projects have taught me how to work collaboratively, communicate effectively in reviews, and deliver reliable code on real-world systems.

In my personal projects, I’ve built everything from a recipe recommendation platform powered by a text-embedding model to a 3D game engine in Rust with custom rendering and physics. I’m also an active open-source contributor to projects like SvelteKit and Lucia, which has deepened my appreciation for maintainable, community-driven software.

I’m particularly excited by Sentry’s hybrid work culture and the chance to work alongside engineers who care about building great tools for other developers. The idea of owning a project from design to deployment, with mentorship along the way, is exactly the kind of challenge I’m looking for.

Thank you for considering my application. I’d love the opportunity to bring my experience, curiosity, and enthusiasm to the team at Sentry.

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

