class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   validates :name,  presence: true
   validates :password, :password_confirmation, presence: true, length: {minimum: 5, maximum: 120}, on: :create
   validates :email, presence: true, email: true
end
