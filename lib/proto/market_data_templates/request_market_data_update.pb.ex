defmodule Rti.RequestMarketDataUpdate.UpdateBits do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :LAST_TRADE
          | :BBO
          | :ORDER_BOOK
          | :OPEN
          | :OPENING_INDICATOR
          | :HIGH_LOW
          | :HIGH_BID_LOW_ASK
          | :CLOSE
          | :CLOSING_INDICATOR
          | :SETTLEMENT
          | :MARKET_MODE
          | :OPEN_INTEREST
          | :MARGIN_RATE
          | :HIGH_PRICE_LIMIT
          | :LOW_PRICE_LIMIT
          | :PROJECTED_SETTLEMENT

  field :LAST_TRADE, 1
  field :BBO, 2
  field :ORDER_BOOK, 4
  field :OPEN, 8
  field :OPENING_INDICATOR, 16
  field :HIGH_LOW, 32
  field :HIGH_BID_LOW_ASK, 64
  field :CLOSE, 128
  field :CLOSING_INDICATOR, 256
  field :SETTLEMENT, 512
  field :MARKET_MODE, 1024
  field :OPEN_INTEREST, 2048
  field :MARGIN_RATE, 4096
  field :HIGH_PRICE_LIMIT, 8192
  field :LOW_PRICE_LIMIT, 16384
  field :PROJECTED_SETTLEMENT, 32768
end

defmodule Rti.RequestMarketDataUpdate.Request do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :SUBSCRIBE | :UNSUBSCRIBE

  field :SUBSCRIBE, 1
  field :UNSUBSCRIBE, 2
end

defmodule Rti.RequestMarketDataUpdate do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          symbol: String.t(),
          exchange: String.t(),
          request: Rti.RequestMarketDataUpdate.Request.t(),
          update_bits: non_neg_integer
        }
  defstruct [:template_id, :user_msg, :symbol, :exchange, :request, :update_bits]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :symbol, 110_100, optional: true, type: :string
  field :exchange, 110_101, optional: true, type: :string
  field :request, 100_000, optional: true, type: Rti.RequestMarketDataUpdate.Request, enum: true
  field :update_bits, 154_211, optional: true, type: :uint32
end
