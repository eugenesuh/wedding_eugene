class HcommentsController < ApplicationController
  def index
    @q = Hcomment.ransack(params[:q])
    @hcomments = @q.result(:distinct => true).includes(:user, :hotel).page(params[:page]).per(10)

    render("hcomments/index.html.erb")
  end

  def show
    @hcomment = Hcomment.find(params[:id])

    render("hcomments/show.html.erb")
  end

  def new
    @hcomment = Hcomment.new

    render("hcomments/new.html.erb")
  end

  def create
    @hcomment = Hcomment.new

    @hcomment.body = params[:body]
    @hcomment.user_id = params[:user_id]
    @hcomment.hotel_id = params[:hotel_id]

    save_status = @hcomment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hcomments/new", "/create_hcomment"
        redirect_to("/hcomments")
      else
        redirect_back(:fallback_location => "/", :notice => "Hcomment created successfully.")
      end
    else
      render("hcomments/new.html.erb")
    end
  end

  def edit
    @hcomment = Hcomment.find(params[:id])

    render("hcomments/edit.html.erb")
  end

  def update
    @hcomment = Hcomment.find(params[:id])

    @hcomment.body = params[:body]
    @hcomment.user_id = params[:user_id]
    @hcomment.hotel_id = params[:hotel_id]

    save_status = @hcomment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hcomments/#{@hcomment.id}/edit", "/update_hcomment"
        redirect_to("/hcomments/#{@hcomment.id}", :notice => "Hcomment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Hcomment updated successfully.")
      end
    else
      render("hcomments/edit.html.erb")
    end
  end

  def destroy
    @hcomment = Hcomment.find(params[:id])

    @hcomment.destroy

    if URI(request.referer).path == "/hcomments/#{@hcomment.id}"
      redirect_to("/", :notice => "Hcomment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Hcomment deleted.")
    end
  end
end
