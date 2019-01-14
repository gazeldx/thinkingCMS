class Book < ApplicationRecord
  belongs_to :writer

  validates :name, presence: true, length: { minimum: 2, maximum: 199 }
  validates :writer, presence: true
end
