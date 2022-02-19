class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :compositions, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_many :memory_lists, dependent: :destroy
  has_many :scores, through: :compositions
  # has_many :flashcards, through: :memory_list
  validates :username, presence: true

  def avg_scores

    return 0 unless compositions.count.positive?
    sum = 0
    counter = compositions.count;
    compositions.each do |composition|
      next if composition.scores.count.zero?
      sum += composition.scores.average(:score).round(2).to_f
    end
    (sum / counter).round(2)
  end
end
