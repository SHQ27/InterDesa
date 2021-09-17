class Payment < ApplicationRecord
  belongs_to :payment_plan

  before_update :updatePayments, if: :amount_changed?

  #Getters
  def self.duePayments
    Payment.where("paid = 0 and due < ?", Time.now)
  end

  def self.latestPayments
    Payment.where(:paid => true).order(paid_at: :desc).first(5)
  end

  def self.upcomingPayments
    Payment.where("paid = 0 and start < ? and due > ?", Time.now, Time.now)
  end

  #Before update 
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

  #Formatting
  def getStartMonthName
    monthNumber = self.start.month
    meses = [nil, 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
    meses[monthNumber]
  end

  def getDueMonthName
    monthNumber = self.due.month
    meses = [nil, 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
    meses[monthNumber]
  end

  def getFormattedStart
    self.start.strftime("%d/%m/%Y")
  end

  def getFormattedEnd
    self.due.strftime("%d/%m/%Y")
  end

  def getFormattedAmount
    sprintf('%.2f', self.amount)
  end

  def getFormattedPaidAt
    self.paid_at.strftime("%d/%m/%Y")
  end
end
