---
enable-adv-math-packages: true # true or false. true to allow you to use align, theorem, and proof environment of latex.

# insert-other-preamble:
# - \usepackage{marginnote}

titlepage:
  align-center: # true for center, false for left
  title: Demo Article
  subtitle: Single Title Page
  version: Second Edition
  authors:
  - name: Wei-Chun Tsai
    info: Taiwan No. 1 Company
  - name: Bae Liu
    info: Taiwan No. 2 Company
  date: \today
  publisher:
    fig:
      file: cambridge.png
      width: 4.5cm # vaild values are 3cm, 4cm, 12pt, 14pt, ...etc.
    name:
    info: Taipei, Tokyo, New York

headers: # sections after titlepage but before toc
- heading: >
    *In memory of my brother, John Nash*
  heading-align-center: true # true for center, false for left
  margin-top: 1cm # valid values are 0.5cm, 1cm, 2cm, 1pt, 2pt, ...etc
  content:
  - subheading: Risk is our business.
    subheading-align-center: true # true for center, false for left
    description: >
      *You would have enjoyed it.*
    description-align-center: true # true for center, false for left
  - subheading: Are you ready?
    subheading-align-center: true
    description: >
      *Let's go!*
    description-align-center: true

fontsize: 10pt # 10pt, 11pt, or 12pt 

papersize: # a4paper, letterpaper, a5paper, b5paper, executivepaper, or legalpaper.

margin:
  left: # 1.4cm, 1.5cm, etc.
  top: # 0.8cm, 0.9cm, etc.
  right: # 1.4cm, 1.5cm, etc.
  bottom: # 1.8cm, 1.9cm, etc.
  footskip: # 0.5cm, 0.6cm, etc.

footer:
  enable: true # true or false
  disable-line: # true or false
  line-width: # 1pt, 2pt, etc.
  use-roman-page-before-toc: # true or false
  left:
  center:
  right:

disable-dots-in-toc-lot-lof: # true or false

toc:
  enable: true # true or false
  tocdepth: 3 # 0, 1, 2, 3, 4, or 5

lot: true # list of tables, true to show, false to hide

lof: true # list of figures, true to show, false to hide

bibliography:
  enable: true
  title: Bibliography
  items:
  - label: latexcompanion
    content: >
      Michel Goossens, Frank Mittelbach, and Alexander Samarin.
      *The \LaTeX Companion*.
      Addison-Wesley, Reading, Massachusetts, 1993.
  - label: einstein
    content: >
      Albert Einstein.
      *Zur Elektrodynamik bewegter Körper*. (German)
      \[*On the electrodynamics of moving bodies*\].
      Annalen der Physik, 322(10): 891–921, 1905.
  - label: knuthwebsite
    content: >
      Knuth: Computers and Typesetting, \newline
      `http://www-cs-faculty.stanford.edu/~uno/abcde.html`
...
