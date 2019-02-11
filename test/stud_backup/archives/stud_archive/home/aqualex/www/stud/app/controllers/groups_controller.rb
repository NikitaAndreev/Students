class GroupsController < ApplicationController
  before_action :login_required

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.save!
    session[:current_group_id] = @group.id
    redirect_to root_path
  end

  def select
    @group = Group.find(params[:cur_group])
    session[:current_group_id] = @group.id
    redirect_to root_path
  end



  private

  def group_params
    params.require(:group).permit( :number, :desc, :archive)
  end

end