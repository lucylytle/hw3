class EntriesController < ApplicationController

  def show
    @entry = Entry.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @entry["company_id"]})
    # render entry/show view with details about Place
  end

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
    # render entries/new view with new Entry form
  end

  def create
    # start with a new Entry
    @entry = Entry.new

    # assign user-entered form data to Contact's columns
    @entry["title"] = params["title"]
    @entry["posted_on"] = params["posted_on"]
    @entry["description"] = params["description"]

    # assign relationship between Contact and Company
    @entry["place_id"] = params["place_id"]

    # save Contact row
    @entry.save

    # redirect user
    redirect_to "/places/#{@entry["place_id"]}"
  end

end