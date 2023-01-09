class Product < ApplicationRecord
    has_many :order_items
    has_many :assignments
    validates :title, :price, presence: true

    accepts_nested_attributes_for :assignments
    has_many :colors, through: :assignments
end
