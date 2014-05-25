class Medicament < ActiveRecord::Base
  has_many :Drugstores
end
