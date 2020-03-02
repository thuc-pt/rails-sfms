class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable, :recoverable,
    :rememberable, :validatable, :lockable, :timeoutable, :trackable, :omniauthable
end
