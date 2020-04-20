
generateSierpinski <- function(rows) {
  # generate the rows and return them
  mat = matrix(0, nrow = rows, ncol = 2)
  colnames(mat) = c("x", "y")

    for (i in seq_len(rows - 1)) {
    vertex = sampleVertex(3)
    point = mat[i, ]
    next.point = stepToVertex(point, vertex, 0.5)
    mat[i + 1, ] = next.point
  }
  mat
}

# Sample a Vertex of the n-Gon with base (0, 0) -> (1, 0)
# n: number of vertices (e.g. n=3: Triangle)
# Return a vector of length 2 with x and y coordinates
sampleVertex <- function(n) {
  c(x=1, y=1)
}

# Create a point that is a step from `from` to `to`
# step.size is a number between 0 and 1, indicating
#   the relative weight of `from` and `to`.
#   * step.size = 0 --> stay at `from`
#   * step.size = 1 --> end up at `to`
#   * step.size = 0.5 --> halfway between `from` and `to`
stepToVertex <- function(from, to, step.size) {
  from * (1 - step.size) + to * step.size
}