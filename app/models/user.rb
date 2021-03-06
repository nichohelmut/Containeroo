# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :containers, dependent: :destroy
  has_many :reviews
  # accepts_nested_attributes_for :containers
  has_many :visits, dependent: :destroy
  # validates :first_name, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :email, presence: false, allow_blank: true

  after_validation :reverse_geocode
end
