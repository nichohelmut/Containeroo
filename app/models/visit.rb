class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :container
  validates :container, :user, presence: true
end
