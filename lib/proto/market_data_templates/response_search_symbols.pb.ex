defmodule Rti.ResponseSearchSymbols do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          rq_handler_rp_code: [String.t()],
          rp_code: [String.t()],
          symbol: String.t(),
          exchange: String.t(),
          symbol_name: String.t(),
          product_code: String.t(),
          instrument_type: String.t(),
          expiration_date: String.t()
        }
  defstruct [
    :template_id,
    :user_msg,
    :rq_handler_rp_code,
    :rp_code,
    :symbol,
    :exchange,
    :symbol_name,
    :product_code,
    :instrument_type,
    :expiration_date
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :rq_handler_rp_code, 132_764, repeated: true, type: :string
  field :rp_code, 132_766, repeated: true, type: :string
  field :symbol, 110_100, optional: true, type: :string
  field :exchange, 110_101, optional: true, type: :string
  field :symbol_name, 100_003, optional: true, type: :string
  field :product_code, 100_749, optional: true, type: :string
  field :instrument_type, 110_116, optional: true, type: :string
  field :expiration_date, 100_067, optional: true, type: :string
end
