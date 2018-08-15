class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email

  has_many :tasks
end
