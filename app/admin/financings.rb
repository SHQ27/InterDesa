ActiveAdmin.register Financing do
  menu priority: 2, parent: "Price Lists"
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :price_list_id, :payments, :financing_percentage_value_over_unit_price, :payment_percentage_value_over_financed_price, :payment_frequency, :fee_percentage_value_over_financed_price
  #
  # or
  #
  # permit_params do
  #   permitted = [:price_list_id, :payments, :financing_percentage_value_over_unit_price, :payment_percentage_value_over_financed_price, :payment_frequency, :fee_percentage_value_over_financed_price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
