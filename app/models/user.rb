class User < ApplicationRecord
  has_secure_password
  has_many:meetings,dependent: :destroy
end
