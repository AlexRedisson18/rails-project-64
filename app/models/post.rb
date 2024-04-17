# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'

  validates :title, :body, presence: true
  validates :title, length: { minimum: 5, maximum: 255 }
  validates :body, length: { minimum: 200, maximum: 4000 }
end
