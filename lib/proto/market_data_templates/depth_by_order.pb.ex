defmodule Rti.DepthByOrder.TransactionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :BUY | :SELL

  field :BUY, 1
  field :SELL, 2
end

defmodule Rti.DepthByOrder.UpdateType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :NEW | :CHANGE | :DELETE

  field :NEW, 1
  field :CHANGE, 2
  field :DELETE, 3
end

defmodule Rti.DepthByOrder do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          symbol: String.t(),
          exchange: String.t(),
          sequence_number: non_neg_integer,
          update_type: [[Rti.DepthByOrder.UpdateType.t()]],
          transaction_type: [[Rti.DepthByOrder.TransactionType.t()]],
          depth_price: [float | :infinity | :negative_infinity | :nan],
          prev_depth_price: [float | :infinity | :negative_infinity | :nan],
          prev_depth_price_flag: [boolean],
          depth_size: [integer],
          depth_order_priority: [non_neg_integer],
          exchange_order_id: [String.t()],
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
    :sequence_number,
    :update_type,
    :transaction_type,
    :depth_price,
    :prev_depth_price,
    :prev_depth_price_flag,
    :depth_size,
    :depth_order_priority,
    :exchange_order_id,
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
  field :sequence_number, 112_002, optional: true, type: :uint64
  field :update_type, 110_121, repeated: true, type: Rti.DepthByOrder.UpdateType, enum: true

  field :transaction_type, 153_612,
    repeated: true,
    type: Rti.DepthByOrder.TransactionType,
    enum: true

  field :depth_price, 154_405, repeated: true, type: :double
  field :prev_depth_price, 154_906, repeated: true, type: :double
  field :prev_depth_price_flag, 154_930, repeated: true, type: :bool
  field :depth_size, 154_406, repeated: true, type: :int32
  field :depth_order_priority, 153_613, repeated: true, type: :uint64
  field :exchange_order_id, 149_238, repeated: true, type: :string
  field :ssboe, 150_100, optional: true, type: :int32
  field :usecs, 150_101, optional: true, type: :int32
  field :source_ssboe, 150_400, optional: true, type: :int32
  field :source_usecs, 150_401, optional: true, type: :int32
  field :source_nsecs, 150_404, optional: true, type: :int32
  field :jop_ssboe, 150_600, optional: true, type: :int32
  field :jop_nsecs, 150_604, optional: true, type: :int32
end
