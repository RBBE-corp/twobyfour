class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :compositions, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_many :memory_lists, dependent: :destroy

  validates :username, presence: true
end
