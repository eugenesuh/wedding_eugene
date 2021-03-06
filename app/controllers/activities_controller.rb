class ActivitiesController < ApplicationController
  def index
    @q = Activity.ransack(params[:q])
    @activities = @q.result(:distinct => true).includes(:user, :bookmarks, :acomments).page(params[:page]).per(10)

    render("activities/index.html.erb")
  end

  def show
    @acomment = Acomment.new
    @alike = Alike.new
    @activity = Activity.find(params[:id])

    render("activities/show.html.erb")
  end

  def new
    @activity = Activity.new

    render("activities/new.html.erb")
  end

  def create
    @activity = Activity.new

    @activity.title = params[:title]
    @activity.description = params[:description]
    @activity.user_id = params[:user_id]
    @activity.image = params[:image]

    save_status = @activity.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/activities/new", "/create_activity"
        redirect_to("/activities")
      else
        redirect_back(:fallback_location => "/", :notice => "Activity created successfully.")
      end
    else
      render("activities/new.html.erb")
    end
  end

  def edit
    @activity = Activity.find(params[:id])

    render("activities/edit.html.erb")
  end

  def update
    @activity = Activity.find(params[:id])

    @activity.title = params[:title]
    @activity.description = params[:description]
    @activity.user_id = params[:user_id]
    @activity.image = params[:image]

    save_status = @activity.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/activities/#{@activity.id}/edit", "/update_activity"
        redirect_to("/activities/#{@activity.id}", :notice => "Activity updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Activity updated successfully.")
      end
    else
      render("activities/edit.html.erb")
    end
  end

  def destroy
    @activity = Activity.find(params[:id])

    @activity.destroy

    if URI(request.referer).path == "/activities/#{@activity.id}"
      redirect_to("/", :notice => "Activity deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Activity deleted.")
    end
  end
end
