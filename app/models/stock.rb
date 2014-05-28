class Stock < ActiveRecord::Base
  belongs_to :drugstore
  belongs_to :medicament
  after_save :update_cheapest

  def update_cheapest
    if medicament.cheapest
      medicament.cheapest = price if price < medicament.cheapest
    else
      medicament.cheapest = price
    end
    medicament.save
  end

end
