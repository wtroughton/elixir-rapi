defmodule Rti.RequestHeartbeat do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          ssboe: integer,
          usecs: integer
        }
  defstruct [:template_id, :user_msg, :ssboe, :usecs]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :ssboe, 150_100, optional: true, type: :int32
  field :usecs, 150_101, optional: true, type: :int32
end
