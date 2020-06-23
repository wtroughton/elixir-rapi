defmodule Rti.LastTrade.PresenceBits do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :LAST_TRADE | :NET_CHANGE | :PRECENT_CHANGE | :VOLUME | :VWAP

  field :LAST_TRADE, 1
  field :NET_CHANGE, 2
  field :PRECENT_CHANGE, 4
  field :VOLUME, 8
  field :VWAP, 16
end

defmodule Rti.LastTrade.TransactionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :BUY | :SELL

  field :BUY, 1
  field :SELL, 2
end

defmodule Rti.LastTrade do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          symbol: String.t(),
          exchange: String.t(),
          presence_bits: non_neg_integer,
          clear_bits: non_neg_integer,
          is_snapshot: boolean,
          trade_price: float | :infinity | :negative_infinity | :nan,
          trade_size: integer,
          aggressor: Rti.LastTrade.TransactionType.t(),
          exchange_order_id: String.t(),
          aggressor_exchange_order_id: String.t(),
          net_change: float | :infinity | :negative_infinity | :nan,
          percent_change: float | :infinity | :negative_infinity | :nan,
          volume: non_neg_integer,
          vwap: float | :infinity | :negative_infinity | :nan,
          ssboe: integer,
          usecs: integer,
          source_ssboe: integer,
          source_usecs: integer,
          source_nsecs: integer,
          jop_ssboe: integer,
          jop_nsecs: integer
        }
  defstruct [
    :template_id,
    :symbol,
    :exchange,
    :presence_bits,
    :clear_bits,
    :is_snapshot,
    :trade_price,
    :trade_size,
    :aggressor,
    :exchange_order_id,
    :aggressor_exchange_order_id,
    :net_change,
    :percent_change,
    :volume,
    :vwap,
    :ssboe,
    :usecs,
    :source_ssboe,
    :source_usecs,
    :source_nsecs,
    :jop_ssboe,
    :jop_nsecs
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :symbol, 110_100, optional: true, type: :string
  field :exchange, 110_101, optional: true, type: :string
  field :presence_bits, 149_138, optional: true, type: :uint32
  field :clear_bits, 154_571, optional: true, type: :uint32
  field :is_snapshot, 110_121, optional: true, type: :bool
  field :trade_price, 100_006, optional: true, type: :double
  field :trade_size, 100_178, optional: true, type: :int32
  field :aggressor, 112_003, optional: true, type: Rti.LastTrade.TransactionType, enum: true
  field :exchange_order_id, 149_238, optional: true, type: :string
  field :aggressor_exchange_order_id, 154_641, optional: true, type: :string
  field :net_change, 100_011, optional: true, type: :double
  field :percent_change, 100_056, optional: true, type: :double
  field :volume, 100_032, optional: true, type: :uint64
  field :vwap, 101_379, optional: true, type: :double
  field :ssboe, 150_100, optional: true, type: :int32
  field :usecs, 150_101, optional: true, type: :int32
  field :source_ssboe, 150_400, optional: true, type: :int32
  field :source_usecs, 150_401, optional: true, type: :int32
  field :source_nsecs, 150_404, optional: true, type: :int32
  field :jop_ssboe, 150_600, optional: true, type: :int32
  field :jop_nsecs, 150_604, optional: true, type: :int32
end
