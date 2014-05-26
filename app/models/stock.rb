class Stock < ActiveRecord::Base
  belongs_to :drugstore
  belongs_to :medicament
end
