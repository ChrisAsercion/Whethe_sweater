class RouteFacade
  def initialize(origin, destination)
    @origin = origin 
    @destination = destination
  end

  def get_route
    service = RouteService.new
    route_poro = Route.new(@origin, @destination)

    json = service.route_finder(route_poro)
  end
end