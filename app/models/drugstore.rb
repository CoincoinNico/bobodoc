class Drugstore < ActiveRecord::Base
  has_many :stocks
  has_many :drugstore_comments
  has_many :medicaments, :through => :stocks
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  # , :select => "medicaments.*, stock.stock_price AS stock_price"
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
