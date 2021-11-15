class Tax < ApplicationRecord
  belongs_to :price_list

  def getAmountForUnit(unit)
    return (self.percentage_value_over_unit_price/100) * unit.price 
  end
end
