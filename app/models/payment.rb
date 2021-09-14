class Payment < ApplicationRecord
  belongs_to :payment_plan

  after_update :updatePayments

  def updatePayments
  end

end
