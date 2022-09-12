class HomeController < ApplicationController
  layout 'standard'
    def index
        @user = current_user
        redirect_to "/signin" if not current_user

        if current_user
          if current_user.role == "user"
            redirect_to "/seeker"
          end  
        end 
    end
end
