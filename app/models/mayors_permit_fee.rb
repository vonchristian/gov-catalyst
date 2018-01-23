class MayorsPermitFee < Fee
  belongs_to :feeable, polymorphic: true
end
