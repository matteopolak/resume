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
			#text(size: 10pt, [3#super[rd] year Computer Science student])
		],
		align(right, about)
	)),
	alignment: start + horizon
)

#space(h: 0.3in)

Hey Alison,

I am writing to express my interest in the Co-op Software Developer position at Cliniconex. As a third-year Computer Science student at the University of Ottawa, with a focus on full-stack development and hands-on experience in various technologies, I am excited about the opportunity to contribute to your team and help advance healthcare communication solutions.

At Ciena, I developed and maintained a variety of full-stack projects, including a resource booking platform that reduced wait times by over 99%. I have experience building and integrating RESTful APIs, utilizing technologies such as JavaScript, PostgreSQL, and MongoDB, and I am confident that my skills in both front-end and back-end development will allow me to make meaningful contributions to the projects at Cliniconex.

I am particularly drawn to the collaborative culture and innovative healthcare solutions that Cliniconex provides. The opportunity to work in a cross-functional team, design software-as-a-service solutions, and directly impact patient care is extremely motivating. I am eager to apply my technical skills, learn from experienced developers, and contribute to the software solutions that improve communication and collaboration within healthcare environments.

I am confident that my experience in software development, combined with my enthusiasm for learning and problem-solving, will make me a strong addition to your team. I look forward to the opportunity to contribute to Cliniconex and further develop my skills.

Thank you for considering my application. I am happy to provide any additional information or references as needed, just let me know!

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

