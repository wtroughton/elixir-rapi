defmodule Rti.RequestCancelAllOrders.OrderPlacement do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :MANUAL | :AUTO

  field :MANUAL, 1
  field :AUTO, 2
end

defmodule Rti.RequestCancelAllOrders.UserType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :USER_TYPE_ADMIN | :USER_TYPE_FCM | :USER_TYPE_IB | :USER_TYPE_TRADER

  field :USER_TYPE_ADMIN, 0
  field :USER_TYPE_FCM, 1
  field :USER_TYPE_IB, 2
  field :USER_TYPE_TRADER, 3
end

defmodule Rti.RequestCancelAllOrders do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          fcm_id: String.t(),
          ib_id: String.t(),
          account_id: String.t(),
          user_type: Rti.RequestCancelAllOrders.UserType.t(),
          manual_or_auto: Rti.RequestCancelAllOrders.OrderPlacement.t()
        }
  defstruct [:template_id, :user_msg, :fcm_id, :ib_id, :account_id, :user_type, :manual_or_auto]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :fcm_id, 154_013, optional: true, type: :string
  field :ib_id, 154_014, optional: true, type: :string
  field :account_id, 154_008, optional: true, type: :string
  field :user_type, 154_036, optional: true, type: Rti.RequestCancelAllOrders.UserType, enum: true

  field :manual_or_auto, 154_710,
    optional: true,
    type: Rti.RequestCancelAllOrders.OrderPlacement,
    enum: true
end
