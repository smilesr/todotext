class Task < ActiveRecord::Base
  belongs_to :user
  # default_scope -> { order(created_at: :desc)}
  default_scope -> { order(due_date: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

end
