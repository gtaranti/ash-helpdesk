# Used by "mix format"
[
  plugins: [Spark.Formatter],
  import_deps: [:ash],
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"]
]
