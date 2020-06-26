defmodule Rti.ResponseShowOrderHistoryDates do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          rq_handler_rp_code: [String.t()],
          rp_code: [String.t()],
          date: [String.t()]
        }
  defstruct [:template_id, :user_msg, :rq_handler_rp_code, :rp_code, :date]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :rq_handler_rp_code, 132_764, repeated: true, type: :string
  field :rp_code, 132_766, repeated: true, type: :string
  field :date, 110_615, repeated: true, type: :string
end
