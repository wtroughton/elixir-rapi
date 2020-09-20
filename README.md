# R API+

Rithmic provides software libraries for developers to get real-time market data and execute
trades through their trade execution platform. R API+ is a set of Rithmic APIs generated 
from protobuf spec.

See the Reference Guide for details on the API.

## Installation

The package can be installed by adding `rapi` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:rapi, git: "https://github.com/wtroughton/rapi.git"}
  ]
end
```

