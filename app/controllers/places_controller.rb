class PlacesController < ApplicationController

def index
  # find all Place rows
  @places = Place.all
end

def show
  # find a Place
  @place = Place.find_by({ "id" => params["id"] })
  # find Entries for the Company
  @entries = Entry.where({ "place_id" => @place["id"] })
  # render place/show view with details about Place
end

def new
  # render view with new Place form
end

def create
  # start with a new Place
  @place = Place.new

  # assign user-entered form data to Place's columns
  @place["name"] = params["name"]

  # save Company row
  @place.save

  # redirect user
  redirect_to "/places"
end

def edit
  # find a Place
  @place = Place.find_by({ "id" => params["id"] })

end

def update
  # find a Place
  @place = Place.find_by({ "id" => params["id"] })

  # assign user-entered form data to Place's columns
  @place["name"] = params["name"]

  # save Company row
  @place.save

  # redirect user
  redirect_to "/places"
end

def destroy
  # find a Place
  @place = Place.find_by({ "id" => params["id"] })

  # destroy Company row
  @place.destroy

  # redirect user
  redirect_to "/places"
end

end
