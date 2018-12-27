---
enable-adv-math-packages: true # true or false. true to allow you to use align, theorem, and proof environment of latex.

# insert-other-preamble:
# - \usepackage{marginnote}

#titlepage:
#  align-center: # true for center, false for left
#  title: Demo Article
#  subtitle: Single Title Page
#  version: Second Edition
#  authors:
#  - name: Wei-Chun Tsai
#    info: Taiwan No. 1 Company
#  - name: Bae Liu
#    info: Taiwan No. 2 Company
#  date: \today
#  publisher:
#    fig:
#      file: cambridge.png
#      width: 4.5cm # vaild values are 3cm, 4cm, 12pt, 14pt, ...etc.
#    name:
#    info: Taipei, Tokyo, New York
#
#headers: # sections after titlepage but before toc
#- heading: >
#    *In memory of my brother, John Nash*
#  heading-align-center: true # true for center, false for left
#  margin-top: 1cm # valid values are 0.5cm, 1cm, 2cm, 1pt, 2pt, ...etc
#  content:
#  - subheading: Risk is our business.
#    subheading-align-center: true # true for center, false for left
#    description: >
#      *You would have enjoyed it.*
#    description-align-center: true # true for center, false for left
#  - subheading: Are you ready?
#    subheading-align-center: true
#    description: >
#      *Let's go!*
#    description-align-center: true

titlearea:
  align-left: # true for left, false for center
  title: Demo Article
  authors:
  - name: Wei-Chun Tsai
    org-ids: 1, 2
  - name: Bae Liu
    org-ids: 2, 3
  orgs:
    - name: Taiwan No. 1 Company
      id: 1
    - name: Taiwan No. 2 Company
      id: 2
    - name: Taiwan No. 3 Company
      id: 3
  date: \today

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
  enable: false # true or false
  tocdepth: 3 # 0, 1, 2, 3, 4, or 5

lot: false # list of tables, true to show, false to hide

lof: false # list of figures, true to show, false to hide

bibliography:
  enable: true
  title: References
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

# Basic Usage

Here we would like to show you some basic structures
including paragraphs, links, lists, verbatims (usually for code blocks),
tables, figures, footnotes, index, and bibliography.
If you want to force to make a newline, you can add an empty line or use the command `\newline`.
If you want to force to start a whole new page, you can use the command `\clearpage` before your new content.

## Paragraph \label{start-paragraph}

The following is a paragraph.

Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Duis ullamcorper neque sit amet lectus facilisis sed luctus nisl iaculis.

If you use a `\label{start-paragraph}` in the section/chapter title, then you could use a

`\ref{start-paragraph}` to refer to this section/chapter.
For example, please refer to \ref{start-paragraph}.

## Link

