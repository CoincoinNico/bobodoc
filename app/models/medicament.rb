class Medicament < ActiveRecord::Base
  has_many :stocks
  has_many :drugstores, :through => :stocks
  # accepts_nested_attributes_for :stocks, :reject_if => :all_blank, :allow_destroy => true
  def self.search(search)
    where("name LIKE ?","%#{search}%")
  end
end

