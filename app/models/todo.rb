class Todo < ApplicationRecord
  scope :uncompleted, -> {
    where(completed: false)
  }
  scope :completed, -> {
    where(completed: true)
  }
end