Here is a link => [A link to Google](https://www.google.com)

## List

The following is a list.

* The 1st main item
    - A sub item 1 of the 1st main item
    - A sub item 2 of the 1st main item
* The 2nd main item
    - A sub item 1 of the 2nd main item
    - A sub item 2 of the 2nd main item
* The 3rd main item
    - A sub item 1 of the 3rd main item
    - A sub item 2 of the 3rd main item

## Verbatim

The following is a verbatim which is usually to show a code block (use `python` as an example).

```
print 'Hello World!'

for i in [ 'Hello', 'World!' ]:
  print i

if True:
  print 'Hello World!'
else:
  print 'Stay at home.'
```

\clearpage

## Table

### Standard Markdown Table
A standard markdown table supports single line only in each column and its width can not be modified.
This table can also be rendered well on common markdown platforms (ex: [GitHub](https://github.com/)).

 Right | Left | Default | Center 
------:|:-----|---------|:------:
   12  |  12  |    12   |    12  
  123  |  123 |   123   |   123  
    1  |    1 |     1   |     1  

Table: A Standard Markdown Table \label{sm-table}

If you use a `\label{sm-table}` in the table caption, then you could use a

`\ref{sm-table}` to refer to this table.
For example, please refer to Table. \ref{sm-table}.

### Extended Markdown Table
An extended markdown table supports multiple lines in each column.
This table can **not** be rendered well on common markdown platforms (ex: [GitHub](https://github.com/)).

----------------------------
 Centered  Default     Right
  Header   Aligned   Aligned
---------- -------- --------
   First   row,         12.0
           long
           content

  Second   row           5.0 
----------------------------

Table: An Extended Markdown Table \label{em-table}

If you use a `\label{em-table}` in the table caption, then you could use a

`\ref{em-table}` to refer to this table.
For example, please refer to Table. \ref{em-table}.

### How to Make an Extended Markdown Table Wider?
For an extended markdown table, you can also modify its width by adding more hyphens "\-".

--------------------------------------------------------------------
 Centered            Default                                   Right
  Header             Aligned                                 Aligned
-------------------- ------------------------------- ---------------
   First             row,                                       12.0
                     long content,
                     long content,
                     long content,
                     long content,
                     long content,
                     long content,
                     long content,
                     long content,
                     long content,
                     long content

  Second             row                                         5.0
--------------------------------------------------------------------

Table: A Wider Extended Markdown Table \label{wem-table}

If you use a `\label{wem-table}` in the table caption, then you could use a

`\ref{wem-table}` to refer to this table.
For example, please refer to Table. \ref{wem-table}.

\clearpage

## Figure

The following is a figure.

![Normal Distribution \label{fig:normal-distribution}](./normal-distribution.png)

If you use a `\label{fig:normal-distribution}` in the figure caption, then you could use a

`\ref{fig:normal-distribution}` to refer to this figure.
For example, please refer to Fig. \ref{fig:normal-distribution}.

## Footnote

In a paragraph, sometimes you need to make a further (but short) explanation for some keywords.
You could use footnotes to do this. The following are 2 footnotes examples.

The normal distribution is found by Carl Friedrich Gauss[^gauss].

The student's t distribution is found by William Sealy Gosset[^gosset].

[^gauss]: Carl Friedrich Gauss (30 April 1777 – 23 February 1855) was a German mathematician and physicist.

[^gosset]: William Sealy Gosset (13 June 1876 – 16 October 1937) was an English statistician.

## Assign index for keyworkds

You can assign index for keyworks by using `Keywords\index{Keywords}`.
The following are 2 examples.

The normal distribution is found by Carl Friedrich Gauss\index{Carl Friedrich Gauss}.

The student's t distribution is found by William Sealy Gosset\index{William Sealy Gosset}.

You can go to "Index" part in the last page to check if indexes are generated.

## Cite from bibliography/references

You have to define bibliography in the `yaml` header of the `md` first and then you can use `\cite` to refer to it.
The following is a paragraph with 3 items cited.

This paragraph is an example of **`thebibliography`** environment using
in bibliography management. Three items are cited: *The \LaTeX Companion*
book \cite{latexcompanion}, the Einstein journal paper \cite{einstein}, and the
Donald Knuth's website \cite{knuthwebsite}. The \LaTeX related items are
\cite{latexcompanion,knuthwebsite}.

\clearpage

# Math Equations

The following are 2 examples for equations.

## Normal distribution
The normal distribution is a continuous probability distribution with probability density function (pdf) defined as

\begin{equation}\label{eqn:normal-distribution}
f(x ; \mu, \sigma^{2}) = \frac{1}{\sqrt{2\pi\sigma^{2}}}e^{-\frac{\displaystyle (x - \mu)^{2}}{\displaystyle 2\sigma^{2}}}, \quad -\infty < x < \infty
\end{equation}
where

* $\mu$ is the mean or expectation of the distribution.
* $\sigma$ is the standard deviation of the distribution.
* $\sigma^{2}$ is the variance of the distribution.

If you use a `\label{eqn:normal-distribution}` in this equation, then you could use a

`\ref{eqn:normal-distribution}` to refer to this equation.
For example, please refer to Eq. \ref{eqn:normal-distribution}.

## $t$-distribution

The $t$-distribution is a continuous probability distribution with probability density function defined as
\begin{equation}\label{eqn:student-t}
f(x ; \nu) = \frac{\Gamma(\frac{\nu+1}{2})}{\sqrt{\nu\pi}\Gamma(\frac{\nu}{2})}
\left( 1 + \frac{x^{2}}{\nu} \right)^{\displaystyle -\frac{\nu+1}{\displaystyle 2}}
, \quad -\infty < x < \infty
\end{equation}
where

* $\nu$ is the degrees of freedom and is a positive integer.
* $\Gamma$ is the gamma function.

If you use a `\label{eqn:student-t}` in this equation, then you could use a

`\ref{eqn:student-t}` to refer to this equation.
For example, please refer to Eq. \ref{eqn:student-t}.

# Advance Math for Align, Theorems and Proofs

Examples in this section/chapter needs
the following option turned on in the `yaml` header of `md`
```
---
enable-adv-math-packages: true
.
.
.
...
```

## Multi-line equation which aligns to the equal sign
\begin{align}
dP &= \frac{e^{-Q/2}}{(2\pi)^{k/2}}\frac{2\pi^{k/2}}{\Gamma(\frac{k}{2})}Q^{(k-1)/2}\frac{dQ}{2Q^{1/2}} \nonumber \\
   &= \frac{1}{2^{k/2}\Gamma(k/2)}Q^{k/2 - 1}e^{-Q/2}dQ \label{align:multi-line-eq-2nd} \\
   &= f(Q)dQ \label{align:multi-line-eq-3rd}
\end{align}
You can refer to one of its formula after the equal sign like this => Eq. \ref{align:multi-line-eq-2nd}

## Theorem
\begin{theorem}\label{thm:X-2-chi}
If a random variable $Y = X^{2}$ where $X \sim N(0,1)$,
then $Y  \sim \chi^{2}_{1}$.
\end{theorem}
You can refer to this theorem like this => Theorem \ref{thm:X-2-chi}

## Proof
\begin{proof}\label{prf:X-2-chi}
Let $P(Y)$ be the cumulative distribution function of the random variable $Y$, then \\
for $y < 0$, $P(Y < y) = 0$ (since $Y = X^{2} \geq 0$ for all X) \\
for $y > 0$:
\begin{align}
P(Y < y) &= P(X^{2} < y) = P(|X| < \sqrt{y}) = P(-\sqrt{y} < X < \sqrt{y} \nonumber \\
         &= F_{x}(\sqrt{y}) - F_{x}(-\sqrt{y}) = F_{x}(\sqrt{y}) - (1 - F_{x}(\sqrt{y})) \nonumber \\
         & = 2F_{x}(\sqrt{y}) - 1 \nonumber \\
f_{Y}(y) &= 2\frac{d}{dy}F_{x}(\sqrt{y}) - 0 = 2\frac{d}{dy}(\int^{\sqrt{y}}_{-\infty}\frac{1}{\sqrt{2\pi}}e^{\frac{-t^{2}}{2}}dt) \nonumber \\
         &= 2\frac{1}{\sqrt{2\pi}}e^{-\frac{y}{2}}\frac{d}{dy}(\sqrt{y}) = 2\frac{1}{\sqrt{2}\sqrt{\pi}}e^{-\frac{y}{2}}(\frac{1}{2}y^{-\frac{1}{2}}) \nonumber \\
         &= \frac{1}{2^{\frac{1}{2}}\Gamma(\frac{1}{2})}y^{-\frac{1}{2}}e^{-\frac{y}{2}} \label{align:chi1-final}
\end{align}
where $F$ and $f$ are the cdf and pdf of the corresponding random variables. \\
Eq. \ref{align:chi1-final} is just the pdf of $\chi^{2}_{1}$-distribution, then we have proved that $Y  \sim \chi^{2}_{1}$.
\end{proof}
You can refer to this proof like this => Proof \ref{prf:X-2-chi}

