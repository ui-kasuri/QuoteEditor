class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable,
  #  :recoverable, :rememberable, :registerable
  belongs_to :company

  devise :database_authenticatable, :validatable

  def name
    email.split("@").first.capitalize
  end
end
