class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entities, dependent: :destroy, foreign_key: 'author_id'
  has_many :groups, dependent: :destroy, # foreign_key: 'author_id'

  # rubocop:disable Lint/Syntax
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
