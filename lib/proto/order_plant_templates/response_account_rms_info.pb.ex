defmodule Rti.ResponseAccountRmsInfo.PresenceBits do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :BUY_LIMIT
          | :SELL_LIMIT
          | :LOSS_LIMIT
          | :MAX_ORDER_QUANTITY
          | :MIN_ACCOUNT_BALANCE
          | :MIN_MARGIN_BALANCE
          | :ALGORITHM
          | :STATUS
          | :CURRENCY
          | :DEFAULT_COMMISSION

  field :BUY_LIMIT, 1
  field :SELL_LIMIT, 2
  field :LOSS_LIMIT, 4
  field :MAX_ORDER_QUANTITY, 8
  field :MIN_ACCOUNT_BALANCE, 16
  field :MIN_MARGIN_BALANCE, 32
  field :ALGORITHM, 64
  field :STATUS, 128
  field :CURRENCY, 256
  field :DEFAULT_COMMISSION, 512
end

defmodule Rti.ResponseAccountRmsInfo.AutoLiquidateFlag do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :ENABLED | :DISABLED

  field :ENABLED, 1
  field :DISABLED, 2
end

defmodule Rti.ResponseAccountRmsInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          rq_handler_rp_code: [String.t()],
          rp_code: [String.t()],
          presence_bits: non_neg_integer,
          fcm_id: String.t(),
          ib_id: String.t(),
          account_id: String.t(),
          currency: String.t(),
          status: String.t(),
          algorithm: String.t(),
          auto_liquidate_criteria: String.t(),
          auto_liquidate: Rti.ResponseAccountRmsInfo.AutoLiquidateFlag.t(),
          disable_on_auto_liquidate: Rti.ResponseAccountRmsInfo.AutoLiquidateFlag.t(),
          auto_liquidate_threshold: float | :infinity | :negative_infinity | :nan,
          auto_liquidate_max_min_account_balance: float | :infinity | :negative_infinity | :nan,
          loss_limit: float | :infinity | :negative_infinity | :nan,
          min_account_balance: float | :infinity | :negative_infinity | :nan,
          min_margin_balance: float | :infinity | :negative_infinity | :nan,
          default_commission: float | :infinity | :negative_infinity | :nan,
          buy_limit: integer,
          max_order_quantity: integer,
          sell_limit: integer,
          check_min_account_balance: boolean
        }
  defstruct [
    :template_id,
    :user_msg,
    :rq_handler_rp_code,
    :rp_code,
    :presence_bits,
    :fcm_id,
    :ib_id,
    :account_id,
    :currency,
    :status,
    :algorithm,
    :auto_liquidate_criteria,
    :auto_liquidate,
    :disable_on_auto_liquidate,
    :auto_liquidate_threshold,
    :auto_liquidate_max_min_account_balance,
    :loss_limit,
    :min_account_balance,
    :min_margin_balance,
    :default_commission,
    :buy_limit,
    :max_order_quantity,
    :sell_limit,
    :check_min_account_balance
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :rq_handler_rp_code, 132_764, repeated: true, type: :string
  field :rp_code, 132_766, repeated: true, type: :string
  field :presence_bits, 153_622, optional: true, type: :uint32
  field :fcm_id, 154_013, optional: true, type: :string
  field :ib_id, 154_014, optional: true, type: :string
  field :account_id, 154_008, optional: true, type: :string
  field :currency, 154_383, optional: true, type: :string
  field :status, 154_003, optional: true, type: :string
  field :algorithm, 150_142, optional: true, type: :string
  field :auto_liquidate_criteria, 131_036, optional: true, type: :string

  field :auto_liquidate, 131_035,
    optional: true,
    type: Rti.ResponseAccountRmsInfo.AutoLiquidateFlag,
    enum: true

  field :disable_on_auto_liquidate, 131_038,
    optional: true,
    type: Rti.ResponseAccountRmsInfo.AutoLiquidateFlag,
    enum: true

  field :auto_liquidate_threshold, 131_037, optional: true, type: :double
  field :auto_liquidate_max_min_account_balance, 131_039, optional: true, type: :double
  field :loss_limit, 154_019, optional: true, type: :double
  field :min_account_balance, 156_968, optional: true, type: :double
  field :min_margin_balance, 156_976, optional: true, type: :double
  field :default_commission, 153_368, optional: true, type: :double
  field :buy_limit, 154_009, optional: true, type: :int32
  field :max_order_quantity, 110_105, optional: true, type: :int32
  field :sell_limit, 154_035, optional: true, type: :int32
  field :check_min_account_balance, 156_972, optional: true, type: :bool
end
