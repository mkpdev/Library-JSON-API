class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status: ["assigned", "return"]
end
