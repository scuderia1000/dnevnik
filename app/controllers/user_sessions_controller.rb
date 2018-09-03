class UserSessionsController < ApplicationController

  skip_before_action :require_login, only: [:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:iin], params[:password])
      role_selector = RoleSelector.new
      role_selector
          .on(:multirole) { redirect_to multirole_path }
          .on(:administrator) { redirect_to administrator_path }
          .on(:student) { redirect_to student_path }
          .on(:custodian) { redirect_to custodian_path }
          .on(:none) { redirect_to no_role_path }
      role_selector.call(@user.roles)
      # redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
