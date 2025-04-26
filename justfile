# watch for resume and cover letter changes
watch:
	typst watch resume.typ --pdf-standard 1.7

watch-cover:
	typst watch cover.typ --pdf-standard 1.7

build-cover NAME:
	typst compile cover.typ {{NAME}}.pdf --pdf-standard 1.7
