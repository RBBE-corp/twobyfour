class Instrumental < ApplicationRecord
  has_many :compositions
  validates :title, :artist, :genre, presence: true
  validates :duration, :bpm, numericality: true
  validate  :duration_cannot_be_less_than_eight_seconds,
            :bpm_between_forty_and_two_hundred

  def duration_cannot_be_less_than_eight_seconds
    if duration.present? && duration < 8
      errors.add(:duration, "can't be less than 8 seconds long")
    end
  end

  def bpm_between_forty_and_two_hundred
    if bpm.present? && !(bpm > 40 && bpm < 200)
      return errors.add(:bpm, "can't be less than 40bpm or more than 200bpm")
    end
  end
end
