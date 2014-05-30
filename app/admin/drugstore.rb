ActiveAdmin.register Drugstore do
  permit_params :id, :name, :address, :phone, :description, :created_at, :updated_at, medicaments_ids:[:id],
medicaments_attributes: [:id, :name, :form, :composition, :indication, :dose, :contraindication, :price, :created_at, :updated_at, :_update,:_create]

  index do
    column :id
    column "Nom", :name
    column "Adresse", :address
    column "Téléphone", :phone
    column "Description", :description
    column "Créée le", :created_at
    actions
  end

  # form do |f|
  #   f.inputs "Pharmacies - détails" do
  #     f.input :name
  #     f.input :description
  #     f.input :medicaments,
  #       :as => :select,
  #       :multiple => :check_boxes,
  #       # :collection => # here either a list of accepted keyword..or just left open,
  #       :input_html => { :class => "multiple-select" }
  #   end
  #   f.actions
  # end

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
