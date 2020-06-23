defmodule Rti.ResponseGetInstrumentByUnderlyingKeys do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          rp_code: [String.t()],
          underlying_symbol: [String.t()],
          exchange: [String.t()],
          expiration_date: [String.t()]
        }
  defstruct [:template_id, :user_msg, :rp_code, :underlying_symbol, :exchange, :expiration_date]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :rp_code, 132_766, repeated: true, type: :string
  field :underlying_symbol, 101_026, repeated: true, type: :string
  field :exchange, 110_101, repeated: true, type: :string
  field :expiration_date, 100_067, repeated: true, type: :string
end
