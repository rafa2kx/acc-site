class UsersController  < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    User.transaction do
      begin
        @user = User.create(user_params)

        return redirect_to request.referer, alert: {success: 'Usuario guardado satisfactoriamente'}
      rescue Exception => e
        @error = e.message
        render(file: 'public/500.html')
        raise ActiveRecord::Rollback, @error
      end
    end
  end
  def user_params
    params.permit(user:[:nickname, :password, :email, :name])[:user]
  end
end