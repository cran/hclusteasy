test_that("tests applying the functions using data in txt format", {
  # Read
  df <- read.data(test_path("data", "base1.txt"),
    col.names = c(paste("col", 1:12, sep = ""))
  )


  expect_s3_class(df, "data.frame")
  expect_equal(ncol(df), 12)
  expect_equal(nrow(df), 130)
  expect_true(all(sapply(df, is.numeric)))
  expect_identical(df[2, 4], 0.4)


  # Normalization
  dfN <- normalization(df, type = "n1", norm = "column")


  expect_equal(dfN[2, 2], -1.3033302)
  expect_identical(dfN[4, 4], (df[4, 4] - mean(df[, 4])) / sd(df[, 4]))


  # Generate groups
  g <- hca(dfN, method = "complete", num.groups = 3)


  expect_type(g, "integer")
  expect_identical(length(g), nrow(df))


  # Plot pca
  plot <- pca(dfN, groups = g)


  expect_s3_class(plot, "ggplot")
  expect_identical(plot$labels$x, "Dim1 (23.8%)")
  expect_identical(plot$labels$y, "Dim2 (16.8%)")
})
