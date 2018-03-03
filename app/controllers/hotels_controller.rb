class HotelsController < ApplicationController
  def index
    @q = Hotel.ransack(params[:q])
    @hotels = @q.result(:distinct => true).includes(:user, :hcomments).page(params[:page]).per(10)

    render("hotels/index.html.erb")
  end

  def show
    @hcomment = Hcomment.new
    @hotel = Hotel.find(params[:id])

    render("hotels/show.html.erb")
  end

  def new
    @hotel = Hotel.new

    render("hotels/new.html.erb")
  end

  def create
    @hotel = Hotel.new

    @hotel.name = params[:name]
    @hotel.airbnb_ind = params[:airbnb_ind]
    @hotel.user_id = params[:user_id]
    @hotel.zip = params[:zip]
    @hotel.body = params[:body]

    save_status = @hotel.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hotels/new", "/create_hotel"
        redirect_to("/hotels")
      else
        redirect_back(:fallback_location => "/", :notice => "Hotel created successfully.")
      end
    else
      render("hotels/new.html.erb")
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])

    render("hotels/edit.html.erb")
  end

  def update
    @hotel = Hotel.find(params[:id])

    @hotel.name = params[:name]
    @hotel.airbnb_ind = params[:airbnb_ind]
    @hotel.user_id = params[:user_id]
    @hotel.zip = params[:zip]
    @hotel.body = params[:body]

    save_status = @hotel.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hotels/#{@hotel.id}/edit", "/update_hotel"
        redirect_to("/hotels/#{@hotel.id}", :notice => "Hotel updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Hotel updated successfully.")
      end
    else
      render("hotels/edit.html.erb")
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])

    @hotel.destroy

    if URI(request.referer).path == "/hotels/#{@hotel.id}"
      redirect_to("/", :notice => "Hotel deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Hotel deleted.")
    end
  end
end
