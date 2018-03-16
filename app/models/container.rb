class Container < ApplicationRecord
  belongs_to :user
  has_many :users, through: :visits
  has_many :visits
  validates :product_category, inclusion: { in: %w(vegetables meats fruits bread dairy liquid beer cans ingredients starchy)}
  validates :address, presence: true
  validates :supermarket, inclusion: { in: %w(HIT Rewe Edeka Aldi Real Metro Lidl Spar Netto Plus TanteEmma)}

end
