class Group < ApplicationRecord

  has_many :user_groups, dependent: :destroy
  has_many :messages
  has_many :users, through: :user_groups

  validates :name, presence: true

  def get_lastest_message
    if messages.blank?
      "まだメッセージはありません。"
    else
      if messages.last.image?
        "画像が投稿されています。"
      else
        messages.last.text
      end
    end
  end
end
