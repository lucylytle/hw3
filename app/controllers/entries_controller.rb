class EntriesController < ApplicationController

  def index
    # find all Entry rows
    @entries = Entry.all
    
  end
  
  def show
    # find an Entry
    @entry = Entry.find_by({ "id" => params["id"] })
    # find Contacts for the Company
    @contacts = Contact.where({ "company_id" => @company["id"] })
    # render companies/show view with details about Company
  end

  def new
    # render view with new Company form
  end

  def create
    # start with a new Company
    @company = Company.new

    # assign user-entered form data to Company's columns
    @company["name"] = params["name"]
    @company["city"] = params["city"]
    @company["state"] = params["state"]

    # save Company row
    @company.save

    # redirect user
    redirect_to "/companies"
  end

  def edit
    # find a Company
    @company = Company.find_by({ "id" => params["id"] })
    # render view with edit Company form
  end

  def update
    # find a Company
    @company = Company.find_by({ "id" => params["id"] })

    # assign user-entered form data to Company's columns
    @company["name"] = params["name"]
    @company["city"] = params["city"]
    @company["state"] = params["state"]

    # save Company row
    @company.save

    # redirect user
    redirect_to "/companies"
  end

  def destroy
    # find a Company
    @company = Company.find_by({ "id" => params["id"] })

    # destroy Company row
    @company.destroy

    # redirect user
    redirect_to "/companies"
  end

end