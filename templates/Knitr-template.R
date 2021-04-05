#' ---
#' title: "Knitr Template"
#' author: "Yingqi Jing"
#' date: "`r format(Sys.time(), '%B %e, %Y')`"
#' header-includes:
#' - \usepackage{textcomp}
#' - \renewcommand{\thefigure}{S\arabic{figure}}
#' - \renewcommand{\thetable}{S\arabic{table}}
#' - \renewcommand{\thesection}{S\arabic{section}}
#' - \renewcommand{\thesubsection}{S\arabic{section}.\arabic{subsection}}
#' - \usepackage{tocloft}
#' - \settowidth{\cftsecnumwidth}{S10x}
#' output:
#'  pdf_document:
#'   fig_crop: true
#'   fig_caption: true
#'   latex_engine: xelatex
#'   toc: true
#'   toc_depth: 4
#'   number_section: true
#'   pandoc_args: ["--variable=lof","--variable=lot","--bibliography=/Users/jakejing/switchdrive/bib/references.bib", "--csl=/Users/jakejing/switchdrive/bib/unified-style-linguistics.csl"]
#' ---
#+ setup, include=F
library(knitr)
library(ggplot2)
library(dplyr)
library(magrittr)
knit_hooks$set(crop = hook_pdfcrop, pars = function(before, options, envir) {if(before) {par(family=my.font)} else NULL}) # trick for keeping par across chunks; define my.font below!
opts_chunk$set(fig.path='figures/',
               dev = 'cairo_pdf', dev.args=list(bg='transparent'), # or quartz_pdf (for lattice)
               fig.height = 5,
               fig.width = 6,
               engine.path = list(python = '/usr/local/bin/python3'),
               python.reticulate = FALSE,
               message = F,
               warning = F,
               autodep=T,
               cache.comments=F,
               crop=T,
               comment=NA,
               pars=T
)

# graphics setup:
my.font = 'Helvetica'
# ggplot
theme_set(theme_bw(base_size = 24) +
            theme(text = element_text(family = my.font),
                  plot.background = element_rect(fill = "transparent", colour = NA)))

options(width=180)

#' \clearpage
#'
#' Introduction
#' =======
#'
print("Hello R Knitr!")
#'
#' Data and Methods
#' ========
#'
#'
#' Results
#' ========
#'
#'
#' Discussion
#' =======
#'
#'
#' Conclusions
#' =======
#'
#'
#' References
#' ==========
