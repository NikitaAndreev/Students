class UsersController <ApplicationController
  before_action :login_required


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit( :family, :name, :last_name)
  end

end