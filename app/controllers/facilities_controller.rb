class FacilitiesController < ApplicationController
  
  def index
    @facilities = Facility.all
  end

  def show
    @facility = Facility.find(params[:id])
    @hash = Gmaps4rails.build_markers(@facility) do |facility, marker|
      marker.lat facility.latitude
      marker.lng facility.longitude
      marker.infowindow facility.facility_name
    end
  end


end
