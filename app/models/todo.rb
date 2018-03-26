class Todo < ApplicationRecord
  scope :uncompleted, -> {
    where(completed: false)
  }
  scope :completed, -> {
    where(completed: true)
  }

  validates :title, presence: true
end
