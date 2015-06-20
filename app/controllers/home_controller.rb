class HomeController < ApplicationController
  def index
    @user = current_user
    if !@user.setup?
      render 'home/profile_setup'
    else
      render 'home/group_setup'
    end
  end
end
