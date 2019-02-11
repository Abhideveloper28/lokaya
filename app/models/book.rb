class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_one :book_detail
  has_many :borrowers
end
