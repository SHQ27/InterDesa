# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview
  def due_payment
    paymentPlan = PaymentPlan.last
    PaymentMailer.with(paymentPlan: paymentPlan).due_payment
  end

  def recieved_payment
    payment= Payment.last
    PaymentMailer.with(payment: payment).recieved_payment
  end

  def upcoming_payment
    payment = Payment.last
    PaymentMailer.with(payment: payment).upcoming_payment
  end



end
