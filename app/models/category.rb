class Category < ApplicationRecord
    has_ancestry
    has_many :items, dependent: :destroy
    validates :category,presence: true
end