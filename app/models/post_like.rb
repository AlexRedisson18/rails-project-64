# frozen_string_literal: true

class PostLike < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_uniqueness_of :user_id, scope: :post_id
end
