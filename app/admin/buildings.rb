ActiveAdmin.register Building do
  permit_params :name, :address
  menu priority: 1, parent: "Buildings"
end
