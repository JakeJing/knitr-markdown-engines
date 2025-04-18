has_pygments = function() {
  exit_status = system2("pygmentize", "-V", stdout = FALSE)
  if (exit_status != 0)
    stop("Pygments 'pygmentize' not found - have you installed Pygments?")
  invisible(invisible(TRUE))
}

#' Set up commands for highlighting Stan in LaTeX.
make_header = function() {
  has_pygments()
  style = stanhl_opts$get("style")
  # Define Shaded

  cat(c("\\definecolor{shadecolor}{RGB}{248,248,248}",
        "\\ifcsmacro{Shaded}{}{\\newenvironment{Shaded}%",
        "{\\begin{snugshade}}{\\end{snugshade}}}"),
      sep = "\n",
      file = "highlight.tex")
  # Add highlight commands
  cat(system2("pygmentize",
              args = c("-S", style, "-f", "latex"),
              stdout = TRUE),
      sep = "\n",
      file = "highlight.tex",
      append = TRUE)
}
add_stan_hook = function() {
  hook_output = knitr::knit_hooks$get("source")
  knitr::knit_hooks$set(source = function(x, options) {
    if (options$engine == "stan") {
      # Apply syntax highlighting
      hlighted = stanhl(x)
      # Wrap in shaded enviornment
      paste("\\begin{Shaded}",
            hlighted,
            "\\end{Shaded}",
            sep = "\n")
    } else {
      hook_output(x, options)
    }
  })
}
stanhl_init = function() {
  has_pygments()
  make_header()
  add_stan_hook()
  knitr::raw_latex("\\input{highlight.tex}")
}
stanhl = function(x) {
  has_pygments()
  paste(system2("pygmentize",
                args = c("-f", "latex", "-l", "stan"),
                input = x,
                stdout = TRUE),
        collapse = "\n")
}
