generate_mixture2p_data <- function(n, kappa, p_mem, formatted_for_mixtur = FALSE) {
  response <- bmm::rmixture2p(n, kappa = kappa, p_mem = p_mem)
  if (formatted_for_mixtur) {
    response <- data.frame(response = response, target = 0, id = 1)
  }
  response
}

fit_mixtur_quiet <- purrr::quietly(mixtur::fit_mixtur)

recover_mixture2p <- function(n, kappa, p_mem) {
    generate_mixture2p_data(n, kappa, p_mem, formatted_for_mixtur = TRUE) |>
      fit_mixtur_quiet(model = "2_component", unit = "radians") |>
      purrr::pluck("result") |>
      dplyr::select(kappa, p_t) |>
      dplyr::rename(kappa_est = kappa, p_mem_est = p_t) |>
      dplyr::mutate(n = n, kappa = kappa, p_mem = p_mem)
}
