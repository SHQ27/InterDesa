ActiveAdmin.register Unit do
  permit_params :name, :type_id, :price, :details, :building_id
  menu priority: 2, parent: "Buildings" 

  form do |f|
     f.inputs 'Information' do
       f.input :name
       f.input :building_id, as: :select, collection: Building.all, label: :name
       f.input :type_id, as: :select, collection: Unit.getTypes, label: :name, selected: 'apartment'
       f.input :price
       f.input :details, label: 'Details'

     end
     f.actions
   end
 
end
