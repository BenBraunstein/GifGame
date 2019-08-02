class User < ApplicationRecord
  
  has_secure_password
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password_digest, presence: true


  has_many :games

  def played?(game_form)
    self.games.collect { |game| game.game_form }.include? game_form
  end
end
