#import "utils.typ": *

#let config = toml("config.toml")

// document setup
#set page(paper: "us-letter", margin: 0.4in)
#set document(
	title: config.at("title", default: config.name + "'s Resume"),
	author: config.at("author", default: config.name),
	keywords: "resume, curriculum vitae, cv, software engineer, developer, programmer"
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
	#link("https://github.com/" + config.github, "github/" + config.github) •
	#link("https://linkedin.com/in/" + config.linkedin, "linkedin/" + config.linkedin)
]

#header(text(fill: white, [#name #space(h: 1em) #about]))

#space(h: 0.3in)

#section(title: "Education", right: [Looking for a *January 2025*, 4-month position])

*Co-op Honours Bachelor of Computer Science*, University of Ottawa
#h(1fr)
_Expected 2026_

#section(title: "Professional Experience")

#job(
	title: "Software Engineer",
	company: "Ciena",
	location: "Ottawa, ON (Remote)",
	start: datetime(year: 2023, month: 5, day: 1),
	achievements: (
		[Authored a code ownership and test management API with *Express.js*, *Zod*, *Node.js*, and *MongoDB* that improved workflow efficiency and test coverage by 25%.],
		[Upgraded and improved a computing management tool with *Python*, *OpenStack*, and *Ansible* that reduced downtime and failures by 40%.],
		[Released a full-stack computing resource booking platform with *Nuxt*, *PostgreSQL*, and *tRPC* that reduced order wait times by 95%.],
		[Designed and implemented a *Rust* microservice to categorize and assign errors, improving MTTR by 30%.]
	)
)

#job(
	title: "STEM Instructor",
	company: "RoboEDU",
	location: "North York, ON (Remote)",
	start: datetime(year: 2022, month: 6, day: 1),
	end: datetime(year: 2022, month: 08, day: 1),
	achievements: (
		[Designed engaging course material and led 10-20 students through *Python* and Scratch courses.],
		[Devised a teaching plan that increased student productivity and engagement by 20%.]
	)
)

#section(title: "Achievements")
- 2023 #link("https://hack-the-hill.devpost.com", "Hack the Hill") Hackathon,
	1st (Ciena track), Best Developer Experience, Best Cybersecurity Project
- 2023 #link("https://all-in-hackathon.devpost.com", "MLH x {all in}") Hackathon, 1st Overall
- 2023 #link("https://maphacks-2.devpost.com", "MapHacks 2") Hackathon,
	1st Overall, Best Sustainable Travel Hack
- 2022 Skills Ontario Coding Competition, 1st --- 2021 Skills Ontario Coding Competition, 2nd

#section(title: "Projects")

#project(
	title: "StatPixel",
	github: "statpixel-rs/statpixel",
	tags: ("Rust", "PostgreSQL", "Redis", "Skia", "WGSL"),
	achievements: (
		[Cultivated a community of over 10,000 users to track and visualize their statistics in real time.],
		[Deployed an *image generation* pipeline with *Skia*, generating 500+ daily personalized images.],
		[Organized 2,000+ leaderboards with *Redis* to efficiently retrieve top performers in 2-10 milliseconds.],
		[Leveraged *code generation* to reduce boilerplate by 90% and improve performance.]
	)
)

#project(
	title: "Basket",
	github: "matteopolak/basket",
	tags: ("Rust", "HTTP"),
	achievements: (
		[Implemented a parser for the *HTTP/1.1* protocol in *Rust* with support for streaming data.],
		[Architected an HTTP client from scratch using *TCP* sockets, exposing a clean public API.],
		[Developed a *multi-threaded HTTP server* with built-in routing support and best-of-class performance.]
	)
)

#project(
	title: "Crave",
	github: "matteopolak/crave",
	tags: ("Svelte", "TypeScript", "PostgreSQL", "tRPC", "Drizzle", "PyTorch"),
	achievements: (
		[Launched a *recipe-sharing* platform with 25 users that creates personalized recommendations.],
		[Integrated a text embedding model with *PyTorch* and *Flask* to vectorize and rank 100,000 recipes.],
		[Designed a user-friendly interface with *DaisyUI* and *TailwindCSS*, improving CTR by 40%.]
	)
)

#section(title: "Technical Skills")
Rust, TypeScript, Go, Python, Java, C++, C, C\#, Groovy, PostgreSQL,
MySQL, MongoDB, Firebase, Redis, Memcached, Qdrant, InfluxDB, TimescaleDB,
JavaScript, HTML, CSS, Svelte, Vue, React, SvelteKit, Nuxt, Next.js,
GSAP (GreenSock), Flutter, Express.js, Fastify, Axum, tRPC, JSONSchema,
OpenAPI, Swagger, Zod, Drizzle, Diesel, PyTorch, TensorFlow, Keras, Gerrit,
Jira, Confluence, Skia, wgpu, OpenStack, Docker, Unity, Bevy, Git, Gerrit,
Ansible

