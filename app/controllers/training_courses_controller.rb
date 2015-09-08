class TrainingCoursesController < BaseController
  def index
  	@training_courses = TrainingCourse.all.page(params[:page]).per(15)
  end

  def show
  	@training_course = TrainingCourse.find(params[:id])
    #读取通过审核的报名对象
    @user_training_courses = UserTrainingCourse.where(training_course_id: @training_course.id, state: true)
  	if current_user.present?
  	  @present_user_training_course = UserTrainingCourse.where(user_id: current_user.id, training_course_id: @training_course.id).first
  	end
  end

  def list
  end
end
