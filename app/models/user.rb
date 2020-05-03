class User < ApplicationRecord
  enum role: [:standard, :student, :teacher, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= 0
    end
  end
  

  # encrypt password
  has_secure_password

  # Model associations
  has_many :todos, foreign_key: :created_by
  
  # Validations
  validates_presence_of :name, :email, :password_digest
  
end