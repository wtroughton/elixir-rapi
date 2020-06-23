# Used by "mix format"

excludes =
  Enum.flat_map(
    [
      # Exclude generated protobuf files
      "lib/**/*.pb.{ex}"
    ],
    &Path.wildcard(&1, match_dot: true)
  )

[
  inputs:
    Enum.flat_map(
      [
        "{mix,.formatter}.exs",
        "{config,lib,test}/**/*.{ex,exs}"
      ],
      &Path.wildcard(&1, match_dot: true)
    ) -- excludes
]
