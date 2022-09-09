class Expense < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :user, foreign_key: 'user_id'
  belongs_to :group, foreign_key: 'group_id'

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true
end
