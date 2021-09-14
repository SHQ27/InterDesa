class PaymentPlan < ApplicationRecord
  has_many :payments
  belongs_to :unit
  belongs_to :client

  after_create :createPayments

  def createPayments
    payments = self.number_of_payments
    planStart = self.start
    paymentPlanTotal = self.unit.price

    i = 0

    while i < payments
      paymentName = "Cuota nro. #{i} - #{self.unit.name}"
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
