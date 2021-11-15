ActiveAdmin.register Financing do
  menu priority: 2, parent: "Price Lists"
  permit_params :price_list_id, :payments, :financing_percentage_value_over_unit_price, :payment_percentage_value_over_financed_price, :payment_frequency, :fee_percentage_value_over_financed_price

  form do |f|
     f.inputs 'Details' do
       f.input :price_list, as: :select, collection: PriceList.all.map{|pl| ["#{pl.building.name} - #{pl.unit_type_id}", pl.id]}, label: :name
       f.input :payments
       f.input :fee_percentage_value_over_financed_price
     end
     f.actions
   end
 
end
