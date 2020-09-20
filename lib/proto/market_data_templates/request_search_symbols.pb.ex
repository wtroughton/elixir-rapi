defmodule Rti.RequestSearchSymbols.Pattern do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :EQUALS | :CONTAINS

  field :EQUALS, 1
  field :CONTAINS, 2
end

defmodule Rti.RequestSearchSymbols.InstrumentType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :FUTURE
          | :FUTURE_OPTION
          | :FUTURE_STRATEGY
          | :EQUITY
          | :EQUITY_OPTION
          | :EQUITY_STRATEGY
          | :INDEX
          | :INDEX_OPTION
          | :SPREAD
          | :SYNTHETIC

  field :FUTURE, 1
  field :FUTURE_OPTION, 2
  field :FUTURE_STRATEGY, 3
  field :EQUITY, 4
  field :EQUITY_OPTION, 5
  field :EQUITY_STRATEGY, 6
  field :INDEX, 7
  field :INDEX_OPTION, 8
  field :SPREAD, 9
  field :SYNTHETIC, 10
end

defmodule Rti.RequestSearchSymbols do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          search_text: String.t(),
          exchange: String.t(),
          product_code: String.t(),
          instrument_type: Rti.RequestSearchSymbols.InstrumentType.t(),
          pattern: Rti.RequestSearchSymbols.Pattern.t()
        }
  defstruct [
    :template_id,
    :user_msg,
    :search_text,
    :exchange,
    :product_code,
    :instrument_type,
    :pattern
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :search_text, 120_008, optional: true, type: :string
  field :exchange, 110_101, optional: true, type: :string
  field :product_code, 100_749, optional: true, type: :string

  field :instrument_type, 110_116,
    optional: true,
    type: Rti.RequestSearchSymbols.InstrumentType,
    enum: true

  field :pattern, 155_008, optional: true, type: Rti.RequestSearchSymbols.Pattern, enum: true
end
