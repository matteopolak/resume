#import "utils.typ": *

#let config = toml("config.toml")

// document setup
#set page(paper: "us-letter", margin: (x: 0.3in, top: 0.3in, bottom: 0.15in))
#set document(
  title: config.at("title", default: config.name + "'s Resume"),
  author: config.at("author", default: config.name),
  keywords: "resume, curriculum vitae, cv, software engineer, developer, programmer",
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
  size: 35pt,
  font: "jersey 10",
  weight: "bold",
  config.name,
)

#let about = [
  #config.phone • #config.location \
  #link("mailto:" + config.email, config.email) •
  #link("https://" + config.website, config.website) •
  #link("https://github.com/" + config.github, "github/" + config.github) •
  #link(
    "https://linkedin.com/in/" + config.linkedin,
    "linkedin/" + config.linkedin,
  )
]

#header(
  text(
    fill: white,
    [
      #name
      #space(h: 1em)
      #about
      #space(h: 1.5em)
      #text(
        fill: rgb(200, 200, 200),
        [3#super[rd] year Computer Science student looking for a *May 2025*, 4 or 8-month position],
      )
    ],
  ),
)

#space(h: 0.3in)

#section(title: "Education")

*Honours Bachelor of Computer Science*, University of Ottawa, 9.64/10 CGPA
#h(1fr)
_September 2022 --- December 2026_

#section(title: "Technical Skills")
#text(
  size: 10pt,
  [
    *Languages/Libraries*: Rust, TypeScript, Go, Python, C++, C, Java, JavaScript,
    Svelte, Vue, React, SvelteKit, Express.js, Django, Flask, OpenAPI,
    Swagger, Protobuf, PyTorch

    *Tools*: PostgreSQL, MySQL, MongoDB, Redis, InfluxDB, TimescaleDB,
    Gerrit, Unity, Godot, Git, Ansible, AWS, GCP,
    OpenStack, Docker, Prometheus, Grafana, OpenTelemetry, Telegraf
  ],
)

#section(title: "Professional Experience")

#job(
  title: "Software Engineer",
  company: "Solace",
  location: "Ottawa, ON",
  start: datetime(year: 2025, month: 1, day: 6),
  achievements: (
    [Added rate-limiting to a customer-facing API with *Java* and *Spring Boot*.],
    [Performed benchmarking and profiling on a messaging system, reducing memory and CPU usage by 60%.],
    [Integrated OpenAPI tooling and an associated CI/CD pipeline, improving documentation by 15%.],
  ),
)

#job(
  title: "Software Engineer",
  company: "Ciena",
  location: "Ottawa, ON (Remote)",
  start: datetime(year: 2023, month: 5, day: 1),
  end: datetime(year: 2024, month: 12, day: 30),
  achievements: (
    [Created a code ownership and test management solution with *Express.js*, *MongoDB*, and *InfluxDB* (for logging) that improved workflow efficiency and test coverage by 80%, among other improvements.],
    [Released a full-stack computing resource booking platform with *Nuxt*, *PostgreSQL*, and *tRPC* that reduced order wait times by 99%+ (from days to minutes).],
    [Designed, implemented, and deployed a *Rust* microservice to categorize errors, improving MTTR by 30%.],
    [Migrated a legacy codebase to Python 3.9, fixing numerous bugs and reducing maintenance time by 50%.],
  ),
)

#job(
  title: "Freelance Software Developer",
  company: "IgNITE",
  location: "Remote",
  start: datetime(year: 2024, month: 10, day: 1),
  end: datetime(year: 2025, month: 1, day: 1),
  achievements: (
    [Developed a curriculum for a *Python* programming course for 100+ students aged 8-12.],
    [Instructed students in Python programming, improving their problem-solving skills and computational thinking.],
  ),
)

#section(title: "Projects")

#project(
  title: "3D Game Engine",
  github: "matteopolak/ira",
  tags: ("Rust", "WGSL", "wgpu", "TCP"),
  achievements: (
    [Developed a *3D game engine* with a custom rendering engine and pipeline in *Rust*.],
    [Integrated a physics engine to simulate realistic interactions between 100,000+ objects in real time.],
  ),
)

#project(
  title: "Recipe-sharing Platform",
  github: "matteopolak/crave",
  tags: ("Svelte", "TypeScript", "PostgreSQL", "tRPC", "Drizzle", "PyTorch"),
  achievements: (
    [Launched a *recipe-sharing* platform with 100+ users that creates personalized recommendations.],
    [Integrated a text embedding model with *PyTorch* and *Flask* to vectorize and rank 100,000 recipes.],
  ),
)

