class Article < ApplicationRecord
  validates :slug, presence: true, uniqueness: true
end
