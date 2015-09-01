class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # , :confirmable

  has_and_belongs_to_many :accounts
  has_and_belongs_to_many :roles
end
