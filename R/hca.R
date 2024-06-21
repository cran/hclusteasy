#' Generate and Select Groups with Hierarchical Clustering
#'
#' @description Perform hierarchical clustering and generate groups based on
#'   sample dissimilarity using the Euclidean method.
#'
#' @param data Dataset in `data.frame` format.
#'
#' @param method Method of hierarchical clustering, considering: "ward.D", "ward.D2",
#'   "single", "complete", "average" (UPGMA), "mcquitty" (WPGMA),
#'   "median" (WPGMC) or "centroid" (UPGMC). Default is "complete".
#'
#' @param num.groups Number of groups to cut. Default is three.
#'
#' @return A vector of integers, where each element represents the group
#'   assigned to each observation in the original dataset.
#' @export
#'
#' @examples
#' # Load the required package
#' library(hclusteasy)
#'
#'
#' # Read the 'iris' dataset from the package
#' data("iris_uci")
#'
#' # Remove column 'Species' from the iris dataset
#' iris <- iris_uci[, -5]
#'
#'
#' # Apply hierarchical cluster and selecting groups
#' g <- hca(iris)
#'
#' @importFrom stats dist
#' @importFrom stats hclust
#' @importFrom stats cutree
hca <- function(data, method = "complete", num.groups = 3) {
  # Matriz dissimilarity
  d <- dist(x = data, method = "euclidean")

  # Hierarchical clustering
  hc <- hclust(d = d, method = method)

  # K groups
  g <- cutree(hc, k = num.groups)

  return(g)
}
