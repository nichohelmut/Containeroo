class Container < ApplicationRecord
  belongs_to :user
  has_many :visits, dependent: :destroy
  validates :product_category, inclusion: { in: %w(vegetables meats fruits bread dairy liquid beer cans ingredients starchy)}
  validates :address, presence: true
  validates :supermarket, inclusion: { in: %w(HIT Rewe Edeka Aldi Real Metro Lidl Spar Netto Plus TanteEmma)}

end
