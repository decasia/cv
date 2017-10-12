# CV in YAML

## Author

Eli Thorkelson, [decasia.org](http://decasia.org/)

Oct. 10, 2017.

## What for?

The purpose of this project is to save me from having to maintain multiple copies of my CV, by keeping all the data in one structured format. This structured source of data can then be used to generate other human-readable representations, as needed.

It has the nice bonus of also preventing non-standard formatting of the many lists.

## Installation

Git clone, and then invoke the Ruby scripts under `code/`.

## Data storage

I contemplated using a single-file database like SQLite, but there seemed to be no real reason not to use [YAML](http://www.yaml.org/start.html), which is very portable, very human readable, and easy to put in version control. 

All the data lives in `data/`.

## Web format

I always provide a copy of my CV on my website:

[http://decasia.org/cv.html](http://decasia.org/cv.html)

The Ruby script at `code/web.rb` will spit out standardly-formatted HTML content that I automatically include in that webpage.

## PDF format

The next stage of the project is to autogenerate PDFs that look nice and match the format of the HTML representation.

### PDF processing requirements

- xelatex
- kramdown
- FontAwesome (obscure LaTeX requirement)

### Problems with intermediate formats

- HTML to Tex conversion destroys table formatting if there are `<p>` tags within cells
- Table formatting in Kramdown's extended Markdown doesn't support linebreaks within cells
- If you make an ERB template to generate Tex, it has no tools by default to translate Markdown data to Tex markup
- 

## Additional features

- Flags to hide work in progress from the public CV (e.g. if you want to disclose to your institution your articles under review, but not the public).
- Context-sensitive front matter (say if you want to present your CV slightly differently for different audiences, you could store the front matter separately and have it auto-inserted when you produce a PDF).
- Can embed Markdown for richer formatting in the YAML data.
- If you maintain this over time, Git will give you a nice version of your academic history.

## Nuisances, Disclaimers, Todos
 
- You have to quote YAML string values that contain colons, which means most article titles.
- Not intended as production-ready code for general use.
- There are already about 25 other YAML CV projects on GitHub (largely in python) and they are all more general open source projects. This is just a couple of quick scripts that do exactly what I happen to want.
- Imperfect separation of data and structure in `code/templates/web.haml`.

## Can I use this?

You may want to get in touch if you want to use this project for yourself, as the current state of the repository (deliberately) mixes my personal data together with the code. The code is not specific to me and I'm happy to make it available open source if there is interest. But you would need to be comfortable with unix-like command line tools (i.e., Linux/OSX) to get anything out of this.
