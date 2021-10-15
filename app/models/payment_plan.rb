class PaymentPlan < ApplicationRecord
  has_many :payments
  belongs_to :unit
  belongs_to :client

  enum frequency_id: %i[month year]

  after_create :createPayments


  def self.getFrequencies
    return {
      'Month' => 'month',
      'Year' => 'year'
    }
  end

  #After create
  def createPayments
    self.name = self.unit.name + ' - ' + self.unit.building.name
    self.save
    payments = self.number_of_payments
    planStart = self.start
    paymentPlanTotal = (self.unit.price - self.down_payment) * (self.percentage / 100.to_f)

    i = 0

    while i < payments
      paymentName = "Cuota nro. #{i + 1} - #{self.unit.name} (#{self.unit.building.name})"
      if self.frequency_id == 'month'
        paymentStart = planStart + i.month
        paymentDue = paymentStart + 1.month
      elsif self.frequency_id == 'year'
        paymentStart = planStart + i.year
        paymentDue = paymentStart + 1.year
      end
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

  #Finders
  def getRemainingPayments
    self.payments.where(:paid => false)
  end

  def getPaidPayments
    self.payments.where(:paid => true)
  end

  def getRemainingAmount
    totalAmount = (self.unit.price - self.down_payment) * (self.percentage / 100.to_f)
    paidPayments = self.getPaidPayments
    paidAmount = 0
    paidPayments.each do |p|
      paidAmount += p.amount
    end
    totalAmount - paidAmount
  end

  def getDueAmount
    duePayments = self.payments.where(:paid => false).where("due <= ?", Time.now)
    dueAmount = 0
    duePayments.each do |p| 
      dueAmount += p.amount
    end
    dueAmount
  end

end
