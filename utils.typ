// Creates a consistent vertical spacing
#let space(h: 0.6em) = v(h, weak: true)

// Shortcut for evaluating a string as markup
#let markup(str) = eval(str, mode: "markup")

// Formats a job entry
#let job(title: "", company: "", location: "", start: "", end: "Present", achievements: ()) = {
	let format = "[month repr:long] [year]"
	let end = if type(end) == str [#end] else [#end.display(format)]

	stack(
		dir: ltr,
		align(alignment.start, [*#title* \ #company]),
		align(alignment.end, [#start.display(format) --- #end \ #emph(location)])
	)

	space(h: 0.7em)
	list(..achievements)
}

// Formats a project entry
#let project(title: "", github: "", tags: (), achievements: ()) = {
	[
		#emph(link("https://github.com/" + github, title))
		#tags.map(strong).join(", ")
	]

	space(h: 0.7em)
	list(..achievements)
}

// Creates a section heading
#let section(title: "", right: "") = {
	[
		*#upper(title)*
		#h(1fr)
		#right
	]

	line(length: 100%)
}

