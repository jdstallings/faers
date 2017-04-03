## JONATHAN D. STALLINGS CUSTOM FUNCTIONS ######################################
################################################################################

# FUNCTION TO TAKE LAST CHARACTER OF A STRING ##################################
substrRight <- function(x, n) {
  substr(x, nchar(x) - n + 1, nchar(x))
}
################################################################################
################################################################################


# FUNCTIONS TO NORMALIZE DATA ##################################################
center_scale <- function(x) {
  scale(x, scale = FALSE)
}

normalizer <- function(x) {
  (x-min(x))/(max(x)-min(x))
}

center_apply <- function(x) {
  apply(x, 2, function(y) y - mean(y))
}

center_mean <- function(x) {
  ones = rep(1, nrow(x))
  x_mean = ones %*% t(colMeans(x))
  x - x_mean
}

center_sweep <- function(x, row.w = rep(1, nrow(x))/nrow(x)) {
  get_average <- function(v) sum(v * row.w)/sum(row.w)
  average <- apply(x, 2, get_average)
  sweep(x, 2, average)
}

# fastest way
center_colmeans <- function(x) {
  xcenter = colMeans(x)
  x - rep(xcenter, rep.int(nrow(x), ncol(x)))
}

center_operator <- function(x) {
  n = nrow(x)
  ones = rep(1, n)
  H = diag(n) - (1/n) * (ones %*% t(ones))
  H %*% x
}
################################################################################
################################################################################


# GGPLOT PUBLICATION THEME #####################################################
theme_pub <- function (base_size = 12, base_family = "") {

  theme_grey(base_size = base_size, base_family = base_family) %+replace%

    theme(# Set text size
      plot.title = element_text(size = 18),
      axis.title.x = element_text(size = 16),
      axis.title.y = element_text(size = 16,
                                  angle = 90),

      axis.text.x = element_text(size = 14, angle = -45),
      axis.text.y = element_text(size = 14),

      strip.text.x = element_text(size = 15, angle = -90),
      strip.text.y = element_text(size = 15,
                                  angle = -90),

      # Legend text
      legend.title = element_text(size = 15),
      legend.text = element_text(size = 15),

      # Configure lines and axes
      axis.ticks.x = element_line(colour = "black"),
      axis.ticks.y = element_line(colour = "black"),

      # Plot background
      panel.background = element_rect(fill = "white"),
      panel.grid.major = element_line(colour = "grey83",
                                      size = 0.2),
      panel.grid.minor = element_line(colour = "grey88",
                                      size = 0.5),

      # Facet labels
      legend.key = element_rect(colour = "grey80"),
      strip.background = element_rect(fill = "grey80",
                                      colour = "grey50",
                                      size = 0.2))
}
################################################################################
################################################################################
