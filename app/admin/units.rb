ActiveAdmin.register Unit do
  permit_params :name, :type_id, :price, :details, :building_id, :rooms, :square_meters
  menu priority: 2, parent: "Buildings" 

  filter :building
  filter :payment_plan
  filter :name
  filter :type_id, as: :select, collection: Unit.getTypeFilters
  filter :price
  filter :rooms
  filter :square_meters

  index do
    selectable_column
    id_column
    column :name
    column :building
    column :type_id
    column :price
    column :square_meters
    actions
  end


  form do |f|
    disabled = f.object && f.object.payment_plan.length > 0 ? true : false
    selectedType = f.object ? f.object.type_id : 'apartment'
     f.inputs 'Information' do
       f.input :name, :input_html => { :disabled => disabled }
       f.input :building_id, as: :select, collection: Building.all, label: :name, :input_html => { :disabled => disabled }
       f.input :type_id, as: :select, collection: Unit.getTypes, label: :name, selected: selectedType, :input_html => { :disabled => disabled }
       f.input :price, :input_html => { :disabled => disabled }
       f.input :rooms
       f.input :square_meters
       f.input :details, label: 'Details', :input_html => { :disabled => disabled }
     end
     f.actions
   end
 
end
