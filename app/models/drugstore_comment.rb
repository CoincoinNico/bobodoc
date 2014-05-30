class DrugstoreComment < ActiveRecord::Base
	belongs_to :drugstore
	belongs_to :user
end
