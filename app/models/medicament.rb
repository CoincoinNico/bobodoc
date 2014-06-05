class Medicament < ActiveRecord::Base
  has_many :stocks
  has_many :medicament_comments
  has_many :drugstores, :through => :stocks
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  # accepts_nested_attributes_for :stocks, :reject_if => :all_blank, :allow_destroy => true
  def self.search(search)
    where("name ILIKE ?","%#{search}%")
  end
end

