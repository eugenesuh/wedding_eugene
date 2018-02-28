class AcommentsController < ApplicationController
  def index
    @acomments = Acomment.all

    render("acomments/index.html.erb")
  end

  def show
    @acomment = Acomment.find(params[:id])

    render("acomments/show.html.erb")
  end

  def new
    @acomment = Acomment.new

    render("acomments/new.html.erb")
  end

  def create
    @acomment = Acomment.new

    @acomment.user_id = params[:user_id]
    @acomment.activity_id = params[:activity_id]
    @acomment.body = params[:body]

    save_status = @acomment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/acomments/new", "/create_acomment"
        redirect_to("/acomments")
      else
        redirect_back(:fallback_location => "/", :notice => "Acomment created successfully.")
      end
    else
      render("acomments/new.html.erb")
    end
  end

  def edit
    @acomment = Acomment.find(params[:id])

    render("acomments/edit.html.erb")
  end

  def update
    @acomment = Acomment.find(params[:id])

    @acomment.user_id = params[:user_id]
    @acomment.activity_id = params[:activity_id]
    @acomment.body = params[:body]

    save_status = @acomment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/acomments/#{@acomment.id}/edit", "/update_acomment"
        redirect_to("/acomments/#{@acomment.id}", :notice => "Acomment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Acomment updated successfully.")
      end
    else
      render("acomments/edit.html.erb")
    end
  end

  def destroy
    @acomment = Acomment.find(params[:id])

    @acomment.destroy

    if URI(request.referer).path == "/acomments/#{@acomment.id}"
      redirect_to("/", :notice => "Acomment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Acomment deleted.")
    end
  end
end
