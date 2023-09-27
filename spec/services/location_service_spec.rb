require 'rails_helper'

describe LocationService do
  context "class_methods" do
    context "#location_by_query" do
      it "returns location data", vcr:{ cassette_name: 'location_data'} do
        VCR.use_cassette('location_data') do
          location = LocationService.new.location_by_query("Denver, CO")
          lat_lon = location[:results][0][:locations][0][:latLng]
          
          expect(location).to be_a Hash
          expect(lat_lon[:lat]).to eq(39.74001)
          expect(lat_lon[:lng]).to eq(-104.99202)
        end
      end
    end
  end
end