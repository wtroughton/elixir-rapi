defmodule Rti.ExchangeOrderNotification.NotifyType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :STATUS
          | :MODIFY
          | :CANCEL
          | :TRIGGER
          | :FILL
          | :REJECT
          | :NOT_MODIFIED
          | :NOT_CANCELLED
          | :GENERIC

  field :STATUS, 1
  field :MODIFY, 2
  field :CANCEL, 3
  field :TRIGGER, 4
  field :FILL, 5
  field :REJECT, 6
  field :NOT_MODIFIED, 7
  field :NOT_CANCELLED, 8
  field :GENERIC, 9
end

defmodule Rti.ExchangeOrderNotification.TransactionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :BUY | :SELL

  field :BUY, 1
  field :SELL, 2
end

defmodule Rti.ExchangeOrderNotification.Duration do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :DAY | :GTC | :IOC | :FOK

  field :DAY, 1
  field :GTC, 2
  field :IOC, 3
  field :FOK, 4
end

defmodule Rti.ExchangeOrderNotification.PriceType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :LIMIT | :MARKET | :STOP_LIMIT | :STOP_MARKET

  field :LIMIT, 1
  field :MARKET, 2
  field :STOP_LIMIT, 3
  field :STOP_MARKET, 4
end

defmodule Rti.ExchangeOrderNotification.OrderPlacement do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :MANUAL | :AUTO

  field :MANUAL, 1
  field :AUTO, 2
end

