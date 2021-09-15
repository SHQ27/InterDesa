class PaymentPlan < ApplicationRecord
  has_many :payments
  belongs_to :unit
  belongs_to :client

  after_create :createPayments

  def getRemainingPayments
    self.payments.where(:paid => false)
  end

  def getRemainingAmount
    totalRemaining = 0
    self.getRemainingPayments.each do |p|
      totalRemaining += p.amount
    end
    totalRemaining
  end

  def createPayments
    payments = self.number_of_payments
    planStart = self.start
    paymentPlanTotal = self.unit.price

    i = 0

    while i < payments
      paymentName = "Cuota nro. #{i + 1} - #{self.unit.name} (#{self.unit.building.name})"
      paymentStart = planStart + i.month
      paymentDue = paymentStart + 1.month
      paymentAmount = paymentPlanTotal / payments

      payment = Payment.create!( 
        start: paymentStart,
        due: paymentDue,
        amount: paymentAmount,
        paid: false,
        payment_plan_id: self.id,
        name: paymentName
      )

      i += 1
    end
  end

end
