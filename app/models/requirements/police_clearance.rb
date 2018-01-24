module Requirements
  class PoliceClearance < Requirement
    has_many :applicable_fees, as: :
  end
end
