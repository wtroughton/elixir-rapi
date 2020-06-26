defmodule Rti.ResponseProductRmsInfo.PresenceBits do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :BUY_LIMIT
          | :SELL_LIMIT
          | :LOSS_LIMIT
          | :MAX_ORDER_QUANTITY
          | :BUY_MARGIN_RATE
          | :SELL_MARGIN_RATE
          | :COMMISSION_FILL_RATE

  field :BUY_LIMIT, 1
  field :SELL_LIMIT, 2
  field :LOSS_LIMIT, 4
  field :MAX_ORDER_QUANTITY, 8
  field :BUY_MARGIN_RATE, 16
  field :SELL_MARGIN_RATE, 32
  field :COMMISSION_FILL_RATE, 64
end

defmodule Rti.ResponseProductRmsInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          rq_handler_rp_code: [String.t()],
          rp_code: [String.t()],
          presence_bits: non_neg_integer,
          fcm_id: String.t(),
          ib_id: String.t(),
          account_id: String.t(),
          product_code: String.t(),
          loss_limit: float | :infinity | :negative_infinity | :nan,
          commission_fill_rate: float | :infinity | :negative_infinity | :nan,
          buy_margin_rate: float | :infinity | :negative_infinity | :nan,
          sell_margin_rate: float | :infinity | :negative_infinity | :nan,
          buy_limit: integer,
          max_order_quantity: integer,
          sell_limit: integer
        }
  defstruct [
    :template_id,
    :user_msg,
    :rq_handler_rp_code,
    :rp_code,
    :presence_bits,
    :fcm_id,
    :ib_id,
    :account_id,
    :product_code,
    :loss_limit,
    :commission_fill_rate,
    :buy_margin_rate,
    :sell_margin_rate,
    :buy_limit,
    :max_order_quantity,
    :sell_limit
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :rq_handler_rp_code, 132_764, repeated: true, type: :string
  field :rp_code, 132_766, repeated: true, type: :string
  field :presence_bits, 153_622, optional: true, type: :uint32
  field :fcm_id, 154_013, optional: true, type: :string
  field :ib_id, 154_014, optional: true, type: :string
  field :account_id, 154_008, optional: true, type: :string
  field :product_code, 100_749, optional: true, type: :string
  field :loss_limit, 154_019, optional: true, type: :double
  field :commission_fill_rate, 156_969, optional: true, type: :double
  field :buy_margin_rate, 157_003, optional: true, type: :double
  field :sell_margin_rate, 157_004, optional: true, type: :double
  field :buy_limit, 154_009, optional: true, type: :int32
  field :max_order_quantity, 110_105, optional: true, type: :int32
  field :sell_limit, 154_035, optional: true, type: :int32
end
