# knitr-markdown-engines

This repository illustrates the basic usages of Rmarkdown and Knitr with different engines (R, Bash, Python, Stan, C++ and Julia), and compile them into pdfs. Two templates(**Rmarkdown-template.rmd**, **Knitr-template.R**) are added in this repository.

**Note:**
1. It is hightly suggested to use Rmarkdown format to write the code;

**Todo:**
1. Though rmarkdown supports different languages, the **variables cannot be inherited across different engines**, except for certain functions in c++ and stan. 
2. It seems that **Knitr** does not support inline running with other languages, such as C++ or Python, you need to compile the whole file. 
3. The *Stan* code in rmarkdown is not colored, probably due to the output.var.
