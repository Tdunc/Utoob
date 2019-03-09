class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :movies
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :usernamae, uniqueness: true
  validates :first_name, :last_name, length:{ in: 2..20 }
end
