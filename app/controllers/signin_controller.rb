class SigninController < ApplicationController

  def index
    if current_user
      if current_user.role == "user"
        redirect_to "/seeker"
      end 
      if current_user.role == "admin"
        redirect_to "/"
      end 
    end
  end
end
