defmodule Rti.ResponseLogin do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          template_version: String.t(),
          user_msg: [String.t()],
          rp_code: [String.t()],
          fcm_id: String.t(),
          ib_id: String.t(),
          country_code: String.t(),
          state_code: String.t(),
          heartbeat_interval: float | :infinity | :negative_infinity | :nan
        }
  defstruct [
    :template_id,
    :template_version,
    :user_msg,
    :rp_code,
    :fcm_id,
    :ib_id,
    :country_code,
    :state_code,
    :heartbeat_interval
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :template_version, 153_634, optional: true, type: :string
  field :user_msg, 132_760, repeated: true, type: :string
  field :rp_code, 132_766, repeated: true, type: :string
  field :fcm_id, 154_013, optional: true, type: :string
  field :ib_id, 154_014, optional: true, type: :string
  field :country_code, 154_712, optional: true, type: :string
  field :state_code, 154_713, optional: true, type: :string
  field :heartbeat_interval, 153_633, optional: true, type: :double
end
