class Building < ApplicationRecord
  has_many :units

  def getSoldUnits
    soldUnits = 0
    self.units.each do |u|
      if u.payment_plan
        soldUnits += 1
      end
    end
    soldUnits
  end

  def getRemainingUnits
    self.units.length - self.getSoldUnits
  end
end
