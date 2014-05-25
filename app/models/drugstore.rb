class Drugstore < ActiveRecord::Base
  has_many :Medicaments
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
