defmodule Rti.ResponseNewOrder do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          rq_handler_rp_code: [String.t()],
          rp_code: [String.t()],
          basket_id: String.t(),
          ssboe: integer,
          usecs: integer
        }
  defstruct [:template_id, :user_msg, :rq_handler_rp_code, :rp_code, :basket_id, :ssboe, :usecs]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :rq_handler_rp_code, 132_764, repeated: true, type: :string
  field :rp_code, 132_766, repeated: true, type: :string
  field :basket_id, 110_300, optional: true, type: :string
  field :ssboe, 150_100, optional: true, type: :int32
  field :usecs, 150_101, optional: true, type: :int32
end
