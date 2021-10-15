ActiveAdmin.register PaymentPlan do
  menu priority: 1, parent: "Payment plans"
  permit_params :name, :number_of_payments, :unit_id, :client_id, :start, :end, :frequency_id, :down_payment, :percentage

  index do
    selectable_column
    id_column
    column :name
    column :number_of_payments
    column :unit
    column :client
    column :percentage
    column :down_payment
    column :start
    actions
  end

  form do |f|
     f.inputs 'Information' do
       f.input :number_of_payments
       f.input :unit_id, as: :select, collection: Unit.all, label: :name
       f.input :client_id, as: :select, collection: Client.all.map{|c| ["#{c.name} #{c.lastname}", c.id]}, label: :name
       f.input :frequency_id, as: :select, collection: PaymentPlan.getFrequencies
       f.input :percentage
       f.input :down_payment
       f.input :start, as: :datepicker
     end
     f.actions
   end
 
end
