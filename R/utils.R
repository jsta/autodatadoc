tabular <- function(df, ...) {
  stopifnot(is.data.frame(df))

  align <- function(x) if (is.numeric(x)) "r" else "l"
  col_align <- vapply(df, align, character(1))

  cols <- lapply(df, format, ...)
  contents <- do.call("paste",
                      c(cols, list(sep = " \\tab ", collapse = "\\cr\n  ")))
  col_names <- paste0("\\bold{",
                      do.call("paste",
                              c(names(df), list(sep = "} \\tab \\bold{", collapse = "\\cr\n  "))),
                      "} \\cr")

  paste("\\tabular{", paste(col_align, collapse = ""), "}{\n",
        col_names,
        "\n",
        contents, "\n}\n", sep = "")
}

#' @importFrom utils read.csv
get_table_metadata <- function(path){
  dt <- read.csv(path, stringsAsFactors = FALSE)
  paste0(readLines(textConnection(tabular(dt))))
}

