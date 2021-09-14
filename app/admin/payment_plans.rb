ActiveAdmin.register PaymentPlan do
  menu priority: 1, parent: "Payment plans"
  permit_params :name, :number_of_payments, :unit_id, :client_id, :start, :end

  form do |f|
     f.inputs 'Information' do
       f.input :name
       f.input :number_of_payments
       f.input :unit_id, as: :select, collection: Unit.all.map{|u| ["#{u.name} - #{u.building.name}", u.id]}, label: :name
       f.input :client_id, as: :select, collection: Client.all.map{|c| ["#{c.name} #{c.lastname}", c.id]}, label: :name
       f.input :start, as: :datepicker
     end
     f.actions
   end
 
end
