## 2023-11-21
## F2: create nested directories, recursively but liniar
## Takes just one string (that can come from file.path() or paste0)

#' Create nested liniar directories
#'
#' @description
#' create nested liniar subdirectories
#' no depth limination
#' builds ontop of an absolute path
#' TO DO: test for relative paths
#'
#' @param l.dirs_rel_to_wd A list with names of new directories.
#'
#' @return creates directories and subdirectories; prints either that the directory was created or that it exists
#'
#' @examples
#' pr_path <- "~/Documents/.../project-dev-fischer-spatial/"
#' step_dir <- "results/results_Rhamm/02_integrated-clustering/"
#' fh2.create_dir(paste0(pr_path,step_dir) )

fh2.create_dir <- function(l.dirs_rel_to_wd) {
    for (i in l.dirs_rel_to_wd) {
        if (!dir.exists(i)) {
            dir.create(file.path(i), recursive = TRUE)
            print(paste0("**created ", i, " directory"))
        } else {
            print(paste0("**", i, " directory already exists."))
        }
     }
}
#-------------------------------------------

## 2024-03-18
## F4: create directories recursively
## similar to F2, and builds ontop of F2
## but can make nested branched directories
## Creates the names as strings, then creates the directories
## Takes as many strings and lists as you need
## All elements of lists or strings need to end in '/'
## If you don't want that, then change the comment status on "final_strings" line

#' Create nested branched directories
#'
#' @description
#' create nested branched subdirectories
#' no depth limination
#' builds ontop of an absolute path
#' TO DO: test for relative paths
#' all elements of lists or strings need to end in '/'
#' else change the comment status on "final_strings" line
#'
#' @param abs_path An absolute path (so far).
#' @param ... Elipse = add as many separate lists or strings as you need. Each list/ string denotes one level down.
#'
#' @return creates directories and subdirectories; prints either that the directory was created or that it exists
#'
#' @examples
#' pr_path <- "~/Documents/.../project-dev-fischer-spatial/"
#' step_dir <- "results/results_Rhamm/02_integrated-clustering/"
#' necessary_dirs <- c("integrated_objects/","plots_integrated_harmony/","plots_integrated_rpca/")
#' fh4.create_subdirs(pr_path, step_dir, strftime(Sys.Date(),"%F"), necessary_dirs)

fh4.create_subdirs <- function(abs_path, ...){
  f_arg <- c(as.list(environment()), list(...) )
  #g_arg <- as.list(environment() ) - takes only the nr of args in this function
  if (length(f_arg) >= 2) {
    final_strings <- do.call(paste0, expand.grid(f_arg))
    #final_strings <- apply(expand.grid(f_arg), 1, paste, collapse='/')
    fh2.create_dir(final_strings)
    return(final_strings)
  } else {
    print("this function needs at least 2 parameters")
  }
}
#-------------------------------------------


