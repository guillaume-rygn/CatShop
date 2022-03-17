module Admin

    class ApplicationController < ::ApplicationController
        

        before_action :only_admin
        
        private

        def only_admin

            if user_signed_in? === false 
                redirect_to root_path, danger: "You are not connected"
            end

            if user_signed_in? === true && current_user.is_admin === false
                redirect_to root_path, danger: "You are not admin"
            end

            
        end

    end

end
