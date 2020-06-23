defmodule Rti.ResponseDepthByOrderSnapshot.TransactionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :BUY | :SELL

  field :BUY, 1
  field :SELL, 2
end

defmodule Rti.ResponseDepthByOrderSnapshot do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          rq_handler_rp_code: [String.t()],
          rp_code: [String.t()],
          exchange: String.t(),
          symbol: String.t(),
          sequence_number: non_neg_integer,
          depth_side: Rti.ResponseDepthByOrderSnapshot.TransactionType.t(),
          depth_price: float | :infinity | :negative_infinity | :nan,
          depth_size: [integer],
          depth_order_priority: [non_neg_integer],
          exchange_order_id: [String.t()]
        }
  defstruct [
    :template_id,
    :user_msg,
    :rq_handler_rp_code,
    :rp_code,
    :exchange,
    :symbol,
    :sequence_number,
    :depth_side,
    :depth_price,
    :depth_size,
    :depth_order_priority,
    :exchange_order_id
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :rq_handler_rp_code, 132_764, repeated: true, type: :string
  field :rp_code, 132_766, repeated: true, type: :string
  field :exchange, 110_101, optional: true, type: :string
  field :symbol, 110_100, optional: true, type: :string
  field :sequence_number, 112_002, optional: true, type: :uint64

  field :depth_side, 153_612,
    optional: true,
    type: Rti.ResponseDepthByOrderSnapshot.TransactionType,
    enum: true

  field :depth_price, 154_405, optional: true, type: :double
  field :depth_size, 154_406, repeated: true, type: :int32
  field :depth_order_priority, 153_613, repeated: true, type: :uint64
  field :exchange_order_id, 149_238, repeated: true, type: :string
end
