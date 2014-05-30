class Drugstore < ActiveRecord::Base
  has_many :stocks
  has_many :comments, :as => :commentable
  has_many :medicaments, :through => :stocks
  # , :select => "medicaments.*, stock.stock_price AS stock_price"
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
