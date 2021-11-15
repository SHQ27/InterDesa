ActiveAdmin.register PriceList do
  menu priority: 1, parent: "Price Lists"
  #
  permit_params :building_id, :unit_type_id, :downpayment_quantity, :downpayment_percentage_over_unit_price, :annual_payment_quantity, :annual_payment_percentage_over_unit_price
  #
  form do |f|
     f.inputs 'Details' do
       selectedType = f.object ? f.object.unit_type_id : 'apartment'
       f.input :building_id, as: :select, collection: Building.all, label: :name
       f.input :unit_type_id, as: :select, collection: Unit.getTypes, label: :name, selected: selectedType
       f.input :downpayment_quantity
       f.input :downpayment_percentage_over_unit_price
       f.input :annual_payment_quantity
       f.input :annual_payment_percentage_over_unit_price
     end
     f.actions
   end
 
end
