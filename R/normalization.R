#' Apply Normalization Techniques to the Dataset
#'
#' @description Perform data normalization.
#'
#' @param data Dataset in `data.frame` format.
#'
#' @param type Type of normalization. Default is "n1".
#'   - n0: without normalization
#'   - n1: standardization ((x-mean)/sd)
#'   - n2: positional standardization ((x-median)/mad)
#'   - n3: unitization ((x-mean)/range)
#'   - n3a: positional unitization ((x-median)/range)
#'   - n4: unitization with zero minimum ((x-min)/range)
#'   - n5: normalization in range <-1,1> ((x-mean)/max(abs(x-mean)))
#'   - n5a: positional normalization in range <-1,1> ((x-median)/max(abs(x-median)))
#'   - n6: quotient transformation (x/sd)
#'   - n6a: positional quotient transformation (x/mad)
#'   - n7: quotient transformation (x/range)
#'   - n8: quotient transformation (x/max)
#'   - n9: quotient transformation (x/mean)
#'   - n9a: positional quotient transformation (x/median)
#'   - n10: quotient transformation (x/sum)
#'   - n11: quotient transformation (x/sqrt(SSQ))
#'   - n12: normalization ((x-mean)/sqrt(sum((x-mean)^2)))
#'   - n12a: positional normalization ((x-median)/sqrt(sum((x-median)^2)))
#'   - n13: normalization with zero being the central point ((x-midrange)/(range/2))
#'
#' @param norm Defines whether the normalization will be done by "column" or
#'   by "row". Default is "column".
#'
#' @param na.remove A `logical` value indicating whether NA values should be
#'   excluded before performing normalization calculations. Default is FALSE.
#'
#' @return Normalized dataset in `data.frame` foramt.
#' @export
#'
#' @examples
#' # Load the required package
#' library(hclusteasy)
#'
#'
#' # Read the dataset 'iris' from the package
#' data("iris_uci")
#'
#' # Remove the column 'Species' from the iris dataset
#' iris <- iris_uci[, -5]
#'
#'
#' # Apply normalization to the iris dataset
#' irisN <- normalization(iris, type = "n1")
#'
#' @importFrom clusterSim data.Normalization
normalization <- function(data, type = "n0", norm = "column", na.remove = FALSE) {
  # Mormalization
  data <- data.Normalization(data, type = type, normalization = norm, na.rm = na.remove)

  data <- as.data.frame(data)

  return(data)
}
