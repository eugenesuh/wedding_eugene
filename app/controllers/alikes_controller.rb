class AlikesController < ApplicationController
  before_action :current_user_must_be_alike_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_alike_user
    alike = Alike.find(params[:id])

    unless current_user == alike.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @alikes = Alike.all

    render("alikes/index.html.erb")
  end

  def show
    @alike = Alike.find(params[:id])

    render("alikes/show.html.erb")
  end

  def new
    @alike = Alike.new

    render("alikes/new.html.erb")
  end

  def create
    @alike = Alike.new

    @alike.user_id = params[:user_id]
    @alike.activity_id = params[:activity_id]

    save_status = @alike.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/alikes/new", "/create_alike"
        redirect_to("/alikes")
      else
        redirect_back(:fallback_location => "/", :notice => "Alike created successfully.")
      end
    else
      render("alikes/new.html.erb")
    end
  end

  def edit
    @alike = Alike.find(params[:id])

    render("alikes/edit.html.erb")
  end

  def update
    @alike = Alike.find(params[:id])
    @alike.activity_id = params[:activity_id]

    save_status = @alike.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/alikes/#{@alike.id}/edit", "/update_alike"
        redirect_to("/alikes/#{@alike.id}", :notice => "Alike updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Alike updated successfully.")
      end
    else
      render("alikes/edit.html.erb")
    end
  end

  def destroy
    @alike = Alike.find(params[:id])

    @alike.destroy

    if URI(request.referer).path == "/alikes/#{@alike.id}"
      redirect_to("/", :notice => "Alike deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Alike deleted.")
    end
  end
end
