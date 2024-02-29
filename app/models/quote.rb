class Quote < ApplicationRecord
  after_initialize :init

  validates :year, numericality: { only_integer: true, allow_blank: true, greater_than_or_equal_to: 1800, less_than_or_equal_to: Date.current.year }
   validates :saying, presence: true
  validates :said_by, presence: true

  def init
    self.votes_count ||= 0
  end
end
