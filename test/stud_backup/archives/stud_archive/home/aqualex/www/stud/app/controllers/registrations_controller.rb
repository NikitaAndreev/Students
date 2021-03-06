class RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  private

  def sign_up_params
    params.require(:user).permit({ group_ids: [] }, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit({:group_ids=>[]}, :email, :password, :password_confirmation, :current_password)
  end

end


