class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:error]= t(:only_admin_content)
      redirect_to root_path
    end
  end

  def admin?
    current_user&.admin?
  end
  helper_method :admin?

  def can_register?
    !Group.where(:can_register => true).empty?
  end
  helper_method :can_register?

  def login_required
    authenticate_user!
  end

  def current_group
    group_id = session[:current_group_id] || Group.live.first.id
    Group.find(group_id)
  end
  helper_method :current_group

end
