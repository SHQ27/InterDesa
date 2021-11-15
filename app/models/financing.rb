class Financing < ApplicationRecord
  belongs_to :price_list

  def getFinancedAmountForUnit(unit)
    toFinance = self.price_list.getPercentageToFinance
    amountToFinance = toFinance / 100 * unit.price
    paymentAmount = amountToFinance / self.payments 
    paymentAmountPlusFees = paymentAmount * ((100 + self.fee_percentage_value_over_financed_price)/100)
    totalFinanced = paymentAmountPlusFees * self.payments
    totalFinanced
  end

end
