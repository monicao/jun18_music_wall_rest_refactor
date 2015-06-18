class User < ActiveRecord::Base
 has_many :tracks
 has_many :votes

 validates :email, uniqueness: true, presence: true
 validates :password, presence: true
end
