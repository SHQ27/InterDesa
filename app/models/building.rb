class Building < ApplicationRecord
  has_many :units
  has_many :price_lists

  #After create
  def createUnits(apartmentsPerStory, stories, parkings = 0, groundFloorApartments = 0, apartmentPrice = 0, parkingPrice = 0, rooms = 0)
    abc = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L']

    #Generate parkings
    currentParking = 1
    while currentParking <= parkings do
      parking = Unit.create!(
        name: 'Cochera ' + currentParking.to_s,
        building_id: self.id,
        type_id: 'parking',
        price: parkingPrice,
      )
      currentParking += 1
    end

    #Generate ground floor apartments
    letters = abc.first(groundFloorApartments)
    letters.each do |letter|
      apartment = Unit.create!(
        name: 'PB ' + letter,
        building_id: self.id,
        type_id: 'apartment',
        price: apartmentPrice,
        details: '',
        rooms: rooms
      )
    end

    #Generate apartments
    letters = abc.first(apartmentsPerStory)
    currentFloor = 1
    while currentFloor <= stories do
      letters.each do |letter|
        apartment = Unit.create!(
          name: currentFloor.to_s + '°' + letter,
          building_id: self.id,
          type_id: 'apartment',
          price: apartmentPrice,
          details: '',
          rooms: rooms
        )
      end
      currentFloor += 1
    end

  end

  #Finders
  def getSoldUnits
    soldUnits = 0
    self.units.each do |u|
      if u.payment_plan.length > 0
        soldUnits += 1
      end
    end
    soldUnits
  end

  def getApartments
    self.units.where('type_id = 0')
  end

  def getParkings
    self.units.where('type_id = 1')
  end

  def getRemainingUnits
    self.units.length - self.getSoldUnits
  end

  def getApartmentPriceList
    self.price_lists.where('unit_type_id = 0').last
  end

  def getParkingPriceList
    self.price_lists.where('unit_type_id = 1').last
  end

end
