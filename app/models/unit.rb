class Unit < ApplicationRecord
  belongs_to :building
  has_many :payment_plan

  enum type_id: %i[apartment parking]

  def self.getTypes
    return {
      'Apartment' => 0,
      'Parking' => 1
    }
  end

end
