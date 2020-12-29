class Book < ApplicationRecord
    validates :title, presence: true
    validates :price, numericality: {only_integer: true}

    has_many :rentals
    has_many :users, through: :rentals
end
