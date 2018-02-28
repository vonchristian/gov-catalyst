class OfficialReceipt < ApplicationRecord
  belongs_to :receiptable, polymorphic: true
  before_save :set_number, :set_date
  def self.generate_number
    return "000000000000001" if !self.exists?
    last.number.succ
  end
  def formatted_number
    number.to_s.rjust(15, "0")
  end

  private
  def set_number
    self.number = OfficialReceipt.generate_number
  end
  def set_date
    self.date ||= Time.zone.now
  end
end
