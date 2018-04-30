class Review < ApplicationRecord
  #belongs_to :user
  belongs_to :container

  validates :content, :rating, presence: true
  validates :rating, inclusion: {in: (1..5).to_a}
  validates :container_id, presence: true
end
