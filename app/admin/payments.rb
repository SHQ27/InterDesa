ActiveAdmin.register Payment do
  menu priority: 2, parent: "Payment plans"
  permit_params :start, :due, :amount, :paid, :payment_plan_id

  index do
    selectable_column
    id_column
    column :name
    column :start
    column :due
    column :amount
    column :paid
    column :payment_plan
    column :paid_at
    actions
  end

  action_item :pay, only: :show do
    link_to('Pay', pay_admin_payment_path(resource), id: :pay_link, class: :button)
  end

  member_action :pay, method: :get do
    if not resource.paid
      resource.paid = true
      resource.paid_at = Time.now
      resource.save
      PaymentMailer.with(payment: resource).recieved_payment.deliver_later
      flash[:notice] = 'Payment set as paid and email sent!'
    else
      flash[:alert] = 'Already paid!'
    end

    redirect_to action: 'show', id: resource.id
  end

  form do |f|
    disabled = f.object && f.object.paid ? true : false
    isEdit = f.object ? true : false
    f.inputs 'Information' do
      f.input :name, :input_html => { :disabled => isEdit }
      f.input :payment_plan_id, as: :select, collection: PaymentPlan.all, label: :name, :input_html => { :disabled => isEdit }
      f.input :start, as: :datepicker, :input_html => { :disabled => disabled }
      f.input :due, as: :datepicker, :input_html => { :disabled => disabled }
      f.input :amount, :input_html => { :disabled => disabled }
    end
    f.actions
  end
end
