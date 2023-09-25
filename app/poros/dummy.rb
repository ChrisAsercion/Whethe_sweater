class Location
  attr_reader :title, :ex

  def initialize(attributes)
    @title = attributes[:][:]
    @ex =  attributes[:][:]

  end
end