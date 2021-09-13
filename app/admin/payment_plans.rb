ActiveAdmin.register PaymentPlan do

  permit_params :number_of_payments, :unit_id, :client_id, :start, :end

  form do |f|
     f.inputs 'Information' do
       f.input :number_of_payments
       f.input :unit_id, as: :select, collection: Unit.all, label: :name
       f.input :client_id, as: :select, collection: Client.all, label: :name
       f.input :start, as: :datepicker

     end
     f.actions
   end
 
end
