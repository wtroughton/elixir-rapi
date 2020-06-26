defmodule Rti.RequestShowOrderHistorySummary do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          fcm_id: String.t(),
          ib_id: String.t(),
          account_id: String.t(),
          date: String.t()
        }
  defstruct [:template_id, :user_msg, :fcm_id, :ib_id, :account_id, :date]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :fcm_id, 154_013, optional: true, type: :string
  field :ib_id, 154_014, optional: true, type: :string
  field :account_id, 154_008, optional: true, type: :string
  field :date, 110_615, optional: true, type: :string
end
