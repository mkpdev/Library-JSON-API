class Book < ApplicationRecord
  has_many :checkouts
end
