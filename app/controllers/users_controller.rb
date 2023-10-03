class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index" })
  end

  def show
    the_username = params.fetch("path_username")
    @the_user = User.where({ :username => the_username })
  
    render({ :template => "user_templates/show" })
  end

  def create
    # the_user = params.fetch("path_id")
    
    # if the_user.valid?
    #   redirect_to("/users/#{the_user.id}", { :notice => "User created successfully."})
    # else
    #   redirect_to("/users", { :notice => "User failed to create successfully."})
  end
end
