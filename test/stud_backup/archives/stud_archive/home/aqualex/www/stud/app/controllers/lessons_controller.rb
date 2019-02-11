class LessonsController < ApplicationController
  before_action :login_required

  def new
    @lesson = Lesson.new
  end

  def create
    task = Task.find(params[:lesson][:task_id])
    if params[:lesson][:user_id]
      lesson = Lesson.new(lesson_params)
      lesson.lesson_type = task.task_type
      lesson.save!
    else
      @students = current_group.users.students
      @students.each do |s|
        lesson = Lesson.new(lesson_params)
        lesson.user = s
        lesson.lesson_type = task.task_type
        lesson.save!
      end
    end
    redirect_to root_path
  end

  def set_visit
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.visited = params[:value]=='true'
    @lesson.save!
    respond_to do |format|
      format.js
    end
  end

  def set_result
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.result = params[:value]
    @lesson.visited = true
    @lesson.save!
    respond_to do |format|
      format.js
    end
  end

  def edit_by_date
    @task = Lesson.where(lesson_date: params[:date]).first.task

    @students = current_group.users.students
    @students.each do |s|
      lesson = s.lessons.find_by_lesson_date(params[:date])
      if lesson.blank?
        lesson = Lesson.new(lesson_date: params[:date], lesson_type: @task.task_type)
        lesson.user = s
        lesson.lesson_type = @task.task_type
        lesson.save!

      end
    end
    redirect_to root_path
  end

  def delete_by_date
    lessons = Lesson.for_group(current_group.id).where(lesson_date: params[:date])
    lessons.delete_all
    redirect_to root_path
  end

  def new_user
    @user = User.find(params[:id])
    @lesson = @user.lessons.new

  end


  private

  def lesson_params
    params.require(:lesson).permit(:user_id, :task_id, :lesson_date, :lesson_type)
  end

end