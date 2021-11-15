ActiveAdmin.register Tax do
  menu priority: 3, parent: "Price Lists"
  #
  permit_params :price_list_id, :name, :percentage_value_over_unit_price
  
  form do |f|
    f.inputs 'Details' do
      f.input :price_list_id, as: :select, collection: PriceList.all.map{|pl| ["#{pl.building.name} - #{pl.unit_type_id}", pl.id]}, label: :name
      f.input :name
      f.input :percentage_value_over_unit_price
    end
    f.actions
  end
end
