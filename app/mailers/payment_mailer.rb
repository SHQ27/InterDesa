class PaymentMailer < ApplicationMailer
  def due_payment 
    @paymentPlan = params[:paymentPlan]
    mail(to: @paymentPlan.client.email, subject: 'Dto. de Cobranzas de INTERDESA S.A.')
  end

  def upcoming_payment 
    @payment = params[:payment]
    mail(to: @payment.payment_plan.client.email, subject: "Liquidación de plan de pago inmobiliario.")
  end

  def recieved_payment 
    @payment = params[:payment]
    mail(to: @payment.payment_plan.client.email, subject: '¡Su pago ha sido acreditado!')
  end

end
