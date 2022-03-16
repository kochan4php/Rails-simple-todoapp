class Todo < ApplicationRecord
  validates :activity, presence: true
end
