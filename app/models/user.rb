class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PHONE_REGEX = /\A\d{10}\Z/

  validates_format_of :phone, with: PHONE_REGEX
  validates :phone, length: { is: 10 }
  validates_presence_of :first_name, :last_name, :phone
  has_many :posts

  def full_name
    "#{last_name.capitalize}, #{first_name.capitalize}"
  end
end
