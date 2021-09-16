class PaymentMailer < ApplicationMailer
  def due_payment 
    @payment = params[:payment]
    mail(to: @payment.payment_plan.client.email, 'Tiene una cuota vencida.')
  end

  def upcoming_payment 
    @payment = params[:payment]
    mail(to: @payment.payment_plan.client.email, 'Una cuota está próxima a vencer.')
  end

  def recieved_payment 
    @payment = params[:payment]
    mail(to: @payment.payment_plan.client.email, 'Su pago ha sido acreditado!')
  end

end
