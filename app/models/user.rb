class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:admin, :manager]

  has_many :borrowers, class_name: 'Borrower', primary_key: 'id', foreign_key: 'issued_by_user'
end
