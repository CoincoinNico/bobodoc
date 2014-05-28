ActiveAdmin.register Stock do
  permit_params :drugstore_id, :medicament_id, :position, :created_at, :updated_at, :price

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
  index do
    column :id
    column "Pharmacie", :drugstore_id
    column "Prix", :price
    column "Créée le", :created_at
    actions
  end

end