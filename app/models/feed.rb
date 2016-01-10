class Feed < ActiveRecord::Base
  validates :title, uniqueness:true
  
  has_many :users, through: :favorites
  has_many :favorites, dependent: :destroy
end
