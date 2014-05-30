class Drugstore < ActiveRecord::Base
  has_many :stocks
  has_many :comments, :as => :commentable
  has_many :medicaments, :through => :stocks
  # , :select => "medicaments.*, stock.stock_price AS stock_price"
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  # attr_accessible :stock_list
  # acts_as_taggable_on :stocks
  # accepts_nested_attributes_for :medicaments, :reject_if => :all_blank, :allow_destroy => true
  # accepts_nested_attributes_for :stocks, :reject_if => :all_blank, :allow_destroy => true
end
