defmodule Rti.RithmicOrderNotification.NotifyType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :ORDER_RCVD_FROM_CLNT
          | :MODIFY_RCVD_FROM_CLNT
          | :CANCEL_RCVD_FROM_CLNT
          | :OPEN_PENDING
          | :MODIFY_PENDING
          | :CANCEL_PENDING
          | :ORDER_RCVD_BY_EXCH_GTWY
          | :MODIFY_RCVD_BY_EXCH_GTWY
          | :CANCEL_RCVD_BY_EXCH_GTWY
          | :ORDER_SENT_TO_EXCH
          | :MODIFY_SENT_TO_EXCH
          | :CANCEL_SENT_TO_EXCH
          | :OPEN
          | :MODIFIED
          | :COMPLETE
          | :MODIFICATION_FAILED
          | :CANCELLATION_FAILED
          | :TRIGGER_PENDING
          | :GENERIC
          | :LINK_ORDERS_FAILED

  field :ORDER_RCVD_FROM_CLNT, 1
  field :MODIFY_RCVD_FROM_CLNT, 2
  field :CANCEL_RCVD_FROM_CLNT, 3
  field :OPEN_PENDING, 4
  field :MODIFY_PENDING, 5
  field :CANCEL_PENDING, 6
  field :ORDER_RCVD_BY_EXCH_GTWY, 7
  field :MODIFY_RCVD_BY_EXCH_GTWY, 8
  field :CANCEL_RCVD_BY_EXCH_GTWY, 9
  field :ORDER_SENT_TO_EXCH, 10
  field :MODIFY_SENT_TO_EXCH, 11
  field :CANCEL_SENT_TO_EXCH, 12
  field :OPEN, 13
  field :MODIFIED, 14
  field :COMPLETE, 15
  field :MODIFICATION_FAILED, 16
  field :CANCELLATION_FAILED, 17
  field :TRIGGER_PENDING, 18
  field :GENERIC, 19
  field :LINK_ORDERS_FAILED, 20
end

defmodule Rti.RithmicOrderNotification.TransactionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :BUY | :SELL

  field :BUY, 1
  field :SELL, 2
end

defmodule Rti.RithmicOrderNotification.Duration do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :DAY | :GTC | :IOC | :FOK

  field :DAY, 1
  field :GTC, 2
  field :IOC, 3
  field :FOK, 4
end

defmodule Rti.RithmicOrderNotification.PriceType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :LIMIT | :MARKET | :STOP_LIMIT | :STOP_MARKET

  field :LIMIT, 1
  field :MARKET, 2
  field :STOP_LIMIT, 3
  field :STOP_MARKET, 4
end

defmodule Rti.RithmicOrderNotification.OrderPlacement do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :MANUAL | :AUTO

  field :MANUAL, 1
  field :AUTO, 2
end

defmodule Rti.RithmicOrderNotification do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          notify_type: Rti.RithmicOrderNotification.NotifyType.t(),
          is_snapshot: boolean,
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
          transaction_type: Rti.RithmicOrderNotification.TransactionType.t(),
          duration: Rti.RithmicOrderNotification.Duration.t(),
          price_type: Rti.RithmicOrderNotification.PriceType.t(),
          orig_price_type: Rti.RithmicOrderNotification.PriceType.t(),
          manual_or_auto: Rti.RithmicOrderNotification.OrderPlacement.t(),
          sequence_number: String.t(),
          orig_sequence_number: String.t(),
          cor_sequence_number: String.t(),
          currency: String.t(),
          country_code: String.t(),
          text: String.t(),
          report_text: String.t(),
          remarks: String.t(),
          ssboe: integer,
          usecs: integer
        }
  defstruct [
    :template_id,
    :notify_type,
    :is_snapshot,
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
    :sequence_number,
    :orig_sequence_number,
    :cor_sequence_number,
    :currency,
    :country_code,
    :text,
    :report_text,
    :remarks,
    :ssboe,
    :usecs
  ]

  field :template_id, 154_467, required: true, type: :int32

  field :notify_type, 153_625,
    optional: true,
    type: Rti.RithmicOrderNotification.NotifyType,
    enum: true

  field :is_snapshot, 110_121, optional: true, type: :bool
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
    type: Rti.RithmicOrderNotification.TransactionType,
    enum: true

  field :duration, 112_005,
    optional: true,
    type: Rti.RithmicOrderNotification.Duration,
    enum: true

  field :price_type, 112_008,
    optional: true,
    type: Rti.RithmicOrderNotification.PriceType,
    enum: true

  field :orig_price_type, 154_770,
    optional: true,
    type: Rti.RithmicOrderNotification.PriceType,
    enum: true

  field :manual_or_auto, 154_710,
    optional: true,
    type: Rti.RithmicOrderNotification.OrderPlacement,
    enum: true

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
end
