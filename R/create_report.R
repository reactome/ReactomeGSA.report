#' create_pdf_report
#'
#' Creates a PDF report of a ReactomeGSA result. This function
#' currently only supports GSA-based analysis results.
#'
#' @param result ReactomeAnalysisResult. The result to create the report for.
#' @param pdf_filename character. Path where the PDF file will be written to. This file
#'        will be overwritten if it exists
#'
#' @export
#'
#' @examples
#' library(ReactomeGSA.report)
#' library(ReactomeGSA.data)
#' data(griss_melanoma_result)
#'
#' pdf_file_path <- tempfile(pattern = "reactome_report_", tmpdir = tempdir(), fileext = ".pdf")
#'
#' # create the PDF report at the specified location (simply a temporary file in this example)
#' create_pdf_report(result = griss_melanoma_result, pdf_filename = pdf_file_path)
create_pdf_report <- function(result, pdf_filename) {
  markdown_file <- system.file("gsa_report.rmd", package = "ReactomeGSA.report")
  rmarkdown::render(markdown_file, output_file = pdf_filename, params = list(result = result))
}
