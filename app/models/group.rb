class Group < ApplicationRecord

  has_many :user_groups, dependent: :destroy
  has_many :messages
  has_many :users, through: :user_groups

  validates :name, presence: true

  def get_lastest_message
    if messages.blank?
      "まだメッセージはありません。"
    else
      messages.last.text
    end
  end
end
