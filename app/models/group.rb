class Group < ApplicationRecord

  has_many :user_groups, dependent: :destroy
  has_many :messages
  has_many :users, through: :user_groups

end
