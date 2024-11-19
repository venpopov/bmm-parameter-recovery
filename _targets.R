library(targets)
library(tarchetypes)
tar_option_set(
  packages = c("bmm", "dplyr", "purrr")
  # controller = crew::crew_controller_local(workers = 10)
)

# toy example
pars <- expand.grid(
  n = c(20, 50, 100, 200),
  kappa = seq(1, 16, 1),
  p_mem = seq(0.6, 1, 0.1)
)

transform_for_mixtur <- function(error) {
  data.frame(
    response = error,
    target = 0,
    id = 1
  )
}

recover_mixture2p <- function(n, kappa, p_mem) {
  suppressMessages(
    bmm::rmixture2p(n, kappa = kappa, p_mem = p_mem) |>
      transform_for_mixtur() |>
      mixtur::fit_mixtur(model = "2_component", unit = "radians") |>
      select(kappa, p_t) |>
      rename(kappa_est = kappa, p_mem_est = p_t) |>
      mutate(n = n, kappa = kappa, p_mem = p_mem)
  )
}

list(
  tar_map_rep(
    name = results,
    command = recover_mixture2p(n, kappa, p_mem),
    values = pars,
    batches = 10,
    reps = 3,
    names = colnames(pars)
  )
)
