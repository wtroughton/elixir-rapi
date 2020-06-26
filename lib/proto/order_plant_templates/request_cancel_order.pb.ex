defmodule Rti.RequestCancelOrder.OrderPlacement do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :MANUAL | :AUTO

  field :MANUAL, 1
  field :AUTO, 2
end

defmodule Rti.RequestCancelOrder do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          fcm_id: String.t(),
          ib_id: String.t(),
          account_id: String.t(),
          basket_id: String.t(),
          manual_or_auto: Rti.RequestCancelOrder.OrderPlacement.t()
        }
  defstruct [:template_id, :user_msg, :fcm_id, :ib_id, :account_id, :basket_id, :manual_or_auto]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :fcm_id, 154_013, optional: true, type: :string
  field :ib_id, 154_014, optional: true, type: :string
  field :account_id, 154_008, optional: true, type: :string
  field :basket_id, 110_300, optional: true, type: :string

  field :manual_or_auto, 154_710,
    optional: true,
    type: Rti.RequestCancelOrder.OrderPlacement,
    enum: true
end
