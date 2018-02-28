class AccomodationsController < ApplicationController
  def index
    @accomodations = Accomodation.all

    render("accomodations/index.html.erb")
  end

  def show
    @accomodation = Accomodation.find(params[:id])

    render("accomodations/show.html.erb")
  end

  def new
    @accomodation = Accomodation.new

    render("accomodations/new.html.erb")
  end

  def create
    @accomodation = Accomodation.new

    @accomodation.name = params[:name]
    @accomodation.category = params[:category]
    @accomodation.zip = params[:zip]
    @accomodation.body = params[:body]
    @accomodation.code = params[:code]
    @accomodation.user_id = params[:user_id]

    save_status = @accomodation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/accomodations/new", "/create_accomodation"
        redirect_to("/accomodations")
      else
        redirect_back(:fallback_location => "/", :notice => "Accomodation created successfully.")
      end
    else
      render("accomodations/new.html.erb")
    end
  end

  def edit
    @accomodation = Accomodation.find(params[:id])

    render("accomodations/edit.html.erb")
  end

  def update
    @accomodation = Accomodation.find(params[:id])

    @accomodation.name = params[:name]
    @accomodation.category = params[:category]
    @accomodation.zip = params[:zip]
    @accomodation.body = params[:body]
    @accomodation.code = params[:code]
    @accomodation.user_id = params[:user_id]

    save_status = @accomodation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/accomodations/#{@accomodation.id}/edit", "/update_accomodation"
        redirect_to("/accomodations/#{@accomodation.id}", :notice => "Accomodation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Accomodation updated successfully.")
      end
    else
      render("accomodations/edit.html.erb")
    end
  end

  def destroy
    @accomodation = Accomodation.find(params[:id])

    @accomodation.destroy

    if URI(request.referer).path == "/accomodations/#{@accomodation.id}"
      redirect_to("/", :notice => "Accomodation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Accomodation deleted.")
    end
  end
end
