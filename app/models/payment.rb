class Payment < ApplicationRecord
  belongs_to :payment_plan

  before_update :updatePayments, if: :amount_changed?

  def self.duePayments
    Payment.where("paid = 1 and due < ?", Time.now)
  end

  def self.latestPayments
    Payment.where(:paid => true).order(paid_at: :desc).first(5)
  end

  def updatePayments
    paymentPlan = self.payment_plan
    remainingPayments = paymentPlan.getRemainingPayments
    remainingAmount = paymentPlan.getRemainingAmount
    amountToDistribute = remainingAmount - self.amount

    paymentsToDistribute = []

    remainingPayments.each do |p|
      unless p.id == self.id
        paymentsToDistribute.push(p)
      end
    end

    amountPerPayment = amountToDistribute / paymentsToDistribute.length

    paymentsToDistribute.each do |ptd|
      ptd.update_column(:amount, amountPerPayment)
    end
  end
end
