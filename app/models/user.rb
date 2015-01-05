class User < ActiveRecord::Base
  validates :name, :email,  presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true


  has_many :job_offers
end
