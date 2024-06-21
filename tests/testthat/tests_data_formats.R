test_that("tests reading txt data format", {
  # Read txt
  file_path <- test_path("data", "base1.txt")
  df <- read.data(file_path,
                  col.names = c(paste("col", 1:12, sep = ""))
  )


  expect_s3_class(df, "data.frame")
  expect_equal(ncol(df), 12)
  expect_equal(nrow(df), 130)
  expect_true(all(sapply(df, is.numeric)))
  expect_identical(df[3, 3], 0.4)
})


test_that("tests reading xlsx data format", {
  # Read xlsx
  file_path <- test_path("data", "base2.xlsx")
  df <- read.data(file_path,
                  col.names = c(paste("col", 1:12, sep = ""))
  )


  expect_s3_class(df, "data.frame")
  expect_equal(ncol(df), 12)
  expect_equal(nrow(df), 110)
  expect_true(all(sapply(df, is.numeric)))
  expect_identical(df[10, 2], 30.11)
})


test_that("tests reading xls data format", {
  # Read xls
  file_path <- test_path("data", "base3.xls")
  df <- read.data(file_path,
                  col.names = c(paste("col", 1:12, sep = ""))
  )


  expect_s3_class(df, "data.frame")
  expect_equal(ncol(df), 12)
  expect_equal(nrow(df), 100)
  expect_true(all(sapply(df, is.numeric)))
  expect_identical(df[5, 3], 18.86)
})


test_that("test reading csv data format", {
  # Read csv
  file_path <- test_path("data", "base4.csv")

  expect_error(
    read.data(file_path, col.names = c(paste("col", 1:12, sep = ""))),
    "Unsupported csv data format. Please use txt, xlsx, or xls format."
  )
})
