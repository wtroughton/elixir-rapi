defmodule Rti.RequestDepthByOrderUpdates.Request do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :SUBSCRIBE | :UNSUBSCRIBE

  field :SUBSCRIBE, 1
  field :UNSUBSCRIBE, 2
end

defmodule Rti.RequestDepthByOrderUpdates do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          request: Rti.RequestDepthByOrderUpdates.Request.t(),
          symbol: String.t(),
          exchange: String.t(),
          depth_price: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:template_id, :user_msg, :request, :symbol, :exchange, :depth_price]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string

  field :request, 100_000,
    optional: true,
    type: Rti.RequestDepthByOrderUpdates.Request,
    enum: true

  field :symbol, 110_100, optional: true, type: :string
  field :exchange, 110_101, optional: true, type: :string
  field :depth_price, 154_405, optional: true, type: :double
end
