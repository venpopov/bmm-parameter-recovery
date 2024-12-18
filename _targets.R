library(targets)
library(tarchetypes)
library(crew)
tar_source()

tar_option_set(
  packages = c("bmm", "dplyr", "purrr"),
  controller = crew_controller_local(workers = 10)
)

get_parameter_grid <- function() {
  expand.grid(
    n = c(20, 50, 100),
    kappa = seq(1, 16, 2),
    p_mem = seq(0.1, 1, 0.3)
  )
}

list(
  tar_target(parameter_grid, get_parameter_grid()),
  tar_map_rep(
    name = resultsmixturer2p_grid_results,
    command = recover_mixture2p(n, kappa, p_mem),
    values = get_parameter_grid(),
    batches = 10,
    reps = 5,
    names = tidyselect::everything()
  )
)

# list(
#   tar_group_count(
#     name = generating_parameters,
#     count = 10,
#     command = get_parameter_grid()
#   ),
#   tar_target(
#     estimated_parameters,
#     purrr::pmap(generating_parameters, recover_mixture2p),
#     pattern = map(generating_parameters)
#   )
# )
# 
# purrr::map_dfr(seq_len(10), ~ get_parameter_grid())
