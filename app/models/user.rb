class User < ApplicationRecord
  belongs_to :role, optional: true
  has_many :articles
end
