defmodule Rti.OrderBook.PresenceBits do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :BID | :ASK

  field :BID, 1
  field :ASK, 2
end

defmodule Rti.OrderBook.UpdateType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :CLEAR_ORDER_BOOK
          | :NO_BOOK
          | :SNAPSHOT_IMAGE
          | :BEGIN
          | :MIDDLE
          | :END
          | :SOLO

  field :CLEAR_ORDER_BOOK, 1
  field :NO_BOOK, 2
  field :SNAPSHOT_IMAGE, 3
  field :BEGIN, 4
  field :MIDDLE, 5
  field :END, 6
  field :SOLO, 7
end

defmodule Rti.OrderBook do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          symbol: String.t(),
          exchange: String.t(),
          presence_bits: non_neg_integer,
          update_type: Rti.OrderBook.UpdateType.t(),
          bid_price: [float | :infinity | :negative_infinity | :nan],
          bid_size: [integer],
          bid_orders: [integer],
          impl_bid_size: [integer],
          ask_price: [float | :infinity | :negative_infinity | :nan],
          ask_size: [integer],
          ask_orders: [integer],
          impl_ask_size: [integer],
          ssboe: integer,
          usecs: integer
        }
  defstruct [
    :template_id,
    :symbol,
    :exchange,
    :presence_bits,
    :update_type,
    :bid_price,
    :bid_size,
    :bid_orders,
    :impl_bid_size,
    :ask_price,
    :ask_size,
    :ask_orders,
    :impl_ask_size,
    :ssboe,
    :usecs
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :symbol, 110_100, optional: true, type: :string
  field :exchange, 110_101, optional: true, type: :string
  field :presence_bits, 149_138, optional: true, type: :uint32
  field :update_type, 157_608, optional: true, type: Rti.OrderBook.UpdateType, enum: true
  field :bid_price, 154_282, repeated: true, type: :double
  field :bid_size, 154_283, repeated: true, type: :int32
  field :bid_orders, 154_401, repeated: true, type: :int32
  field :impl_bid_size, 154_412, repeated: true, type: :int32
  field :ask_price, 154_284, repeated: true, type: :double
  field :ask_size, 154_285, repeated: true, type: :int32
  field :ask_orders, 154_402, repeated: true, type: :int32
  field :impl_ask_size, 154_415, repeated: true, type: :int32
  field :ssboe, 150_100, optional: true, type: :int32
  field :usecs, 150_101, optional: true, type: :int32
end
