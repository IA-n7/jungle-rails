class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates :rating,  inclusion: 0..5
  validates :description, presence: true

end
