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
	config.name
)

#let about = [
	#config.phone • #config.location \
	#link("mailto:" + config.email, config.email) •
	#link("https://" + config.website, config.website) •
	#link("https://github.com/" + config.github, "github.com/" + config.github) •
	#link("https://linkedin.com/in/" + config.linkedin, "linkedin.com/in/" + config.linkedin)
]

#header(text(fill: white, [#name #space(h: 1em) #about]))

#space(h: 0.3in)

#section(title: "Education", right: markup(config.education.blurb))

*#config.education.degree*, #config.education.school
#h(1fr)
_#emph(config.education.graduation)_

#section(title: "Technical Skills", right: config.skills.soft.join(", "))
#text(spacing: 100%, config.skills.technical.join(", "))

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

