class User < ApplicationRecord
  rolify
  has_secure_password

  after_initialize :set_default_role, if: :new_record?

  has_many :appointments
  has_many :services, through: :appointments

  validates :username,
            presence: true,
            uniqueness: true,
            length: { minimum: 4, maximum: 20 },
            format: { with: /\A[a-zA-Z0-9]+\Z/ }

  password_format = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/x

  # rubocop:disable Layout/LineLength
  validates :password,
            presence: true,
            format: { with: password_format,
                      message: '(i)Must contain 8 or more characters, (ii)Must contain a digit, (iii)Must contain a lower case character, (iv)Must contain an upper case character' },
            on: :create
  # rubocop:enable Layout/LineLength

  validates :roles, presence: true

  def set_default_role
    add_role(:normal)
  end
end
