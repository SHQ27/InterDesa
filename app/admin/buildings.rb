ActiveAdmin.register Building do
  skip_before_action :verify_authenticity_token, only: [:generate_units]
  permit_params :name, :address
  menu priority: 1, parent: "Buildings"

  index do
    selectable_column
    id_column
    column :name
    column :address
    actions
  end


  action_item :unit_generation, only: :show do
    link_to('Generate units', unit_generation_admin_building_path(resource), id: :generate_units_link, class: :button)
  end

  action_item :building_price_list, only: :show do
    link_to('View price list', view_price_list_admin_building_path(resource), id: :view_price_list_link, class: :button)
  end


  member_action :unit_generation, method: :get do
    @building = resource
  end

  member_action :generate_units, method: :post do
    if resource.units.length == 0
      apartmentsPerStory = params[:apartments_per_story]
      stories = params[:stories]
      parkings = params[:parkings]
      groundFloorApartments = params[:ground_floor_apartments]
      defaultApartmentPrice = params[:default_apartment_price]
      defaultParkingPrice = params[:default_parking_price]
      defaultRooms = params[:average_apartment_rooms]

      resource.createUnits(apartmentsPerStory.to_i, stories.to_i, parkings.to_i, groundFloorApartments.to_i, defaultApartmentPrice.to_i, defaultParkingPrice.to_i, defaultRooms.to_i)

      flash[:notice] = 'Units generated!'
    else
      flash[:alert] = 'Building already has created units.'
    end
    redirect_to action: 'show', id: resource.id
  end

  member_action :view_price_list, method: :get do
    @building = resource
  end

end
