#import "utils.typ": *

#let config = toml("config.toml")

#set page(paper: "us-letter", margin: 0.4in)
#set document(
	title: config.at("title", default: config.name + "'s Cover Letter"),
	author: config.at("author", default: config.name),
	keywords: config.keywords.join(", "),
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
	config.name
)

#let about = text(
	size: 10pt,
	stack(
		dir: ltr,
		spacing: 0.5em,
		[
			#config.phone \
			#link("mailto:" + config.email, config.email) \
			#link("https://linkedin.com/in/" + config.linkedin, "linkedin/" + config.linkedin)
		],
		// vertical line
		line(
			stroke: 1pt + white,
			angle: 90deg,
			length: 40pt
		),
		align(start, [
			#config.location \
			#link("https://" + config.website, config.website) \
			#link("https://github.com/" + config.github, "github/" + config.github)
		])
	)
)

#header(
	text(fill: white, stack(dir: ltr, [
			#name \
			#text(size: 10pt, config.major + " student")
		],
		align(right, about)
	)),
	alignment: start + horizon
)

#space(h: 0.3in)

#text(
	weight: "semibold",
	size: 12pt,
	[
		John Smith \
		Hiring Manager \
		Acme Corp \
		123 Main St \
		Springfield, IL 62701
	]
)

#line(length: 100%)

Dear Hiring Manager,

#lorem(50)

#lorem(75)

#lorem(40)

#lorem(75)

#lorem(50)

Thank you for your time and consideration. I look forward to hearing from you soon.

#line(length: 100%)

Regards, \
#config.name
