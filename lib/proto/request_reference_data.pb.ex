defmodule Rti.RequestReferenceData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          symbol: String.t(),
          exchange: String.t()
        }
  defstruct [:template_id, :user_msg, :symbol, :exchange]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :symbol, 110_100, optional: true, type: :string
  field :exchange, 110_101, optional: true, type: :string
end
