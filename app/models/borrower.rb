class Borrower < ApplicationRecord
  belongs_to :book
  belongs_to :student
  belongs_to :issued_by, class_name: :User, foreign_key: :issued_by_id
end
