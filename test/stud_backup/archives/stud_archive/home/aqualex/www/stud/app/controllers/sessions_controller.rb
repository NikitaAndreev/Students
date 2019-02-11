class SessionsController < Devise::SessionsController
  after_filter :after_login, :only => :create

  private
  def after_login
    group = current_user.groups.first
    session[:group_id] = group.id if group
  end
end


