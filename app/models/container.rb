# frozen_string_literal: true

class Container < ApplicationRecord
  belongs_to :user
  has_many :visits, dependent: :destroy
  validates :product_category, inclusion: { in: %w[vegetables meats fruits bread dairy
                                                   liquid beer cans ingredients starchy] }
  # validates :address, presence: true
  validates :supermarket, inclusion: { in: %w[Restaurant Edeka Aldi Real Metro Lidl Spar Netto Plus TanteEmma] }
  geocoded_by :address
  mount_uploader :photo, PhotoUploader
  reverse_geocoded_by :latitude, :longitude, address: :address
  after_validation :reverse_geocode
  after_validation :geocode, if: :will_save_change_to_address?

      # attr_accessor :raw_address

      # geocoded_by :raw_address
      # after_validation -> {
      #   self.address = self.raw_address
      #   geocode
      #   }, if: ->(obj){ obj.raw_address.present? and obj.raw_address != obj.address }

      #   after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
      #   after_validation :reverse_geocode, unless: ->(obj) { obj.address.present? },
      #   if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
    end
