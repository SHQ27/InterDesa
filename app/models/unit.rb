class Unit < ApplicationRecord
  belongs_to :building
  has_one :payment_plan

  enum type_id: %i[apartment parking]

  def self.getTypes
    return {
      'apartment' => 'apartment',
      'parking' => 'parking'
    }
  end

end
