defmodule Rti.BaseTemplate do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer
        }
  defstruct [:template_id]

  field :template_id, 154_467, required: true, type: :int32
end
