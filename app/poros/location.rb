class Location
  attr_reader :lat, :lon

  def initialize(attributes)
    @lat = attributes[:latLng][:lat]
    @lon =  attributes[:latLng][:lng]

  end
end