class Location
  attr_reader :query, :lat, :lon

  def initialize(attributes)

    @query = attributes[:adminArea5]
    @lat = attributes[:latLng][:lat]
    @lon =  attributes[:latLng][:lng]

  end
end