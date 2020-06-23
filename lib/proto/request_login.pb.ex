defmodule Rti.RequestLogin.SysInfraType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer | :TICKER_PLANT | :ORDER_PLANT | :HISTORY_PLANT | :PNL_PLANT | :REPOSITORY_PLANT

  field :TICKER_PLANT, 1
  field :ORDER_PLANT, 2
  field :HISTORY_PLANT, 3
  field :PNL_PLANT, 4
  field :REPOSITORY_PLANT, 5
end

defmodule Rti.RequestLogin do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          template_version: String.t(),
          user_msg: [String.t()],
          user: String.t(),
          password: String.t(),
          app_name: String.t(),
          app_version: String.t(),
          system_name: String.t(),
          infra_type: Rti.RequestLogin.SysInfraType.t()
        }
  defstruct [
    :template_id,
    :template_version,
    :user_msg,
    :user,
    :password,
    :app_name,
    :app_version,
    :system_name,
    :infra_type
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :template_version, 153_634, optional: true, type: :string
  field :user_msg, 132_760, repeated: true, type: :string
  field :user, 131_003, optional: true, type: :string
  field :password, 130_004, optional: true, type: :string
  field :app_name, 130_002, optional: true, type: :string
  field :app_version, 131_803, optional: true, type: :string
  field :system_name, 153_628, optional: true, type: :string
  field :infra_type, 153_621, optional: true, type: Rti.RequestLogin.SysInfraType, enum: true
end