defmodule Rti.ExchangeOrderNotification do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          notify_type: Rti.ExchangeOrderNotification.NotifyType.t(),
          is_snapshot: boolean,
          report_type: String.t(),
          status: String.t(),
          basket_id: String.t(),
          original_basket_id: String.t(),
          fcm_id: String.t(),
          ib_id: String.t(),
          user_id: String.t(),
          account_id: String.t(),
          symbol: String.t(),
          exchange: String.t(),
          trade_exchange: String.t(),
          trade_route: String.t(),
          exchange_order_id: String.t(),
          instrument_type: String.t(),
          quantity: integer,
          price: float | :infinity | :negative_infinity | :nan,
          trigger_price: float | :infinity | :negative_infinity | :nan,
          transaction_type: Rti.ExchangeOrderNotification.TransactionType.t(),
          duration: Rti.ExchangeOrderNotification.Duration.t(),
          price_type: Rti.ExchangeOrderNotification.PriceType.t(),
          orig_price_type: Rti.ExchangeOrderNotification.PriceType.t(),
          manual_or_auto: Rti.ExchangeOrderNotification.OrderPlacement.t(),
          confirmed_size: integer,
          confirmed_time: String.t(),
          confirmed_date: String.t(),
          confirmed_id: String.t(),
          modified_size: integer,
          modified_time: String.t(),
          modified_date: String.t(),
          modify_id: String.t(),
          cancelled_size: integer,
          cancelled_time: String.t(),
          cancelled_date: String.t(),
          cancelled_id: String.t(),
          fill_price: float | :infinity | :negative_infinity | :nan,
          fill_size: integer,
          fill_time: String.t(),
          fill_date: String.t(),
          fill_id: String.t(),
          trigger_id: String.t(),
          sequence_number: String.t(),
          orig_sequence_number: String.t(),
          cor_sequence_number: String.t(),
          currency: String.t(),
          country_code: String.t(),
          text: String.t(),
          report_text: String.t(),
          remarks: String.t(),
          ssboe: integer,
          usecs: integer,
          exch_receipt_ssboe: integer,
          exch_receipt_nsecs: integer
        }
  defstruct [
    :template_id,
    :notify_type,
    :is_snapshot,
    :report_type,
    :status,
    :basket_id,
    :original_basket_id,
    :fcm_id,
    :ib_id,
    :user_id,
    :account_id,
    :symbol,
    :exchange,
    :trade_exchange,
    :trade_route,
    :exchange_order_id,
    :instrument_type,
    :quantity,
    :price,
    :trigger_price,
    :transaction_type,
    :duration,
    :price_type,
    :orig_price_type,
    :manual_or_auto,
    :confirmed_size,
    :confirmed_time,
    :confirmed_date,
    :confirmed_id,
    :modified_size,
    :modified_time,
    :modified_date,
    :modify_id,
    :cancelled_size,
    :cancelled_time,
    :cancelled_date,
    :cancelled_id,
    :fill_price,
    :fill_size,
    :fill_time,
    :fill_date,
    :fill_id,
    :trigger_id,
    :sequence_number,
    :orig_sequence_number,
    :cor_sequence_number,
    :currency,
    :country_code,
    :text,
    :report_text,
    :remarks,
    :ssboe,
    :usecs,
    :exch_receipt_ssboe,
    :exch_receipt_nsecs
  ]

  field :template_id, 154_467, required: true, type: :int32

  field :notify_type, 153_625,
    optional: true,
    type: Rti.ExchangeOrderNotification.NotifyType,
    enum: true

  field :is_snapshot, 110_121, optional: true, type: :bool
  field :report_type, 120_001, optional: true, type: :string
  field :status, 110_303, optional: true, type: :string
  field :basket_id, 110_300, optional: true, type: :string
  field :original_basket_id, 154_497, optional: true, type: :string
  field :fcm_id, 154_013, optional: true, type: :string
  field :ib_id, 154_014, optional: true, type: :string
  field :user_id, 131_003, optional: true, type: :string
  field :account_id, 154_008, optional: true, type: :string
  field :symbol, 110_100, optional: true, type: :string
  field :exchange, 110_101, optional: true, type: :string
  field :trade_exchange, 112_021, optional: true, type: :string
  field :trade_route, 112_016, optional: true, type: :string
  field :exchange_order_id, 149_238, optional: true, type: :string
  field :instrument_type, 110_116, optional: true, type: :string
  field :quantity, 112_004, optional: true, type: :int32
  field :price, 110_306, optional: true, type: :double
  field :trigger_price, 149_247, optional: true, type: :double

  field :transaction_type, 112_003,
    optional: true,
    type: Rti.ExchangeOrderNotification.TransactionType,
    enum: true

  field :duration, 112_005,
    optional: true,
    type: Rti.ExchangeOrderNotification.Duration,
    enum: true

  field :price_type, 112_008,
    optional: true,
    type: Rti.ExchangeOrderNotification.PriceType,
    enum: true

  field :orig_price_type, 154_770,
    optional: true,
    type: Rti.ExchangeOrderNotification.PriceType,
    enum: true

  field :manual_or_auto, 154_710,
    optional: true,
    type: Rti.ExchangeOrderNotification.OrderPlacement,
    enum: true

  field :confirmed_size, 110_329, optional: true, type: :int32
  field :confirmed_time, 110_326, optional: true, type: :string
  field :confirmed_date, 110_327, optional: true, type: :string
  field :confirmed_id, 110_330, optional: true, type: :string
  field :modified_size, 149_267, optional: true, type: :int32
  field :modified_time, 149_268, optional: true, type: :string
  field :modified_date, 149_269, optional: true, type: :string
  field :modify_id, 149_244, optional: true, type: :string
  field :cancelled_size, 110_318, optional: true, type: :int32
  field :cancelled_time, 110_319, optional: true, type: :string
  field :cancelled_date, 110_320, optional: true, type: :string
  field :cancelled_id, 110_321, optional: true, type: :string
  field :fill_price, 110_307, optional: true, type: :double
  field :fill_size, 110_308, optional: true, type: :int32
  field :fill_time, 110_309, optional: true, type: :string
  field :fill_date, 110_310, optional: true, type: :string
  field :fill_id, 110_311, optional: true, type: :string
  field :trigger_id, 149_266, optional: true, type: :string
  field :sequence_number, 112_002, optional: true, type: :string
  field :orig_sequence_number, 149_263, optional: true, type: :string
  field :cor_sequence_number, 149_264, optional: true, type: :string
  field :currency, 154_382, optional: true, type: :string
  field :country_code, 154_172, optional: true, type: :string
  field :text, 120_008, optional: true, type: :string
  field :report_text, 120_028, optional: true, type: :string
  field :remarks, 154_806, optional: true, type: :string
  field :ssboe, 150_100, optional: true, type: :int32
  field :usecs, 150_101, optional: true, type: :int32
  field :exch_receipt_ssboe, 150_405, optional: true, type: :int32
  field :exch_receipt_nsecs, 150_406, optional: true, type: :int32
end
