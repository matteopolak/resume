#let config = toml("config.toml")

// Document setup
#set page(paper: "us-letter", margin: 0.4in)
#set document(
	title: config.at("title", default: config.name + "'s Resume"),
	author: config.at("author", default: config.name),
	keywords: config.keywords.join(", "),
)

// Typography setup
#set text(font: "open sans", weight: "regular", size: 10.5pt, hyphenate: true)
#set par(leading: 0.35em)
#set list(indent: 1em, spacing: 0.65em, tight: false)

// Underline all links
#show link: underline

// Creates a horizontal line with a small amount of vertical padding
#let tline(head) = [
	#head
	#v(0.6em, weak: true)
	#line(length: 100%, stroke: 0.5pt)
	#v(0.6em, weak: true)
]

// Formats a job entry
#let job(title: "", company: "", location: "", start: "", end: "Present", achievements: ()) = {
	let format = "[month repr:long] [year]"
	let end = if type(end) == str [#end] else [#end.display(format)]

	stack(
		dir: ltr,
		align(alignment.start, [*#title* \ #company]),
		align(alignment.end, [#start.display(format) --- #end \ _#(location)_])
	)

	list(..achievements)
}

// Formats a project entry
#let project(title: "", github: "", tags: (), achievements: ()) = {
	[
		#emph(link("https://github.com/" + github, title))
		#tags.map(t => [*#t*]).join(", ")
	]

	list(..achievements)
}

#let name = text(
	size: 35pt,
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
	align(center + horizon, [#name #v(1em, weak: true) #about])
)

#v(0.25in, weak: true)

#tline(stack(
	dir: ltr,
	align(start, upper([*Education*])),
	align(end, eval(config.education.blurb, mode: "markup"))
))

#stack(
	dir: ltr,
	align(start, [*#config.education.degree*, #config.education.school]),
	align(end, [_#(config.education.graduation)_])
)

#tline(upper([*Technical Skills*]))

#text(spacing: 100%, config.skills.join(", "))

#tline(upper([*Professional Experience*]))

#for data in config.experience {
	job(
		..data,
		achievements: data.achievements
			.map(a => eval(a, mode: "markup"))
	)
}

#tline(upper([*Projects*]))

#for data in config.project {
	project(
		..data,
		achievements: data.achievements
			.map(a => eval(a, mode: "markup"))
	)
}

#tline(upper([*Achievements*]))

#set list(indent: 0.15in)

#list(
	..config.achievements
		.map(a => eval(a, mode: "markup"))
)

