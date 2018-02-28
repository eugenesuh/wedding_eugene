class SlikesController < ApplicationController
  def index
    @q = Slike.ransack(params[:q])
    @slikes = @q.result(:distinct => true).includes(:user, :song).page(params[:page]).per(10)

    render("slikes/index.html.erb")
  end

  def show
    @slike = Slike.find(params[:id])

    render("slikes/show.html.erb")
  end

  def new
    @slike = Slike.new

    render("slikes/new.html.erb")
  end

  def create
    @slike = Slike.new

    @slike.user_id = params[:user_id]
    @slike.song_id = params[:song_id]

    save_status = @slike.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/slikes/new", "/create_slike"
        redirect_to("/slikes")
      else
        redirect_back(:fallback_location => "/", :notice => "Slike created successfully.")
      end
    else
      render("slikes/new.html.erb")
    end
  end

  def edit
    @slike = Slike.find(params[:id])

    render("slikes/edit.html.erb")
  end

  def update
    @slike = Slike.find(params[:id])

    @slike.user_id = params[:user_id]
    @slike.song_id = params[:song_id]

    save_status = @slike.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/slikes/#{@slike.id}/edit", "/update_slike"
        redirect_to("/slikes/#{@slike.id}", :notice => "Slike updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Slike updated successfully.")
      end
    else
      render("slikes/edit.html.erb")
    end
  end

  def destroy
    @slike = Slike.find(params[:id])

    @slike.destroy

    if URI(request.referer).path == "/slikes/#{@slike.id}"
      redirect_to("/", :notice => "Slike deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Slike deleted.")
    end
  end
end
