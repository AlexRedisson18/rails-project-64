# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 50 }
end
