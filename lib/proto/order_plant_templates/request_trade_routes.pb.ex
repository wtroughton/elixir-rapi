defmodule Rti.RequestTradeRoutes do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          subscribe_for_updates: boolean
        }
  defstruct [:template_id, :user_msg, :subscribe_for_updates]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :subscribe_for_updates, 154_352, optional: true, type: :bool
end
