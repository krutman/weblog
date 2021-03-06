class User < ApplicationRecord
  authenticates_with_sorcery!
  
  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
