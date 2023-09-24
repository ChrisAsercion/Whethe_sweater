require "rails_helper"

RSpec.describe Location do
  it "exists" do 

    attrs = {
      adminArea5: "Denver, CO", :latLng=>{:lat=>39.74381, :lng=>-104.99528}
    }

    location = Location.new(attrs)
    
    expect(location).to be_a Location
    expect(location.query).to eq("Denver, CO")
    expect(location.lat).to eq(39.74381)
    expect(location.lon).to eq(-104.99528)


  end
end