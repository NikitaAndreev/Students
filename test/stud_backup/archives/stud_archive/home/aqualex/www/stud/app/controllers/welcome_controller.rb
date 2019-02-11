class WelcomeController < ApplicationController
  before_action :login_required

  def index
    @group = current_group
    @users = @group.users.students

    @labs = Lesson.labs.for_group(@group.id)
    @practices = Lesson.practices.for_group(@group.id)
    @lab_dates = Lesson.lab_dates.for_group(@group.id)
    @practice_dates = Lesson.practice_dates.for_group(@group.id)
  end

  def toggle_can_register
    @group = Group.find(params[:group_id])
    @group.toggle! :can_register
    respond_to do |format|
      format.js
    end
  end


end