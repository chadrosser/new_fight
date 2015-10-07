class VenuesController < ApplicationController
  require "open-uri"
  def index
    @current_user = Users.find(session[:user_id])
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def create
    dar = "https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:location]},#{params[:city]},#{params[:state]}&key=AIzaSyCGkuu7WHt_h8TXQRUfX37Ae6-lmm1aElQ"
    response = open(dar).read
    data = JSON.parse(response)
    lat = data['results'][0]['geometry']['location']['lat']
    lng = data['results'][0]['geometry']['location']['lng']

  	new_venue = Venue.create(name: params[:name], location: params[:location], city: params[:city], state: params[:state], lat: lat, lng:lng, country: params[:country], zipcode: params[:zipcode], description: params[:description])
  	if new_venue.valid?
  		redirect_to "/venues/index"
  	else
  		flash[:errors] = new_venue.errors.full_messages
  		redirect_to "/venues/new"
  	end
  end

  private

  def user_params
  	params.require(:venue).permit(:name,:location,:city,:state,:lat,:lng,:country,:zipcode, :description)
  end

end
