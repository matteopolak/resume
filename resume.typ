#set page(paper: "us-letter", margin: 0.4in)
#set text(font: "Open Sans", weight: "regular", size: 11pt, hyphenate: true)
#set par(leading: 0.5em)

// Creates a link with an underline
#let ulink(url, text) = underline(link(url, text))
#let config = toml("config.toml")

#let name = text(
	size: 25pt,
	weight: "bold",
	fill: white,
	[#config.about.name]
)

#let about = text(
	fill: white,
	[
		#config.about.phone • #config.about.location \
		#ulink("mailto:" + config.about.email, config.about.email) •
		#ulink("https://" + config.about.website, config.about.website) •
		#ulink("https://github.com/" + config.about.github, "github.com/" + config.about.github) •
		#ulink("https://linkedin.com/in/" + config.about.linkedin, "linkedin.com/in/" + config.about.linkedin)
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

#stack(
	dir: ltr,
	align(start, upper([*Education*])),
	align(end, eval(config.education.blurb, mode: "markup"))
)

#v(0.6em, weak: true)
#line(length: 100%)
#v(0.6em, weak: true)

#stack(
	dir: ltr,
	align(start, [*Co-op Honours Bachelor of Computer Science*, University of Ottawa]),
	align(end, [_Expected 2026_])
)

#upper([*Technical Skills*])
#v(0.6em, weak: true)
#line(length: 100%)
#v(0.6em, weak: true)

#text(spacing: 50%)[
	Rust, TypeScript, Go, Python, Java, C++, C, C\#, Groovy, PostgreSQL,
	MySQL, MongoDB, Firebase, Redis, Memcached, Qdrant, InfluxDB, TimescaleDB,
	JavaScript, HTML, CSS, Svelte, Vue, React, SvelteKit, Nuxt, Next.js,
	GSAP (GreenSock), Flutter, Express.js, Fastify, Axum, tRPC, JSONSchema,
	OpenAPI, Swagger, Zod, Drizzle, Diesel, PyTorch, TensorFlow, Keras, Gerrit,
	Jira, Confluence, Skia, wgpu, OpenStack, Docker, Unity, Bevy, Git, Gerrit
]

#upper([*Professional Experience*])
#v(0.6em, weak: true)
#line(length: 100%)
#v(0.6em, weak: true)

// title: str | content
// company: str | content
// location: str | content
// start: datetime
// end: datetime | none
// achivements: array[str | content]
#let job(title: "", company: "", location: "", start: "", end: "Present", achievements: ()) = {
	let format = "[month repr:long] [year]"
	let end = if type(end) == str [#end] else [#end.display(format)]

	stack(
		dir: ltr,
		align(alignment.start, [*#title* \ #company]),
		align(alignment.end, [#start.display(format) - #end \ _#(location)_])
	)

	list(indent: 0.15in, ..achievements)
}

#job(
	title: "Software Engineer",
	company: "Ciena",
	location: "Ottawa, ON (Remote)",
	start: datetime(year: 2023, month: 5, day: 1),
	achievements: (
		[Authored a code ownership and test management API with *Express.js*, *Zod*, *Node.js*, and *MongoDB* that improved workflow efficiency and test coverage by 25%.],
		[Developed a log query tool with *Flask*, *Vue*, and *TailwindCSS* that increased debugging efficiency by 30%.],
		[Upgraded and improved a computing management tool with *Python*, *OpenStack*, and *Jenkins* that reduced downtime and failures by 15%.],
		[Implemented a full-stack computing resource booking platform with *Vue*, *Nuxt*, *PostgreSQL*, and *tRPC* that reduced resource conflicts by 20%.]
	)
)

#job(
	title: "STEM Instructor",
	company: "RoboEDU",
	location: "North York, ON (Remote)",
	start: datetime(year: 2022, month: 6, day: 1),
	end: datetime(year: 2022, month: 8, day: 1),
	achievements: (
		[Developed course material and led students through *Python* and Scratch courses.],
		[Formulated a teaching plan to increase student productivity and engagement by 20%.]
	)
)

#upper([*Projects*])
#v(0.6em, weak: true)
#line(length: 100%)
#v(0.6em, weak: true)

#let project(title: "", github: "", tech: (), achievements: ()) = {
	[
		#emph(ulink("https://github.com/" + github, title))
		#tech.map(t => [*#t*]).join(", ")
	]

	list(indent: 0.15in, ..achievements)
}

#project(
	title: "StatPixel",
	github: "statpixel-rs/statpixel",
	tech: ("Rust", "PostgreSQL", "Redis", "Skia", "wgpu", "wgsl"),
	achievements: (
		[Developed an application to track and visualize player statistics for Minecraft.],
		[Built an *image generation* pipeline with *Skia* to generate dynamic images.],
		[Created 2,000+ leaderboards with *Redis* and *PostgreSQL* to efficiently retrieve top performers.],
		[Leveraged *code generation* to reduce boilerplate and improve performance.]
	)
)

#project(
	title: "Basket",
	github: "matteopolak/basket",
	tech: ("Rust", "HTTP"),
	achievements: (
		[Implemented the *HTTP/1.1* protocol with *Rust* to handle requests and responses.],
		[Created an HTTP client from scratch using *TCP* sockets.],
		[Developed a *multi-threaded HTTP server* with built-in routing support.]
	)
)

#project(
	title: "Crave",
	github: "matteopolak/crave",
	tech: ("Svelte", "TypeScript", "PostgreSQL", "tRPC", "Drizzle", "PyTorch"),
	achievements: (
		[Designed a *recipe sharing* platform with personalized recommendations and a social feed.],
		[Integrated a text embedding model with *PyTorch* and *Flask* to vectorize and rank recipes.],
		[Implemented a user-friendly interface with *DaisyUI* and *TailwindCSS*.]
	)
)

#upper([*Achievements*])
#v(0.6em, weak: true)
#line(length: 100%)
#v(0.6em, weak: true)

#set list(indent: 0.15in)

- 2023 #ulink("https://hack-the-hill.devpost.com", "Hack the Hill") Hackathon,
  1st (Ciena track), Best Developer Experience, Best Cybersecurity Project
- 2023 #ulink("https://all-in-hackathon.devpost.com", "MLH x {all in}") Hackathon, 1st Overall
- 2023 #ulink("https://maphacks-2.devpost.com", "MapHacks 2") Hackathon, 1st Overall,
  Best Sustainable Travel Hack
- 2022 Skills Ontario Coding Competition, 1st

