class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :upcoming, -> { where("date >= ?", Time.now.strftime("%Y-%m-%d")).order(date: :asc) }
  scope :past, -> { where("date < ?", Time.now.strftime("%Y-%m-%d")).order(date: :desc) }
end
