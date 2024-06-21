#' Plot Principal Component Analysis Results
#'
#' @description Apply PCA (Principal Component Analysis) to the data and
#'   construct a scatter plot of the first two principal components.
#'
#' @param data Dataset in `data.frame` format.
#'
#' @param groups Groups to color observations and draw ellipses around each
#'   group of samples with a confidence level of 0.98. Default is "none".
#'
#' @return A `ggplot`.
#' @export
#'
#' @examples
#'
#' # Load the required package
#' library(hclusteasy)
#'
#'
#' # Read the 'iris' dataset from the package
#' data("iris_uci")
#'
#' # Select column "Species" (groups) in the iris dataset
#' species <- iris_uci[, 5]
#'
#' # Remove column "Species" in the iris dataset
#' iris <- iris_uci[, -5]
#'
#'
#' # Apply pca and ploting the two firsts components without groups
#' pca(iris)
#'
#' # Apply pca and ploting the first two components with groups
#' pca(iris, groups = species)
#'
#' @importFrom stats prcomp
#' @importFrom factoextra fviz_pca_ind
pca <- function(data, groups = "none") {
  # perform pca
  pca <- prcomp(data, scale. = FALSE)

  # Checks if exist groups for color the data samples and generate ellipses
  if (!("none" %in% groups)) {
    # Plot pca with color samples and ellipse by groups, ellipse level = 0.98
    p <- fviz_pca_ind(pca,
      habillage = groups, addEllipses = TRUE,
      ellipse.level = 0.98)
  }
  else {
    # Plot pca without groups
    p <- fviz_pca_ind(pca)
  }


  return(p)
}
