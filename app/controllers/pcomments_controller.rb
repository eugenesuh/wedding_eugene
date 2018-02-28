class PcommentsController < ApplicationController
  def index
    @q = Pcomment.ransack(params[:q])
    @pcomments = @q.result(:distinct => true).includes(:user, :photo).page(params[:page]).per(10)

    render("pcomments/index.html.erb")
  end

  def show
    @pcomment = Pcomment.find(params[:id])

    render("pcomments/show.html.erb")
  end

  def new
    @pcomment = Pcomment.new

    render("pcomments/new.html.erb")
  end

  def create
    @pcomment = Pcomment.new

    @pcomment.user_id = params[:user_id]
    @pcomment.photo_id = params[:photo_id]
    @pcomment.body = params[:body]

    save_status = @pcomment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pcomments/new", "/create_pcomment"
        redirect_to("/pcomments")
      else
        redirect_back(:fallback_location => "/", :notice => "Pcomment created successfully.")
      end
    else
      render("pcomments/new.html.erb")
    end
  end

  def edit
    @pcomment = Pcomment.find(params[:id])

    render("pcomments/edit.html.erb")
  end

  def update
    @pcomment = Pcomment.find(params[:id])

    @pcomment.user_id = params[:user_id]
    @pcomment.photo_id = params[:photo_id]
    @pcomment.body = params[:body]

    save_status = @pcomment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pcomments/#{@pcomment.id}/edit", "/update_pcomment"
        redirect_to("/pcomments/#{@pcomment.id}", :notice => "Pcomment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Pcomment updated successfully.")
      end
    else
      render("pcomments/edit.html.erb")
    end
  end

  def destroy
    @pcomment = Pcomment.find(params[:id])

    @pcomment.destroy

    if URI(request.referer).path == "/pcomments/#{@pcomment.id}"
      redirect_to("/", :notice => "Pcomment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Pcomment deleted.")
    end
  end
end
