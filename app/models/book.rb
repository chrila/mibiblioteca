class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :status, presence: true

  enum status [:lent, :in_shelf]
end
