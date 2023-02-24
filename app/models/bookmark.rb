class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  # validates :movie_id, presence: true
  # validates :list_id, presence: true
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list }
end
