class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index" })
  end

  def show
    the_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => the_username }).first
  
    if matching_usernames == nil
      redirect_to("/404")
    else
      @the_user =  matching_usernames
      render({ :template => "user_templates/show" })
    end
  end

  def create
    new_user = User.new
    new_user.username = params.fetch("input_username")
    
    if new_user.valid?
      new_user.save
      redirect_to("/users/#{new_user.username}", { :notice => "User created successfully."})
    else
      redirect_to("/users", { :notice => "User failed to create successfully."})
    end
  end

  def update
    the_user_id = params.fetch("path_id")
    matching_users = User.where({ :id => the_user_id })
    the_user = matching_users.first
    
    the_user.username = params.fetch("input_username")
    
    if the_user.valid?
      the_user.save
      redirect_to("/users/#{the_user.username}", { :notice => "User created successfully."})
    else
      redirect_to("/users", { :notice => "User failed to create successfully."})
    end
  end
end
