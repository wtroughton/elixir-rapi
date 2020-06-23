defmodule Rti.RequestGiveTickSizeTypeTable do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          tick_size_type: String.t()
        }
  defstruct [:template_id, :user_msg, :tick_size_type]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :tick_size_type, 154_167, optional: true, type: :string
end
