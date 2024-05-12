#import "utils.typ": *

#let config = toml("config.toml")

// document setup
#set page(paper: "us-letter", margin: 0.4in)
#set document(
	title: config.at("title", default: config.name + "'s Resume"),
	author: config.at("author", default: config.name),
	keywords: config.keywords.join(", "),
)

// typography setup
#set text(font: "open sans", weight: "regular", size: 10.5pt, hyphenate: true)
#set par(leading: 0.5em)
#set list(indent: 1em, spacing: 0.65em, tight: false)

// underline all links
#show link: underline
// use better spacing around lines
#show line: it => [
	#space()
	#it
	#space()
]

#let name = text(
	size: 45pt,
	font: "jersey 10",
	weight: "bold",
	fill: white,
	config.name
)

#let about = text(
	fill: white,
	[
		#config.phone • #config.location \
		#link("mailto:" + config.email, config.email) •
		#link("https://" + config.website, config.website) •
		#link("https://github.com/" + config.github, "github.com/" + config.github) •
		#link("https://linkedin.com/in/" + config.linkedin, "linkedin.com/in/" + config.linkedin)
	]
)

#box(
	width: 100%,
	fill: rgb(38, 38, 38),
	// we want to push the content below it down
	inset: (bottom: 0.4in),
	// but since this is at the top, we want to fill
	// the margin with the background of the box
	outset: (x: 0.4in, top: 0.4in),
	align(center + horizon, [#name #space(h: 1em) #about])
)

#space(h: 0.3in)

#section(title: "Education", right: markup(config.education.blurb))

*#config.education.degree*, #config.education.school
#h(1fr)
_#emph(config.education.graduation)_

#section(title: "Technical Skills")
#text(spacing: 100%, config.skills.join(", "))

#section(title: "Professional Experience")

#for data in config.experience {
	job(
		..data,
		achievements: data.achievements.map(markup)
	)
}

#section(title: "Projects")

#for data in config.project {
	project(
		..data,
		achievements: data.achievements.map(markup)
	)
}

#section(title: "Achievements")
#list(..config.achievements.map(markup))

