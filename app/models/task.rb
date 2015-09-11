# == Schema Information
#
# Table name: tasks
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  body               :text(65535)      not null
#  submit_user_count  :integer          default(0)
#  training_course_id :integer          not null
#  admin_id           :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Task < ActiveRecord::Base
  belongs_to :training_course
  belongs_to :admin
  has_one :attachment, as: :attachmentable
  has_many :user_tasks, dependent: :destroy
  
  validates :title, presence: true
  validates :training_course_id, presence: true

  #已提交作业人数
  def submitted_count
  	self.training_course.user_training_courses.where(state: true).count - self.user_tasks.count
  end

  #未提交作业人数
  def unsubmitted_count
  	self.user_tasks.count
  end
end
