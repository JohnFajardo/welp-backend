class Review < ApplicationRecord
    belongs_to :location
    belongs_to :user
    has_many :likes
    has_one_attached :review_pic

    validates :score, numericality: true
    validates :score, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
end
