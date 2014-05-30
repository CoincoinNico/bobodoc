ActiveAdmin.register Medicament do
  permit_params :id, :name, :form, :composition, :indication, :dose, :contraindication, :average_price, :created_at, :updated_at

  index do
    column :id
    column "Nom", :name
    column "Prix moyen", :average_price
    column "Créée le", :created_at
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
