class Unit < ApplicationRecord
  belongs_to :building
  has_one :payment_plan

  enum type_id: %i[apartment parking]

  def self.available
    availableUnits = []
    Unit.all.each do |u|
      if not u.payment_plan
        availableUnits.push(u)
      end
    end
    availableUnits
  end
  def isAvailable
    self.payment_plan ? true : false
  end

  def self.getTypes
    return {
      'Apartment' => 0,
      'Parking' => 1
    }
  end

end
