class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :upcoming, -> { where("date >= ?", Time.now.strftime("%Y-%m-%d")) }
  scope :past, -> { where("date < ?", Time.now.strftime("%Y-%m-%d")) }
end
