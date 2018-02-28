class ScommentsController < ApplicationController
  def index
    @scomments = Scomment.page(params[:page]).per(10)

    render("scomments/index.html.erb")
  end

  def show
    @scomment = Scomment.find(params[:id])

    render("scomments/show.html.erb")
  end

  def new
    @scomment = Scomment.new

    render("scomments/new.html.erb")
  end

  def create
    @scomment = Scomment.new

    @scomment.user_id = params[:user_id]
    @scomment.song_id = params[:song_id]
    @scomment.body = params[:body]

    save_status = @scomment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/scomments/new", "/create_scomment"
        redirect_to("/scomments")
      else
        redirect_back(:fallback_location => "/", :notice => "Scomment created successfully.")
      end
    else
      render("scomments/new.html.erb")
    end
  end

  def edit
    @scomment = Scomment.find(params[:id])

    render("scomments/edit.html.erb")
  end

  def update
    @scomment = Scomment.find(params[:id])

    @scomment.user_id = params[:user_id]
    @scomment.song_id = params[:song_id]
    @scomment.body = params[:body]

    save_status = @scomment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/scomments/#{@scomment.id}/edit", "/update_scomment"
        redirect_to("/scomments/#{@scomment.id}", :notice => "Scomment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Scomment updated successfully.")
      end
    else
      render("scomments/edit.html.erb")
    end
  end

  def destroy
    @scomment = Scomment.find(params[:id])

    @scomment.destroy

    if URI(request.referer).path == "/scomments/#{@scomment.id}"
      redirect_to("/", :notice => "Scomment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Scomment deleted.")
    end
  end
end
