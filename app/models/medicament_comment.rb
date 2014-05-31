class MedicamentComment < ActiveRecord::Base
	belongs_to :medicament
	belongs_to :user
end
