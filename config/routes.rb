Rails.application.routes.draw do
  # Routes for the Accomodation resource:
  # CREATE
  get "/accomodations/new", :controller => "accomodations", :action => "new"
  post "/create_accomodation", :controller => "accomodations", :action => "create"

  # READ
  get "/accomodations", :controller => "accomodations", :action => "index"
  get "/accomodations/:id", :controller => "accomodations", :action => "show"

  # UPDATE
  get "/accomodations/:id/edit", :controller => "accomodations", :action => "edit"
  post "/update_accomodation/:id", :controller => "accomodations", :action => "update"

  # DELETE
  get "/delete_accomodation/:id", :controller => "accomodations", :action => "destroy"
  #------------------------------

  # Routes for the Acomment resource:
  # CREATE
  get "/acomments/new", :controller => "acomments", :action => "new"
  post "/create_acomment", :controller => "acomments", :action => "create"

  # READ
  get "/acomments", :controller => "acomments", :action => "index"
  get "/acomments/:id", :controller => "acomments", :action => "show"

  # UPDATE
  get "/acomments/:id/edit", :controller => "acomments", :action => "edit"
  post "/update_acomment/:id", :controller => "acomments", :action => "update"

  # DELETE
  get "/delete_acomment/:id", :controller => "acomments", :action => "destroy"
  #------------------------------

  # Routes for the Alike resource:
  # CREATE
  get "/alikes/new", :controller => "alikes", :action => "new"
  post "/create_alike", :controller => "alikes", :action => "create"

  # READ
  get "/alikes", :controller => "alikes", :action => "index"
  get "/alikes/:id", :controller => "alikes", :action => "show"

  # UPDATE
  get "/alikes/:id/edit", :controller => "alikes", :action => "edit"
  post "/update_alike/:id", :controller => "alikes", :action => "update"

  # DELETE
  get "/delete_alike/:id", :controller => "alikes", :action => "destroy"
  #------------------------------

  # Routes for the Scomment resource:
  # CREATE
  get "/scomments/new", :controller => "scomments", :action => "new"
  post "/create_scomment", :controller => "scomments", :action => "create"

  # READ
  get "/scomments", :controller => "scomments", :action => "index"
  get "/scomments/:id", :controller => "scomments", :action => "show"

  # UPDATE
  get "/scomments/:id/edit", :controller => "scomments", :action => "edit"
  post "/update_scomment/:id", :controller => "scomments", :action => "update"

  # DELETE
  get "/delete_scomment/:id", :controller => "scomments", :action => "destroy"
  #------------------------------

  # Routes for the Slike resource:
  # CREATE
  get "/slikes/new", :controller => "slikes", :action => "new"
  post "/create_slike", :controller => "slikes", :action => "create"

  # READ
  get "/slikes", :controller => "slikes", :action => "index"
  get "/slikes/:id", :controller => "slikes", :action => "show"

  # UPDATE
  get "/slikes/:id/edit", :controller => "slikes", :action => "edit"
  post "/update_slike/:id", :controller => "slikes", :action => "update"

  # DELETE
  get "/delete_slike/:id", :controller => "slikes", :action => "destroy"
  #------------------------------

  # Routes for the Song resource:
  # CREATE
  get "/songs/new", :controller => "songs", :action => "new"
  post "/create_song", :controller => "songs", :action => "create"

  # READ
  get "/songs", :controller => "songs", :action => "index"
  get "/songs/:id", :controller => "songs", :action => "show"

  # UPDATE
  get "/songs/:id/edit", :controller => "songs", :action => "edit"
  post "/update_song/:id", :controller => "songs", :action => "update"

  # DELETE
  get "/delete_song/:id", :controller => "songs", :action => "destroy"
  #------------------------------

  # Routes for the Activity resource:
  # CREATE
  get "/activities/new", :controller => "activities", :action => "new"
  post "/create_activity", :controller => "activities", :action => "create"

  # READ
  get "/activities", :controller => "activities", :action => "index"
  get "/activities/:id", :controller => "activities", :action => "show"

  # UPDATE
  get "/activities/:id/edit", :controller => "activities", :action => "edit"
  post "/update_activity/:id", :controller => "activities", :action => "update"

  # DELETE
  get "/delete_activity/:id", :controller => "activities", :action => "destroy"
  #------------------------------

  # Routes for the Guest resource:
  # CREATE
  get "/guests/new", :controller => "guests", :action => "new"
  post "/create_guest", :controller => "guests", :action => "create"

  # READ
  get "/guests", :controller => "guests", :action => "index"
  get "/guests/:id", :controller => "guests", :action => "show"

  # UPDATE
  get "/guests/:id/edit", :controller => "guests", :action => "edit"
  post "/update_guest/:id", :controller => "guests", :action => "update"

  # DELETE
  get "/delete_guest/:id", :controller => "guests", :action => "destroy"
  #------------------------------

  # Routes for the Photo resource:
  # CREATE
  get "/photos/new", :controller => "photos", :action => "new"
  post "/create_photo", :controller => "photos", :action => "create"

  # READ
  get "/photos", :controller => "photos", :action => "index"
  get "/photos/:id", :controller => "photos", :action => "show"

  # UPDATE
  get "/photos/:id/edit", :controller => "photos", :action => "edit"
  post "/update_photo/:id", :controller => "photos", :action => "update"

  # DELETE
  get "/delete_photo/:id", :controller => "photos", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
