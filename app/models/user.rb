class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    return user if user && (user.password == password)
    nil
  end
end
