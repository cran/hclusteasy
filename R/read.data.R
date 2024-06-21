#' Read Files in txt, xls, or xlsx Formats
#'
#' @description Read datasets files in `txt`(space-separated), `xls` or `xlsx`
#'   and return the data as a `data.frame`.
#'
#' @param path Path to the `txt`(space-separated), `xls` or `xlsx` file.
#'
#' @param col.names Logical value indicating whether the first row
#'   of the dataset should be used as column names. Use `TRUE` to use the first
#'   row as column names or `FALSE` otherwise. Default is `FALSE`.
#'
#' @param col.types Character or a character vector specifying the data types
#'   for each column. Possible values are: "skip" , "guess" , "logical" ,
#'   "numeric", "date" , "text" , or "list" .  Default, it is `NULL`, which
#'   means the data types will be determined automatically ("guess").  Note that `txt`
#'   files do not support the `col.types` parameter.
#'
#' @return Dataset in `data.frame` format.
#' @export
#'
#'
#' @examples
#' # Load the package
#' library(hclusteasy)
#'
#' # Set the file path
#' file_path <- system.file("extdata",
#'                           "iris_uci.xlsx",
#'                            package = "hclusteasy")
#'
#'
#' # Read a .xlsx dataset
#' iris <- read.data(file_path,col.names = TRUE)
#'
#' @importFrom readxl read_xls
#' @importFrom readxl read_xlsx
#' @importFrom utils read.table
read.data <- function(path, col.names = FALSE, col.types = NULL) {
  # Dataset format
  format <- tolower(tools::file_ext(path))

  # Read the dataset
  if (format == "xlsx") {
    data <- read_xlsx(path, col_names = col.names, col_types = col.types)
  }
  else if (format == "xls") {
    data <- read_xls(path, col_names = col.names, col_types = col.types)
  }
  else if (format == "txt") {
    if (!(is.null(col.types))) {
      warning("txt data format does not support editing column types.")
    }
    if (is.logical(col.names)) {
      data <- read.table(path, header = col.names, sep = " ")
    }
    else if (is.character(col.names)) {
      data <- read.table(path, col.names = col.names, sep = " ")
    }
  } else {
    stop(paste("Unsupported", format, "data format. Please use txt, xlsx, or xls format."), call. = FALSE)
  }

  data <- as.data.frame(data)

  return(data)
}
