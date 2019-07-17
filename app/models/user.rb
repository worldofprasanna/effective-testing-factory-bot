class User < ApplicationRecord
  belongs_to :role, optional: true
  has_many :articles
  belongs_to :client, optional: true
end