#project(
  title: "Image-to-ingredients AI",
  github: "matteopolak/grill",
  tags: ("PyTorch", "Data Cleaning", "Fine-tuning", "EfficientNet"),
  achievements: (
    [Trained a *PyTorch* model to predict ingredients from images with 90%+ accuracy.],
    [Cleaned and preprocessed a dataset of 1,000,000 images and 15,000 ingredients with *Pandas* (then *Polars*).],
    [Fine-tuned an *EfficientNet* model to achieve a 200% improvement in accuracy.],
  ),
)

#project(
  title: "Compiled Programming Language",
  github: "matteopolak/owl",
  tags: ("C++", "LLVM", "Bazel"),
  achievements: (
    [Integrated the compiler with *LLVM* to generate optimized machine code for various architectures.],
    [Implemented control flow structures, structs, arrays, pointers, functions, and a robust type system.],
  ),
)

#project(
  title: "Programming Language",
  github: "matteopolak/quasi",
  tags: ("Rust", "WebAssembly"),
  achievements: (
    [Developed a *programming language* with a custom lexer, parser, and interpreter in *Rust*.],
    [Compiled the language to *WebAssembly* and integrated it into an interactive web-based layout.],
    [Implemented clean error reporting and helpful diagnostics, improving developer experience significantly],
  ),
)

#project(
  title: "HTTP Client & Server",
  github: "matteopolak/basket",
  tags: ("Rust", "HTTP/1.1"),
  achievements: (
    [Created an *HTTP client* and *server* with a custom parser and serializer in *Rust*.],
    [Implemented JSON and XML serialization and deserialization, supporting 100,000+ requests per second.],
    [Optimized the developer experience with a clean layout and easy configuration options.],
  ),
)

#project(
  title: "Bitcoin Miner",
  github: "matteopolak/miner",
  tags: ("Rust", "SHA-256", "Proof of Work", "wgpu"),
  achievements: (
    [Developed a *Bitcoin miner* with a custom SHA-256 implementation in *Rust*.],
    [Implemented a proof-of-work algorithm to mine Bitcoin blocks with a hash rate of 1.5 MH/s.],
    [Optimized the mining process with a *GPU shader* and parallel processing, achieving a 30% speedup.],
  ),
)

#project(
  title: "Discord Jukebox",
  github: "matteopolak/jukebox",
  tags: (
    "TypeScript",
    "Discord.js",
    "YouTube API",
    "Spotify API",
    "Apple Music API",
  ),
  achievements: (
    [Created a *Discord bot* that plays music from YouTube, Spotify, and Apple Music in voice channels.],
    [Implemented a novel interface with buttons and dropdowns to control playback and audio filtering.],
    [Integrated YouTube and Spotify recommendations to suggest songs based on user preferences.],
  ),
)

#project(
  title: "Statistics Service",
  github: "statpixel-rs/statpixel",
  tags: ("Rust", "PostgreSQL", "Redis", "wgpu"),
  achievements: (
    [Developed a *statistics service* for Hypixel in *Rust*, used by 1,000+ players daily.],
    [Implemented a GPU rendering engine with *wgpu* to generate charts and 3D models of players in real time.],
    [Optimized the service with *Redis* as a cache layer, supporting 10,000+ requests per second.],
  ),
)

#project(
  title: "Collaborative Art Board",
  github: "matteopolak/noteboard",
  tags: ("Svelte", "WebSockets", "Canvas API"),
  achievements: (
    [Launched a *collaborative art board* with real-time drawing and chat functionality for 100+ users.],
    [Implemented a WebSocket server to synchronize drawing events between clients with sub-millisecond latency.],
    [Designed a user-friendly interface with *Svelte* and *TailwindCSS*, improving user engagement by 50%.],
  ),
)

#section(title: "Achievements")
- Open Source Contributor to #link("https://github.com/sveltejs/svelte", "Svelte"), #link("https://github.com/sveltejs/kit", "SvelteKit"), #link("https://github.com/lucia-auth/lucia", "Lucia"), #link("https://github.com/SoftbearStudios/bitcode", "Bitcode"), #link("https://github.com/plotters-rs/plotters", "Plotters"), #link("https://github.com/oven-sh/bun", "Bun")
- 2025 #link("https://dorahacks.io/hackathon/uottahack7", "uOttaHack 7") Hackathon, *1st*, 2024 #link("https://hack-the-hill-ii.devpost.com", "Hack the Hill II") Hackathon, *1st*
- 2023 #link("https://hack-the-hill.devpost.com", "Hack the Hill") Hackathon,
  *1st*, Best Developer Experience, Best Cybersecurity Project
- 2023 #link("https://all-in-hackathon.devpost.com", "MLH x {all in}") Hackathon, *1st*, 2023 #link("https://maphacks-2.devpost.com", "MapHacks 2") Hackathon,
  *1st*, Best Sustainable Travel Hack
