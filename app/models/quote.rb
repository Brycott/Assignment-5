class Quote < ApplicationRecord
  after_initialize :init

  def init
    self.votes_count ||= 0
  end
end
