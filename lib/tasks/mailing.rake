namespace :mailing do
  desc "Mailing."

  task notify: :environment do
    #Notify due payments
    duePayments = Payment.duePayments  
    duePayments.each do |dp|
      if not dp.due_notified_at
        PaymentMailer.with(payment: dp).due_payment.deliver_later
        dp.due_notified_at = Time.now
        dp.save
      end
    end

    #Notify upcoming payments
    upcomingPayments = Payment.upcomingPayments
    upcomingPayments.each do |up|
      if not up.upcoming_notified_at
        PaymentMailer.with(payment: up).upcoming_payment.deliver_later
        up.upcoming_notified_at = Time.now
        up.save
      end
    end
  end

end
