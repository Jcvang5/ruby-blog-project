# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :articles

  validates :name, presence: true, uniqueness: true

  def article_count
    articles.count
  end
end
