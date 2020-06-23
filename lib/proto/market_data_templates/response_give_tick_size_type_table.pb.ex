defmodule Rti.ResponseGiveTickSizeTypeTable.PresenceBits do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t ::
          integer
          | :TICK_SIZE_FIRST_PRICE
          | :TICK_SIZE_LAST_PRICE
          | :TICK_SIZE_FP_OPERATOR
          | :TICK_SIZE_LP_OPERATOR

  field :TICK_SIZE_FIRST_PRICE, 1
  field :TICK_SIZE_LAST_PRICE, 2
  field :TICK_SIZE_FP_OPERATOR, 4
  field :TICK_SIZE_LP_OPERATOR, 8
end

defmodule Rti.ResponseGiveTickSizeTypeTable do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          template_id: integer,
          user_msg: [String.t()],
          rq_handler_rp_code: [String.t()],
          rp_code: [String.t()],
          presence_bits: non_neg_integer,
          tick_size_type: String.t(),
          tick_size_fp_operator: String.t(),
          tick_size_lp_operator: String.t(),
          min_fprice_change: float | :infinity | :negative_infinity | :nan,
          tick_size_first_price: float | :infinity | :negative_infinity | :nan,
          tick_size_last_price: float | :infinity | :negative_infinity | :nan
        }
  defstruct [
    :template_id,
    :user_msg,
    :rq_handler_rp_code,
    :rp_code,
    :presence_bits,
    :tick_size_type,
    :tick_size_fp_operator,
    :tick_size_lp_operator,
    :min_fprice_change,
    :tick_size_first_price,
    :tick_size_last_price
  ]

  field :template_id, 154_467, required: true, type: :int32
  field :user_msg, 132_760, repeated: true, type: :string
  field :rq_handler_rp_code, 132_764, repeated: true, type: :string
  field :rp_code, 132_766, repeated: true, type: :string
  field :presence_bits, 149_138, optional: true, type: :uint32
  field :tick_size_type, 154_167, optional: true, type: :string
  field :tick_size_fp_operator, 154_170, optional: true, type: :string
  field :tick_size_lp_operator, 154_171, optional: true, type: :string
  field :min_fprice_change, 154_387, optional: true, type: :double
  field :tick_size_first_price, 154_168, optional: true, type: :double
  field :tick_size_last_price, 154_169, optional: true, type: :double
end
