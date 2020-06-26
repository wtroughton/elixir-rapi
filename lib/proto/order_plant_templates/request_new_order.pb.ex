defmodule Rti.RequestNewOrder.TransactionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :BUY | :SELL

  field :BUY, 1
  field :SELL, 2
end

defmodule Rti.RequestNewOrder.OrderPlacement do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :MANUAL | :AUTO

  field :MANUAL, 1
  field :AUTO, 2
end

defmodule Rti.RequestNewOrder.Duration do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :DAY | :GTC | :IOC | :FOK

  field :DAY, 1
  field :GTC, 2
  field :IOC, 3
  field :FOK, 4
end

defmodule Rti.RequestNewOrder.PriceType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :LIMIT
          | :MARKET
          | :STOP_LIMIT
          | :STOP_MARKET
          | :MARKET_IF_TOUCHED
          | :LIMIT_IF_TOUCHED

  field :LIMIT, 1
  field :MARKET, 2
  field :STOP_LIMIT, 3
  field :STOP_MARKET, 4
  field :MARKET_IF_TOUCHED, 5
  field :LIMIT_IF_TOUCHED, 6
end

defmodule Rti.RequestNewOrder.PriceField do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :BID_PRICE | :OFFER_PRICE | :TRADE_PRICE | :LEAN_PRICE

  field :BID_PRICE, 1
  field :OFFER_PRICE, 2
  field :TRADE_PRICE, 3
  field :LEAN_PRICE, 4
end

defmodule Rti.RequestNewOrder.Condition do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :EQUAL_TO
          | :NOT_EQUAL_TO
          | :GREATER_THAN
          | :GREATER_THAN_EQUAL_TO
          | :LESSER_THAN
          | :LESSER_THAN_EQUAL_TO

  field :EQUAL_TO, 1
  field :NOT_EQUAL_TO, 2
  field :GREATER_THAN, 3
  field :GREATER_THAN_EQUAL_TO, 4
  field :LESSER_THAN, 5
  field :LESSER_THAN_EQUAL_TO, 6
end

defmodule Rti.RequestNewOrder do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          fcm_id: String.t(),
          ib_id: String.t(),
          account_id: String.t(),
          symbol: String.t(),
          exchange: String.t(),
          quantity: integer,
          price: float | :infinity | :negative_infinity | :nan,
          trigger_price: float | :infinity | :negative_infinity | :nan,
          transaction_type: Rti.RequestNewOrder.TransactionType.t(),
          duration: Rti.RequestNewOrder.Duration.t(),
          price_type: Rti.RequestNewOrder.PriceType.t(),
          trade_route: String.t(),
          manual_or_auto: Rti.RequestNewOrder.OrderPlacement.t(),
          if_touched_symbol: String.t(),
          if_touched_exchange: String.t(),
          if_touched_condition: Rti.RequestNewOrder.Condition.t(),
          if_touched_price_field: Rti.RequestNewOrder.PriceField.t(),
          if_touched_price: float | :infinity | :negative_infinity | :nan
        }
  defstruct [
    :template_id,
    :user_msg,
    :fcm_id,
    :ib_id,
    :account_id,
    :symbol,
    :exchange,
    :quantity,
    :price,
    :trigger_price,
    :transaction_type,
    :duration,
    :price_type,
    :trade_route,
    :manual_or_auto,
    :if_touched_symbol,
    :if_touched_exchange,
    :if_touched_condition,
    :if_touched_price_field,
    :if_touched_price
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :fcm_id, 154_013, optional: true, type: :string
  field :ib_id, 154_014, optional: true, type: :string
  field :account_id, 154_008, optional: true, type: :string
  field :symbol, 110_100, optional: true, type: :string
  field :exchange, 110_101, optional: true, type: :string
  field :quantity, 112_004, optional: true, type: :int32
  field :price, 110_306, optional: true, type: :double
  field :trigger_price, 149_247, optional: true, type: :double

  field :transaction_type, 112_003,
    optional: true,
    type: Rti.RequestNewOrder.TransactionType,
    enum: true

  field :duration, 112_005, optional: true, type: Rti.RequestNewOrder.Duration, enum: true
  field :price_type, 112_008, optional: true, type: Rti.RequestNewOrder.PriceType, enum: true
  field :trade_route, 112_016, optional: true, type: :string

  field :manual_or_auto, 154_710,
    optional: true,
    type: Rti.RequestNewOrder.OrderPlacement,
    enum: true

  field :if_touched_symbol, 154_451, optional: true, type: :string
  field :if_touched_exchange, 154_452, optional: true, type: :string

  field :if_touched_condition, 154_453,
    optional: true,
    type: Rti.RequestNewOrder.Condition,
    enum: true

  field :if_touched_price_field, 154_454,
    optional: true,
    type: Rti.RequestNewOrder.PriceField,
    enum: true

  field :if_touched_price, 153_632, optional: true, type: :double
end
