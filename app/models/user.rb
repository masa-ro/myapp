class User < ApplicationRecord
    has_many :rentals
    has_many :books, through: :rentals
end
