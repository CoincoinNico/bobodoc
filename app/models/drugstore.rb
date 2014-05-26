class Drugstore < ActiveRecord::Base
  has_many :stocks
  has_many :medicaments, :through => :stocks
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  # attr_accessible :stock_list
  # acts_as_taggable_on :stocks
  # accepts_nested_attributes_for :medicaments, :reject_if => :all_blank, :allow_destroy => true
  # accepts_nested_attributes_for :stocks, :reject_if => :all_blank, :allow_destroy => true
end
