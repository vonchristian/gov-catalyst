class AmountComputer
  def compute(fee)
    if fee.fixed_amount?
      fee.amount
    elsif fee.percentage?
      fee.percent * feeable.amount
    end
  end
end
