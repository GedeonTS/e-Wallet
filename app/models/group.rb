class Group < ApplicationRecord
  mount_uploader :icon, IconUploader

  belongs_to :user, foreign_key: 'user_id'
  has_many :expenses, foreign_key: 'group_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true

  def self.icons
    {
      default: 'default.png'
    }
  end
end
