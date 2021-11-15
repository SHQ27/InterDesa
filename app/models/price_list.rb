class PriceList < ApplicationRecord
  belongs_to :building
  has_many :financings
  has_many :taxes

  enum unit_type_id: %i[apartment parking]

  def getDownpaymentAmountForUnit(unit)
    percentage = self.downpayment_percentage_over_unit_price
    quantity = self.downpayment_quantity
    downpaymentAmount = unit.price * percentage / 100
    total = downpaymentAmount * quantity
    total
  end

  def getAnnualPaymentAmountForUnit(unit)
    percentage = self.annual_payment_percentage_over_unit_price
    quantity = self.annual_payment_quantity
    annualPaymentAmount = unit.price * percentage / 100
    total = annualPaymentAmount* quantity
    total
  end

  def getPercentageToFinance
    downpayment = self.downpayment_percentage_over_unit_price * self.downpayment_quantity
    annualPayment = self.annual_payment_percentage_over_unit_price * self.annual_payment_quantity
    percentage = downpayment + annualPayment
    percentage
  end

end
