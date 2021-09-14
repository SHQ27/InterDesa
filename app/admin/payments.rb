ActiveAdmin.register Payment do
  menu priority: 2, parent: "Payment plans"
  permit_params :start, :due, :amount, :paid, :payment_plan_id

  action_item :pay, only: :show do
    link_to('Pay', pay_admin_payment_path(resource), id: :pay_link, class: :button)
  end

  member_action :pay, method: :get do
    if not resource.paid
      resource.paid = true
      resource.paid_at = Time.now
      resource.save
      flash[:notice] = 'Payment paid!'
    else
      flash[:alert] = 'Already paid!'
    end

    redirect_to action: 'show', id: resource.id
  end

  form do |f|
     f.inputs 'Information' do
       f.input :name
       f.input :payment_plan_id, as: :select, collection: PaymentPlan.all, label: :name
       f.input :start, as: :datepicker
       f.input :due, as: :datepicker
       f.input :amount

     end
     f.actions
   end
 
  
end
