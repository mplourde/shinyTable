#' Render a Handsontable
#' 
#' Render a Handsontable in an application page.
#' @param outputId The ID of the \code{glOutput} associated with this element
#' @param clickId If not NULL, will expose a new input using the given name
#'   which provides a named list giving the row and column numbers of the 
#'   currently selected cell(s) in the table (1-indexed). Additionally, it will
#'   provice `r2` and `c2` variables to specify the "stop" row and columns,
#'   which may be relevant if a range of cells are selected. Or all will be NA 
#'   if no cell is selected.
#' @param readOnly If TRUE, client-side editing the table will be disabled. By 
#'   default, will be FALSE to enable editing.
#' @param headers Sets the way column headers should be displayed on the table.
#'   \code{enabled} implies that the default column names (progression through
#'   the alphabet) should be used. \code{disabled} implies that column headings
#'   should be disabled completely. \code{provided} implies that the column
#'   names should be extracted from the R object being displayed.
#' @param minRows The minimum number of rows to be included in the table.
#' @param minCols The minimum number of columns to be included in the table.
#' @param width The width of the table in pixels.
#' @param height The height of the table in pixels.
#' @author Jeff Allen \email{jeff@@trestletech.com}
#' @export
htable <- function(outputId, clickId = NULL, readOnly = FALSE,
                   headers=c("enabled", "disabled", "provided"), 
                   minRows=0, minCols=0, width=0, height=0){
  
  headers <- match.arg(headers)
  
  tagList(
    singleton(tags$head(
      initResourcePaths(),
      tags$script(src = 'shinyTable/shinyTable.js'),
      tags$script(src = 'shinyTable/jquery.handsontable.full.js'),
      tags$link(rel = 'stylesheet',
                type = 'text/css',
                href = 'shinyTable/jquery.handsontable.full.css')
    )),
    div(id=outputId, class="shiny-htable", 
        `data-htable-headers`=headers,
        `data-click-id`=clickId,
        `data-read-only`=readOnly,
        `data-min-rows`=minRows,
        `data-min-cols`=minCols,
        `data-width` = as.numeric(width),
        `data-height` = as.numeric(height))
  )
}