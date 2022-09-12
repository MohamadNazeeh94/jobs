class SeekerController < ApplicationController
    layout 'standard'
    def index
        @user = current_user
        redirect_to "/signin" if not current_user

        if current_user
            if current_user.role == "admin"
              redirect_to "/"
            end  
          end 
    end
end
