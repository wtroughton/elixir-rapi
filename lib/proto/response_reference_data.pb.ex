defmodule Rti.ResponseReferenceData.PresenceBits do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :EXCHANGE_SYMBOL
          | :SYMBOL_NAME
          | :PRODUCT_CODE
          | :INSTRUMENT_TYPE
          | :UNDERLYING_SYMBOL
          | :EXPIRATION_DATE
          | :CURRENCY
          | :PUT_CALL_INDICATOR
          | :STRIKE_PRICE
          | :FPRICE_TO_QPRICE
          | :QPRICE_TO_FPRICE
          | :MIN_QPRICE_CHANGE
          | :MIN_FRPICE_CHANGE
          | :SINGLE_POINT_VALUE
          | :TICK_SIZE_TYPE
          | :PRICE_DISPLAY_FORMAT
          | :IS_TRADABLE
          | :TRADING_SYMBOL
          | :TRADING_EXCHANGE

  field :EXCHANGE_SYMBOL, 1
  field :SYMBOL_NAME, 2
  field :PRODUCT_CODE, 4
  field :INSTRUMENT_TYPE, 8
  field :UNDERLYING_SYMBOL, 16
  field :EXPIRATION_DATE, 32
  field :CURRENCY, 64
  field :PUT_CALL_INDICATOR, 128
  field :STRIKE_PRICE, 256
  field :FPRICE_TO_QPRICE, 512
  field :QPRICE_TO_FPRICE, 1024
  field :MIN_QPRICE_CHANGE, 2048
  field :MIN_FRPICE_CHANGE, 4096
  field :SINGLE_POINT_VALUE, 8192
  field :TICK_SIZE_TYPE, 16384
  field :PRICE_DISPLAY_FORMAT, 32768
  field :IS_TRADABLE, 65536
  field :TRADING_SYMBOL, 131_072
  field :TRADING_EXCHANGE, 262_144
end

defmodule Rti.ResponseReferenceData do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          rp_code: [String.t()],
          presence_bits: non_neg_integer,
          clear_bits: non_neg_integer,
          symbol: String.t(),
          exchange: String.t(),
          exchange_symbol: String.t(),
          symbol_name: String.t(),
          trading_symbol: String.t(),
          trading_exchange: String.t(),
          product_code: String.t(),
          instrument_type: String.t(),
          underlying_symbol: String.t(),
          expiration_date: String.t(),
          currency: String.t(),
          put_call_indicator: String.t(),
          tick_size_type: String.t(),
          price_display_format: String.t(),
          is_tradable: String.t(),
          strike_price: float | :infinity | :negative_infinity | :nan,
          ftoq_price: float | :infinity | :negative_infinity | :nan,
          qtof_price: float | :infinity | :negative_infinity | :nan,
          min_qprice_change: float | :infinity | :negative_infinity | :nan,
          min_fprice_change: float | :infinity | :negative_infinity | :nan,
          single_point_value: float | :infinity | :negative_infinity | :nan
        }
  defstruct [
    :template_id,
    :user_msg,
    :rp_code,
    :presence_bits,
    :clear_bits,
    :symbol,
    :exchange,
    :exchange_symbol,
    :symbol_name,
    :trading_symbol,
    :trading_exchange,
    :product_code,
    :instrument_type,
    :underlying_symbol,
    :expiration_date,
    :currency,
    :put_call_indicator,
    :tick_size_type,
    :price_display_format,
    :is_tradable,
    :strike_price,
    :ftoq_price,
    :qtof_price,
    :min_qprice_change,
    :min_fprice_change,
    :single_point_value
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :rp_code, 132_766, repeated: true, type: :string
  field :presence_bits, 149_138, optional: true, type: :uint32
  field :clear_bits, 154_571, optional: true, type: :uint32
  field :symbol, 110_100, optional: true, type: :string
  field :exchange, 110_101, optional: true, type: :string
  field :exchange_symbol, 110_114, optional: true, type: :string
  field :symbol_name, 100_003, optional: true, type: :string
  field :trading_symbol, 157_095, optional: true, type: :string
  field :trading_exchange, 157_096, optional: true, type: :string
  field :product_code, 100_749, optional: true, type: :string
  field :instrument_type, 110_116, optional: true, type: :string
  field :underlying_symbol, 101_026, optional: true, type: :string
  field :expiration_date, 100_067, optional: true, type: :string
  field :currency, 154_382, optional: true, type: :string
  field :put_call_indicator, 100_109, optional: true, type: :string
  field :tick_size_type, 154_167, optional: true, type: :string
  field :price_display_format, 154_390, optional: true, type: :string
  field :is_tradable, 154_844, optional: true, type: :string
  field :strike_price, 100_066, optional: true, type: :double
  field :ftoq_price, 154_384, optional: true, type: :double
  field :qtof_price, 154_385, optional: true, type: :double
  field :min_qprice_change, 154_386, optional: true, type: :double
  field :min_fprice_change, 154_387, optional: true, type: :double
  field :single_point_value, 154_389, optional: true, type: :double
end
