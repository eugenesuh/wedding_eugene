class PlikesController < ApplicationController
  def index
    @q = Plike.ransack(params[:q])
    @plikes = @q.result(:distinct => true).includes(:user, :photo).page(params[:page]).per(10)

    render("plikes/index.html.erb")
  end

  def show
    @plike = Plike.find(params[:id])

    render("plikes/show.html.erb")
  end

  def new
    @plike = Plike.new

    render("plikes/new.html.erb")
  end

  def create
    @plike = Plike.new

    @plike.user_id = params[:user_id]
    @plike.photo_id = params[:photo_id]

    save_status = @plike.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/plikes/new", "/create_plike"
        redirect_to("/plikes")
      else
        redirect_back(:fallback_location => "/", :notice => "Plike created successfully.")
      end
    else
      render("plikes/new.html.erb")
    end
  end

  def edit
    @plike = Plike.find(params[:id])

    render("plikes/edit.html.erb")
  end

  def update
    @plike = Plike.find(params[:id])

    @plike.user_id = params[:user_id]
    @plike.photo_id = params[:photo_id]

    save_status = @plike.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/plikes/#{@plike.id}/edit", "/update_plike"
        redirect_to("/plikes/#{@plike.id}", :notice => "Plike updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Plike updated successfully.")
      end
    else
      render("plikes/edit.html.erb")
    end
  end

  def destroy
    @plike = Plike.find(params[:id])

    @plike.destroy

    if URI(request.referer).path == "/plikes/#{@plike.id}"
      redirect_to("/", :notice => "Plike deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Plike deleted.")
    end
  end
end
