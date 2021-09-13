ActiveAdmin.register Unit do
  permit_params :name, :type_id, :price, :details, :building_id
  menu priority: 2, parent: "Buildings" 
end
