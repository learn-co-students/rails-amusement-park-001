class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  validates :name, presence: true


  def mood
    if self.happiness - self.nausea > 0
      "happy"
    else
      "sad"
    end
  end
end
