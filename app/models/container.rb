class Container < ApplicationRecord
  belongs_to :user
  has_many :users, through: :visits
  has_many :visits, dependent: :destroy
  validates :product_category, inclusion: { in: %w(vegetables meats fruits bread dairy liquid beer cans ingredients starchy)}
  #validates :address, presence: true
  validates :supermarket, inclusion: { in: %w(Restaurant Edeka Aldi Real Metro Lidl Spar Netto Plus TanteEmma)}
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
