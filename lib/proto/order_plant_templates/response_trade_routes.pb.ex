defmodule Rti.ResponseTradeRoutes do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          rq_handler_rp_code: [String.t()],
          rp_code: [String.t()],
          fcm_id: String.t(),
          ib_id: String.t(),
          exchange: String.t(),
          trade_route: String.t(),
          status: String.t(),
          is_default: boolean
        }
  defstruct [
    :template_id,
    :user_msg,
    :rq_handler_rp_code,
    :rp_code,
    :fcm_id,
    :ib_id,
    :exchange,
    :trade_route,
    :status,
    :is_default
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :rq_handler_rp_code, 132_764, repeated: true, type: :string
  field :rp_code, 132_766, repeated: true, type: :string
  field :fcm_id, 154_013, optional: true, type: :string
  field :ib_id, 154_014, optional: true, type: :string
  field :exchange, 110_101, optional: true, type: :string
  field :trade_route, 112_016, optional: true, type: :string
  field :status, 131_407, optional: true, type: :string
  field :is_default, 154_689, optional: true, type: :bool
end
