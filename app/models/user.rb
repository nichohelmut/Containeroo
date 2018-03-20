class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :containers
  #accepts_nested_attributes_for :containers
  has_many :visits, dependent: :destroy
  validates :first_name, presence: true

end
