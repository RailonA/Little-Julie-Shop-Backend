module Admin
  class SessionsController < Admin::ApplicationController
    def new; end

    def create
      user = User.find_by(username: params[:session][:username].downcase)
      if user&.authenticate(params[:session][:password])
        # Log the user in and redirect to the user's show page.
        log_in user
        redirect_to admin_users_path
      else
        # Create an error message.
        flash[:danger] = 'Invalid username/password' # Not quite right!
        render 'new'
      end
    end

    def destroy
      log_out
      redirect_to admin_root_path
    end
  end
end
