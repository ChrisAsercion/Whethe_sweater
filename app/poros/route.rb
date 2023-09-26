class Route
  attr_reader :to, :from

  def initialize(origin, destination)
    @to = destination
    @from = origin
  end
end