class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  # has_and_belongs_to_many :groups
  has_many :entities_group_to_joins, dependent: :destroy
  has_many :groups, through: :entities_group_to_joins

  validates :name, presence: true
  validates :amount,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, message: 'Amount must be a number' }
end

# business
